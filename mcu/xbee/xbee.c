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


const char* api_frame_decode(char *frame)
{
	int l_msg = 0;
	int checksum = 0;
	char* msg;
	
	// byte 1 is the start command
	if (*frame == 0x7E)
	{
		// bytes 1 and 2 are length MSB and LSB
		l_msg = ( (int) *(frame+1) << 8) + (int) *(frame+2);
		
		// calculate checksum
		for (int i = 0; i <= l_msg; i ++)
		{
			checksum += *(frame+3+i);
		}
		
		if ( (0xFF & (checksum)) == 0xFF )
		{
		    // check frame type
			switch ( *(frame+3) )
			{
				// modem status frame
				case 0x8A:
					switch ( *(frame+4) )
					{
						case 0x00: return "Modem: Hardware reset\r\n";					break;
						case 0x01: return "Modem: Watchdog timer reset\r\n";			break;
						case 0x02: return "Modem: Joined network\r\n";					break;
						case 0x03: return "Modem: Disassociated\r\n";					break;
						case 0x06: return "Modem: Coordinator started\r\n";				break;
						case 0x07: return "Modem: Network security key updated\r\n";	break;
						case 0x0D: return "Modem: Voltage supply limit exceeded\r\n";	break;
						case 0x11: return "Modem: Configuration changed\r\n";			break;
						case 0x32: return "Modem: BLE Connect\r\n";						break;
						case 0x33: return "Modem: BLE Disconnect\r\n";					break;
						case 0x80: return "Modem: Stack error\r\n";						break;
					}
					break;
					
				// transmit status frame
				case 0x8B:
					if ( *(frame+8) == 0x00) { return "Transmission successful\r\n"; }
					else                     { return "ERROR: transmission not successful\r\n"; }
					break;
				
				// receive packet frame
				case 0x90:
					for(int i = 0; i < l_msg; i++)
					{
						*(msg+i) = *(frame+15+i);
					}
					return msg;
					break;
					
				default: return "WARNING: Unexpected frame type";
			}
			
		}
		else { return "ERROR: invalid checksum\r\n"; }
			
	}
	else { return "ERROR: invalid start\r\n"; }
		
	return "ERROR\r\n";
	
}