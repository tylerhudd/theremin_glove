/*
 * mcu_io.h
 *
 * Created: 10/04/2019 3:39:53 PM
 *  Author: tyler
 */ 


#ifndef API_FRAME_H
#define API_FRAME_H

#define API_START       0X7E
#define API_L_MSB       1
#define API_L_LSB       2
#define API_TYPE        3
#define API_STATUS      4
#define API_SRC_ADDR    4
#define API_XMIT_STATUS 8
#define API_NET_ADDR    12
#define API_RCV_OPTION  14
#define API_RCV_DATA    15

#define XBEE_MODEM_STATUS     0x8A
#define STATUS_HW_RST         0x00
#define STATUS_WDT_RST        0x01
#define STATUS_JOINED_NW      0x02
#define STATUS_DISASSOCIATED  0x03
#define STATUS_COORD_STARTED  0x06
#define STATUS_NETKEY_UPDATED 0x07
#define STATUS_OVERVOLTAGE    0x0D
#define STATUS_CFG_WHILE_JOIN 0x11
#define STATUS_BLE_CONNECT    0x32
#define STATUS_BLE_DISCONNECT 0x33
#define STATUS_STACK_ERROR    0x80

#define XBEE_XMIT_STATUS      0x8B
#define STATUS_SUCCESS        0X00
#define STATUS_MAC_ACK_FAIL   0X01
#define STATUS_CCA_FAIL       0x02
#define STATUS_INVALID_DEST   0x15
#define STATUS_NET_ACK_FAIL   0x21
#define STATUS_NOT_ON_NET     0x22
#define STATUS_SELF_ADDRESSED 0x23
#define STATUS_ADDR_NOT_FOUND 0x24
#define STATUS_RTE_NOT_FOUND  0x25
#define STATUS_NBR_FAIL       0x26
#define STATUS_INVALID_BIND   0x2B
#define STATUS_LACK_OF_RSRC1  0x2C
#define STATUS_ATT_BROAD_APS  0x2D
#define STATUS_ATT_UNI_APS    0X2E
#define STATUS_LACK_OF_RSRC2  0x32
#define STATUS_DATA_EXCEEDED  0x74
#define STATUS_UNREQUESTED    0x75

#define XBEE_RCV_PACKET       0x90
#define RCVOPT_PKT_ACK        0x01
#define RCVOPT_PKT_BROAD      0x02
#define RCVOPT_PKT_APS_ENC    0x20
#define RCVOPT_PKT_FRM_END    0x40


#endif /* API_FRAME_H */