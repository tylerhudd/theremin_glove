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

// Buttons

#define BTN0       DDC0        // BUTTON0    --> PC0
#define BTN1       DDC1        // BUTTON1    --> PC1
#define BTN2       DDC2				 // BUTTON2		 --> PC2
#define BTN3			 DDC3				 // BUTTON3		 --> PC3

// LEDs

#define LED0       DDD2         // LED0      --> PD2
#define LED1       DDD3         // LED1      --> PD3

// Synth digital interface
#define I2C_INT_N	 DDD4					// I2C INT	 --> PD4
#define LDAC_N		 DDD5					// LOAD DAC	 --> PD5

#endif /* MCU_IO_H_ */