/*
 * xbee_mcu_interfaces.c
 *
 * Created: 9/25/2019 7:19:34 PM
 * Author : tyler
 */ 

#define F_CPU 2000000UL
#define UBRR  F_CPU/16/BAUD-1

#define LED_OUT_EN()  DDRD  |=  (1<<LED0)|(1<<LED1)
#define BTN_IN_EN()   DDRC  &= ~(1<<BTN0)|(1<<BTN1)

#define LED0_ON()  PORTD &= ~(1<<LED0)
#define LED0_OFF() PORTD |=  (1<<LED0)
#define LED1_ON()  PORTD &= ~(1<<LED1)
#define LED1_OFF() PORTD |=  (1<<LED1)

#define BTN0_PRESSED !(PINC & (1<<BTN0))
#define BTN1_PRESSED !(PINC & (1<<BTN1))

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <string.h>
#include "../../uart/uart.h"
#include "../../spi/spi.h"
#include "../../xbee/xbee.h"
#include "../../xbee/api_frame.h"
#include "../../i2c/i2c.h"
#include "../../i2c/LSM6DS3.h"
#include "../../io/mcu_io.h"

#define _ECHO    0

char spi_miso_buf[MAX_API_FRAME_SIZE];
int  toggle_led0 = 0;
int  toggle_led1 = 0;

ISR(USART_RX_vect)
{
	char rxdata = (char)getByte();
	char rfTX[2] = {rxdata,'\0'};
	
	spi_xmit_api_string(rfTX);
	#if _ECHO
		putByte(rxdata);	// echo in terminal
	#endif
}

ISR(PCINT1_vect) {
	
	if (BTN0_PRESSED)  { toggle_led0 = 1;  }
		
	if (BTN1_PRESSED)  { toggle_led1 = 1;  }
		
	_delay_ms(100);  // debounce delay
}

int main(void)
{
	// enable all interrupts
	sei();
	
	// enable uart interrupt
	RX_INTEN();
	
	// initialize UART interface
	initUART();
	
    // initialize SPI as master
	spi_master_init();
	
	// configure XBee to SPI mode
	xbee_config_spi();
	
	// initialize i2c interface
	i2c_master_init();
	
	LED_OUT_EN();
	BTN_IN_EN();
	
	// pin change interrupt enable
	PCICR |= (1<<PCIE1);
	PCMSK1 |= (1<<PCINT8)|(1<<PCINT9);
	
    while (1) 
    {

 		if (SPI_ATTN_N_LOW)
 		{
	 		char* spi_rxdata = api_frame_decode((spi_read()));
	 		
	 		if (strcmp(spi_rxdata, "TX GOOD") != 0)
	 		{
		 		writeString(spi_rxdata);
	 		}
 		}
 		
		if (toggle_led0)
		{
			PORTD ^= (1<<LED0);
			toggle_led0 = 0;
			putByte(i2c_read_byte(LSM6DS3_ADDR, LSM6DS3_ID));
		}
		
		if (toggle_led1)
		{
			PORTD ^= (1<<LED1);
			toggle_led1 = 0;
			putByte(65);
		}
		
		_delay_ms(1);
    }
	
	return 0;
}

