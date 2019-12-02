/*
 * xbee_mcu_interfaces.c
 *
 * Created: 9/25/2019 7:19:34 PM
 * Author : tyler
 */ 

/****** COMPILER VARIABLES ******/
#define _ECHO    0
#define _GLOVE   0
#define _UART_ON 0

/****** GLOBAL DEFINITIONS ******/
// 2 MHz clock - 16 MHz external crystal w/ divide by 8 fuse enabled
#define F_CPU 2000000UL

#if _GLOVE
	#define UBRR  F_CPU/16/BAUD-1
#endif

/****** INCLUDE FILES ******/
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <string.h>
#include "../../spi/spi.h"
#include "../../xbee/xbee.h"
#include "../../xbee/api_frame.h"
#include "../../i2c/i2c.h"
#include "../../io/mcu_io.h"

#if _UART_ON
	#include "../../uart/uart.h"
#endif

#if _GLOVE
	#include "../../i2c/LSM6DS3.h"
	#include "../../io/adc.h"
#else
	#include "../../i2c/AD5694.h"
	#include "../../i2c/PCF8574.h"
#endif

/***** GLOBAL VARIABLES ******/
uint8_t  btn0_flag     = 0;
uint8_t  btn1_flag     = 0;
uint8_t  btn2_flag     = 0;
uint8_t  btn3_flag     = 0;
uint8_t  new_data_flag = 0;
uint8_t  rcv_btn_flag  = 0;
uint8_t  rcv_btn       = 0;
uint8_t  waveform      = 0;
uint8_t  audio_on      = 0;
 int16_t prev_z        = 0;
uint16_t vco_ctrl      = 8000;

#if _GLOVE
	char  xmit_data[15] = {0};
#else
	char  spi_miso_buf[MAX_API_FRAME_SIZE];
	char  sns_data[15] = {0};
#endif

/***** INTERRUPTS *****/
#if _UART_ON
ISR(USART_RX_vect)
{
	char rxdata = (char)getByte();
	char rfTX[2] = {rxdata,'\0'};
	
	spi_xmit_api_string(rfTX);
	#if _ECHO
		putByte(rxdata);	// echo in terminal
	#endif
}
#endif

// enable button push interrupts
ISR(PCINT1_vect) {
	if (BTN0_PRESSED)  { btn0_flag = 1; }
	if (BTN1_PRESSED)  { btn1_flag = 1; }
	if (BTN2_PRESSED)  { btn2_flag = 1; }
	if (BTN3_PRESSED)  { btn3_flag = 1; }
	_delay_ms(100);  // debounce delay
}

/****** FUNCTION DECLARATIONS *****/
void config_io(void);

