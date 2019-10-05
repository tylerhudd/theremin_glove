/*
 * xbee.c
 *
 * Created: 9/26/2019 8:58:18 PM
 *  Author: tyler
 */ 

#include <avr/io.h>
#include "../io/mcu_io.h"
#include "../xbee/api_frame.h"


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
	while ( (PINB & (1<<SPI_ATTN_N)) == SPI_ATTN_N );
	
	// set DOUT pin to input
	DDRD  &=  ~(1<<XBEE_DOUT);
	
	// release reset
	PORTD |= (1<<XBEE_RST_N);
}


char* api_frame_decode(char *frame)
{
	int l_msg = 0;
	int checksum = 0;
	static char msg[64] = {};
	// byte 1 is the start command
	if (*frame == API_START)
	{
		// bytes 1 and 2 are length MSB and LSB
		l_msg = ( (int) *(frame+API_L_MSB) << 8) + (int) *(frame+API_L_LSB);
		
		// calculate checksum
		for (int i = 0; i <= l_msg; i ++)
		{
			checksum += *(frame+API_TYPE+i);
		}
		
		if ( (0xFF & (checksum)) == 0xFF )
		{
		    // check frame type
			switch ( *(frame+API_TYPE) )
			{
				case XBEE_CMD:				return "Type:\tAT Command Frame\r\n";						break;
				case XBEE_CMD_VALUE:		return "Type:\tAT Command-Queue Parameter Value Frame\r\n";	break;
				case XBEE_XMIT_REQUEST:		return "Type:\tTransmit Request Frame\r\n";					break;
				case XBEE_ADDR_CMD:			return "Type:\tExplicit Addressing Command Frame\r\n";		break;
				case XBEE_RMT_CMD_REQUEST:	return "Type:\tRemote AT Command Request Frame\r\n";		break;
				case XBEE_CREATE_SRC:		return "Type:\tCreate Source Route\r\n";					break;
				case XBEE_REG_JOINING_DEV:	return "Type:\tRegister Joining Device\r\n";				break;
				case XBEE_BLE_UNLOCK_API:	return "Type:\tBLE Unlock API Frame\r\n";					break;
				case XBEE_CMD_RESPONSE:		return "Type:\tAT Command Response Frame\r\n";				break;
				
				case XBEE_MODEM_STATUS:
					switch ( *(frame+API_STATUS) )
					{
						case STATUS_HW_RST:         return "Modem:\tHardware reset\r\n";				break;
						case STATUS_WDT_RST:        return "Modem:\tWatchdog timer reset\r\n";			break;
						case STATUS_JOINED_NW:      return "Modem:\tJoined network\r\n";				break;
						case STATUS_DISASSOCIATED:  return "Modem:\tDisassociated\r\n";					break;
						case STATUS_COORD_STARTED:  return "Modem:\tCoordinator started\r\n";			break;
						case STATUS_NETKEY_UPDATED: return "Modem:\tNetwork security key updated\r\n";	break;
						case STATUS_OVERVOLTAGE:    return "Modem:\tVoltage supply limit exceeded\r\n";	break;
						case STATUS_CFG_WHILE_JOIN: return "Modem:\tConfiguration changed\r\n";			break;
						case STATUS_BLE_CONNECT:    return "Modem:\tBLE Connect\r\n";					break;
						case STATUS_BLE_DISCONNECT: return "Modem:\tBLE Disconnect\r\n";				break;
						case STATUS_STACK_ERROR:    return "Modem:\tStack error\r\n";					break;
					}
					break;
					
				case XBEE_XMIT_STATUS:
					switch( *(frame+API_XMIT_STATUS) )
					{
						case STATUS_SUCCESS:		return "Xmit:\tSuccessful\r\n";						break;
						case STATUS_MAC_ACK_FAIL:	return "Xmit:\tMAC ACK Failure\r\n";				break;
						case STATUS_CCA_FAIL:		return "Xmit:\tCCA Failure\r\n";					break;
						case STATUS_INVALID_DEST:	return "Xmit:\tInvalid destination endpoint\r\n";	break;
						case STATUS_NET_ACK_FAIL:	return "Xmit:\tNetwork ACK Failure ";				break;
						case STATUS_NOT_ON_NET:		return "Xmit:\tNot Joined to Network";				break;
						case STATUS_SELF_ADDRESSED: return "Xmit:\tSelf-addressed";						break;
						case STATUS_ADDR_NOT_FOUND:	return "Xmit:\tAddress Not Found";					break;
						case STATUS_RTE_NOT_FOUND:	return "Xmit:\tRoute Not Found";					break;
						case STATUS_NBR_FAIL:		return "Xmit:\tFailed to hear neighbor relay";		break;
						case STATUS_INVALID_BIND:	return "Xmit:\tInvalid binding table index";		break;
						case STATUS_LACK_OF_RSRC1:  return "Xmit:\tLack of free resources (1)";			break;
						case STATUS_ATT_BROAD_APS:	return "Xmit:\tAttempted broadcast with APS";		break;
						case STATUS_ATT_UNI_APS:	return "Xmit:\tAttempted Unicast with APS EE=0";	break;
						case STATUS_LACK_OF_RSRC2:	return "Xmit:\tLack of free resources (2)";			break;
						case STATUS_DATA_EXCEEDED:	return "Xmit:\tData payload too large";				break;
						case STATUS_UNREQUESTED:	return "Xmit:\tIndirect message unrequested";		break;
					}
					break;
				
				case XBEE_RX:
					for(int i = 0; i < l_msg-5; i++)
					{
						msg[i] = *(frame+API_RCV_DATA+i);
					}
					return msg;
					break;
				
				case XBEE_RX_PKT:
					for(int i = 0; i < l_msg; i++)
					{
						//*(msg+i) = *(frame+API_RCV_DATA+i);
					}
					return msg;
					break;
					
				case XBEE_EXP_RX_INDICATOR: return "Type:\tExplicit RX Indicator Frame\r\n";			break;
				case XBEE_IO_SAMPLE_RX:		return "Type:\tIO Data SAmple RX Indicator Frame\r\n";		break; 
				case XBEE_NODE_ID:			return "Type:\tNode Identification Indicator Frame\r\n";	break;
				case XBEE_RMT_CMD_RESPONSE:	return "Type:\tRemote Command Response Frame\r\n";			break;
				case XBEE_EX_MODEM_STATUS:	return "Type:\tExtended Modem Status Frame\r\n";			break;
				case XBEE_ROUTE_RECORD:		return "Type:\tRoute Record Indicator\r\n";					break;
				case XBEE_REG_DEV_STATUS:	return "Type:\tRegister Device Status\r\n";					break;
				case XBEE_MANY2ONE_ROUTE:	return "Type:\tMany-to-One Route Request Indicator\r\n";	break;
				case XBEE_BLE_UNLOCK_RSP:	return "Type:\tBLE Unlock Response Frame\r\n";				break;
				case XBEE_USER_DATA_RELAY:	return "Type:\tUser Data Relay Output\r\n";					break;
					
				default: return "WARNING: Unexpected frame type\r\n";
			}
			
		}
		else { return "ERROR: invalid checksum\r\n"; }
			
	}
	else { return "ERROR: invalid start\r\n"; }
		
	return "ERROR\r\n";
	
}