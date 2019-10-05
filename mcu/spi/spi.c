/*
 * file: spi.c
 * author: Tyler Huddleston
 *  
 * This file includes the ATMega328 built-in SPI related functions.
 *
 */

#include <avr/io.h>
#include <string.h>
#include "../spi/spi.h"
#include "../io/mcu_io.h"
#include "../xbee/api_frame.h"

char    spi_miso_buf[64];
char    c_prev_rd_data;
char    rd_data;
uint8_t num_chars_rcv;   // number of characters received


// SPI initialization function
// Code modified from ATMega328 datasheet section 19
void spi_master_init(void)
{
	// Set SS_N, MOSI, and SCK output, all others input
	DDRB  = (1<<SPI_SS_N) | (1<<SPI_MOSI) | (1<<SPI_SCK);
	
	// set the SPI control register
	//   - SPE  = 1 --> SPI  enabled
	//   - MSTR = 1 --> SPI interface is in master mode
	//   - SPR0 = 1 --> SCK frequency is fosc/16
	SPCR  = (1<<SPE) | (1<<MSTR) | (1<<SPR0);
	
	// initialize global variables
	c_prev_rd_data = 0xFF;
	num_chars_rcv  = 0;
}


// SPI set slave select
// This is not performed automatically by the ATMega328.  SS_N should be set low
// during SPI transmission and set high when the transmission is complete.
void spi_set_ss_n(uint8_t ss_n)
{
	// set the SS_N pin
	if (ss_n == 1)
	{
		PORTB |= (1<<SPI_SS_N);
	}
	else
	{
		PORTB &= ~(1<<SPI_SS_N);
	}
}


// SPI transmit char cData
// Code modified from ATMega328 datasheet section 19
void spi_xmit(char cData)
{
	// Start transmission - writing SPI data register initiates transmission
	SPDR = cData;
	
	// Wait for transmission complete - wait until SPI interrupt flag is cleared
	while(!(SPSR & (1<<SPIF)));
	
	// Read SPI data buffer
	rd_data = SPDR;
	
	//spi_miso_buf[num_chars_rcv] = rd_data
	if ( rd_data == API_START || num_chars_rcv > 0 )
	{
		spi_miso_buf[num_chars_rcv] = rd_data;
		num_chars_rcv++;
	}
	
}


// SPI transmit string
// This function consecutively transmits each character in a string
void spi_xmit_string(char sData[])
{
	int l_data = strlen(sData);
	int i;
	
	spi_set_ss_n(0);
	
	for (i=0; i<l_data; i++)
	{
		spi_xmit(sData[i]);
	}
	
	spi_set_ss_n(1);
}

// SPI transmit string in API frame format
void spi_xmit_api_string(char sData[])
{
	int l_data = strlen(sData);   // length of data message
	int i      = 0;               // initialize loop increment variable
	int i_checksum = 0;           // initialize checksum
	int l_xmit = l_data + 14;     // length of api message (+14 bytes for type, id, address, etc.)
	
	char l_msb = (char) ((l_xmit & 0xFF00)>>8);     // 2-byte length value
	char l_lsb = (char) (l_xmit & 0xFF);
	
	char frame_type    = 0x10;                      // transmit request AT command
	char frame_id      = 0x01;                      // coordinator sends response
	char dest_addr[8]  = {0x00, 0x00, 0x00, 0x00,
						  0x00, 0X00, 0XFF, 0XFF};  // broadcast destination address
	char net_addr[2]   = {0xFF, 0xFE};              // broadcast network address
	char broad_radius  = 0x00;                      // max broadcast radius
	char options       = 0x00;                      // no options used
	
	// assert slave select
	spi_set_ss_n(0);
	
	
	// transmit AT frames not counted in checksum
	spi_xmit(API_START);
	spi_xmit(l_msb);
	spi_xmit(l_lsb);
	
	// transmit AT frames counted in checksum
	spi_xmit(frame_type);
	i_checksum += frame_type;
	
	spi_xmit(frame_id);
	i_checksum += frame_id;
	
	for(i=0; i<8; i++)
	{
		spi_xmit(dest_addr[i]);
		i_checksum += dest_addr[i];
	}
	
	for(i=0; i<2; i++)
	{
		spi_xmit(net_addr[i]);
		i_checksum += net_addr[i];
	}
	
	spi_xmit(broad_radius);
	i_checksum += broad_radius;
	
	spi_xmit(options);
	i_checksum += options;
	
	for (i=0; i<l_data; i++)
	{
		spi_xmit(sData[i]);
		i_checksum += sData[i];
	}
	
	// mask lower 8 bits and subtract from 0xFF
	char c_checksum = (char) (i_checksum & 0xFF);
	c_checksum = (char) (0xFF - c_checksum);
	
	// transmit calculated checksum
	spi_xmit(c_checksum);
	
	// deassert slave select
	spi_set_ss_n(1);
}

char* spi_read(void)
{
	int i = 0;
	static char spi_msg[64] = {};
	
	spi_set_ss_n(0);
	
	num_chars_rcv = 0;
	
	for(i = 0; i<64 && SPI_ATTN_N_LOW; i++)
	{
		SPDR = 0xFF;
		
		while(!(SPSR & (1<<SPIF)));
		
		// Read SPI data buffer
		rd_data = SPDR;
		
		//spi_miso_buf[num_chars_rcv] = rd_data
		if ( rd_data == API_START || num_chars_rcv > 0 )
		{
			spi_msg[num_chars_rcv] = rd_data;
			num_chars_rcv++;
		}
	}
	
	spi_set_ss_n(1);
	
	return spi_msg;
}