/****** MAIN FUNCTION ******/
int main(void)
{
	config_io();
	
    while (1) 
    {
		/****** CHECK SPI BUS ******/
 		if (SPI_ATTN_N_LOW)
 		{
	 		char* spi_rxdata = api_frame_decode((spi_read()));
	 		
	 		if (strcmp(spi_rxdata, "TX GOOD") != 0)
	 		{
		 		new_data_flag = 1;
				 #if _GLOVE
					
				 #else
		 			switch (spi_rxdata[0])
					{
						//case '0':	strcpy(sns_data,spi_rxdata);	break;
						case '0':
							for(uint8_t i=0; i<15; i++)
							{
								sns_data[i] = spi_rxdata[i];
							}
							break;
						case '1':
							rcv_btn_flag = 1;
							rcv_btn      = spi_rxdata[1];
							break;
						default:		break;
					}
				 #endif
	 		}
 		}
 		
		if (btn0_flag)
		{
			PORTD ^= (1<<LED0);
			btn0_flag = 0;
			#if _GLOVE
			char btn_data[2] = {'1','0'};
			spi_xmit_api_string(btn_data);
			#endif
		}
		
		if (btn1_flag)
		{
			PORTD ^= (1<<LED1);
			btn1_flag = 0;
		}
		
		if (btn2_flag)
		{
			PORTD ^= (1<<LED0);
			btn2_flag = 0;
		}
		
		if (btn3_flag)
		{
			PORTD ^= (1<<LED1);
			btn3_flag = 0;
			#if _GLOVE
				char btn_data[2] = {'1','3'};
				spi_xmit_api_string(btn_data);
			#endif
		}
		
		#if _GLOVE
			char* ag_data       = read_gyroacc();
			// set type of transmission byte (ASCII 0 = sensor data)
			xmit_data[0] = '0';
 			// place accelerometer and gyroscope data into transmit data buffer
 			for (uint8_t i = 0; i < 12; i++)
 			{
 				xmit_data[i+1] = ag_data[i];
 			}
 			// read and store flex sensor
 			ADC_STRT();
 			while( ADCSRA & (1<<ADSC) );
 			xmit_data[14] = ADC>>8;
 			xmit_data[13] = ADC & 0xFF;
 			// transmit sensor data
 			spi_xmit_api_string(xmit_data);
		#else
			if (new_data_flag)
			{
				 int16_t g_x      = ( (sns_data[ 2]<<8) | sns_data[ 1]);
				 int16_t g_y      = ( (sns_data[ 4]<<8) | sns_data[ 3]);
				 int16_t g_z      = ( (sns_data[ 6]<<8) | sns_data[ 5]);
				 int16_t a_x      = ( (sns_data[ 8]<<8) | sns_data[ 7]);
				 int16_t a_y      = ( (sns_data[10]<<8) | sns_data[ 9]);
				 int16_t a_z      = ( (sns_data[12]<<8) | sns_data[11]);
				uint16_t adc_data = ( (sns_data[14]<<8) | sns_data[13]);
				#if _UART_ON
					writeString("GX: ");
					writeNum(g_x);
					writeString("\t\tGY: ");
					writeNum(g_y);
					writeString("\t\tGZ: ");
					writeNum(g_z);
					writeString("\t\tAX: ");
					writeNum(a_x);
					writeString("\t\tAY: ");
					writeNum(a_y);
					writeString("\t\tAZ: ");
					writeNum(a_z);
	 				writeString("\t\tADC: ");
	 				writeNum(int16_t(adc_data));
					writeString("\r\n");
				#endif
				
				a_z      = a_z << 1;
				adc_data = adc_data << 2;
				
				if (audio_on)
				{
					i2c_write_two(AD5694_ADDR, (DAC_WR_UPDATE|DAC_VCA), (adc_data>>8), (adc_data & 0xFF));
					i2c_write_two(AD5694_ADDR, (DAC_WR_UPDATE|DAC_VCO), (a_z>>8), (a_z & 0xFF));
				}
				else
				{
					i2c_write_two(AD5694_ADDR, (DAC_WR_UPDATE|DAC_VCA), 0x00, 0x00);
					i2c_write_two(AD5694_ADDR, (DAC_WR_UPDATE|DAC_VCO), 0x00, 0x00);
				}
				
				new_data_flag = 0;
			}
			if (rcv_btn_flag)
			{
				switch (rcv_btn)
				{
					case '0':
						audio_on ^= 0x01;
						break;
					case '1': break;
					case '2': break;
					case '3':
						switch (waveform)
						{
							case 0:
								i2c_write_byte_no_addr(PCF8574A_ADDR, (WF_SIN | FLT_DIR) );
								waveform ++;
								break;
							case 1:
								i2c_write_byte_no_addr(PCF8574A_ADDR, (WF_SQR | FLT_DIR) );
								waveform = 0;
								break;
							default:  break;
						}
						break;
					default:  break;
				}
				rcv_btn_flag = 0;
			}
		#endif
	
		#if _GLOVE
			_delay_ms(50);
		#else
			_delay_ms(1);
		#endif
    }
	
	return 0;
}


void config_io(void)
{
	// enable all interrupts
	sei();

	// initialize SPI as master
	spi_master_init();
	// configure XBee to SPI mode
	xbee_config_spi();
	// initialize i2c interface
	i2c_master_init();
	// enable LED and button IO and interrupts
	LED_OUT_EN();
	BTN_IN_EN();
	BTN_INT_EN();
	BTN_INTMSK();
	
	#if _UART_ON
		// enable uart interrupt
		RX_INTEN();
		// initialize UART interface
		initUART();
	#endif

	#if _GLOVE
		// configure 6DoF
		LSM6DS3_init();
		// enable ADC
		ADC_IN1_SEL();
		ADC_EN();
	#else
		// set LOAD DAC signal
		LDAC_OUT_EN();
		LDAC_N_ON();
		i2c_write_byte_no_addr(PCF8574A_ADDR, (WF_SIN | FLT_DIR) );
		i2c_write_two(AD5694_ADDR, DAC_PWR,                 0x00, 0x00);
		i2c_write_two(AD5694_ADDR, (DAC_WR_UPDATE|DAC_VCO), 0x20, 0x80);
		i2c_write_two(AD5694_ADDR, (DAC_WR_UPDATE|DAC_VCF), 0x08, 0x80);
		i2c_write_two(AD5694_ADDR, (DAC_WR_UPDATE|DAC_VCA), 0x00, 0x80);
	#endif
}