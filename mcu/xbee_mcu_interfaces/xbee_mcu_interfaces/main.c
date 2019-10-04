/*
 * xbee_mcu_interfaces.c
 *
 * Created: 9/25/2019 7:19:34 PM
 * Author : tyler
 */ 

#define F_CPU 1000000UL
#define UBRR  F_CPU/16/BAUD-1

#include <avr/io.h>
#include <util/delay.h>
#include "../../uart/uart.h"
#include "../../spi/spi.h"
#include "../../xbee/xbee.h"
#include "../../io/mcu_io.h"

char spi_miso_buf[64];

int main(void)
{
	
	// initialize UART interface
	initUART();
	
    // initialize SPI as master
	spi_master_init();
	
	// initialize XBee to SPI mode
	xbee_config_spi();
	
	// read back modem status to verify configuration
	//while( !(PINB & (1<<SPI_ATTN_N)) )
	//{
		//spi_set_ss_n(0);
		//char xbee_modem_status = spi_xmit(0xFF);
		//spi_set_ss_n(1);
		//spi_xmit_string("xbee_modem_status");
	//}
	
    while (1) 
    {
		//writeString("repeating main loop\r\n");
		
		// transmit to xbee
		spi_xmit_api_string("Hello world!");
		writeString(api_frame_decode(spi_miso_buf));
		_delay_ms(1000);
    }
	
	return 0;
}

