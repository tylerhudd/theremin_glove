/*
 * xbee.c
 *
 * Created: 9/26/2019 8:58:18 PM
 *  Author: tyler
 */ 

#include <avr/io.h>
#include "../io/mcu_io.h"


// Following  SPI operation guidelines in XBee3 User Guide:
// Force SPI mode by holding DOUT low while resetting, until SPI_ATTN_N asserts
void xbee_config_spi(void)
{
	// set reset to XBee as output and assert low
	DDRD  |=  (1<<XBEE_RST_N);
	PORTD &= ~(1<<XBEE_RST_N);
	
	// set DOUT to XBee as output and assert low
	DDRD  |=  (1<<XBEE_DOUT);
	PORTD &= ~(1<<XBEE_DOUT);
	
	// wait for ATTN_N to be asserted low
	while ( (PINB & (1<<SPI_ATTN_N)));
	
	// set DOUT pin to input
	DDRD  &=  ~(1<<XBEE_DOUT);
	
	// release reset
	PORTD |= (1<<XBEE_RST_N);
}