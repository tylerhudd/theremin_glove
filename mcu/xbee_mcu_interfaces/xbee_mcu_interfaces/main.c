/*
 * xbee_mcu_interfaces.c
 *
 * Created: 9/25/2019 7:19:34 PM
 * Author : tyler
 */ 

#define F_CPU 1000000UL
#define UBRR  F_CPU/16/BAUD-1

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "../../uart/uart.h"
#include "../../spi/spi.h"
#include "../../xbee/xbee.h"
#include "../../io/mcu_io.h"

char spi_miso_buf[64];

ISR(USART_RX_vect)
{
	char rxdata = (char)getByte();
	char rfTX[3] = {rxdata,'\r','\n'};
		
	spi_xmit_api_string(rfTX);
	putByte(rxdata);
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
	
	// initialize XBee to SPI mode
	xbee_config_spi();
	
	spi_read();
	
    while (1) 
    {
		// transmit to xbee
		//spi_xmit_api_string("Hello world!\r\n");
		//writeString(api_frame_decode(spi_miso_buf));
		
		if (SPI_ATTN_N_LOW)
		{
			writeString(api_frame_decode(spi_read()));
			//writeString(spi_read());
			//writeString("it's low\r\n");
		}
		
		_delay_ms(100);
    }
	
	return 0;
}

