/*
 * mcu_io.h
 *
 * Created: 9/26/2019 10:06:53 PM
 *  Author: tyler
 */ 


#ifndef MCU_IO_H_
#define MCU_IO_H_

// Define XBee3 SPI interface

#define SPI_ATTN_N  DDB1		//  ATTN_N --> PB1
#define SPI_SS_N    DDB2		//  SS_N   --> PB2
#define SPI_MOSI    DDB3		//  MOSI   --> PB3
#define SPI_MISO    DDB4		//  MISO   --> PB4
#define SPI_SCK     DDB5		//  SCK    --> PB5


// Other XBee interface

#define XBEE_DOUT   DDD6		// XBEE_DOUT  --> PD6
#define XBEE_RST_N  DDD7		// XBEE RST_N --> PD7



#endif /* MCU_IO_H_ */