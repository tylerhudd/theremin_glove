/*
 * file: spi.c
 * author: Tyler Huddleston
 *  
 * This file includes the ATMega328 built-in SPI related functions.
 *
 */

#include "../spi/spi.h"

char    spi_miso_buf[MAX_API_FRAME_SIZE];
char    rd_data;
uint8_t num_chars_rcv;   // number of characters received


// SPI initialization function
// Code modified from ATMega328 datasheet section 19
void spi_master_init(void)
{
	SPI_PINS_EN();
	
	SPI_EN();
	
	// initialize global variables
	num_chars_rcv  = 0;
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
	
	SPI_SS_N_ASSERT();
	
	for (i=0; i<l_data; i++)
	{
		spi_xmit(sData[i]);
	}
	
	SPI_SS_N_RELEASE();
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
	
	SPI_SS_N_ASSERT();
	
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
	
	SPI_SS_N_RELEASE();
}

char* spi_read(void)
{
	int i = 0;
	static char spi_msg[64] = {};
	
	SPI_SS_N_ASSERT();
	
	num_chars_rcv = 0;
	
	for(i = 0; i<MAX_API_FRAME_SIZE && SPI_ATTN_N_LOW; i++)
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
	
	SPI_SS_N_RELEASE();
	
	return spi_msg;
}