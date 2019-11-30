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
#define BTN2       DDC2		   // BUTTON2    --> PC2
#define BTN3	   DDC3        // BUTTON3    --> PC3

// LEDs

#define LED0       DDD2         // LED0      --> PD2
#define LED1       DDD3         // LED1      --> PD3

// Synth digital interface
#define I2C_INT_N	 DDD4					// I2C INT	 --> PD4
#define LDAC_N		 DDD5					// LOAD DAC	 --> PD5

#define LDAC_OUT_EN() DDRD  |=   (1<<LDAC_N) // set LDAC_N as output
#define LDAC_N_ON()   PORTD &=  ~(1<<LDAC_N)
#define LDAC_N_OFF()  PORTD |=   (1<<LDAC_N)


// IO enable macros
#define LED_OUT_EN()  DDRD  |=  (1<<LED0)|(1<<LED1)
#define BTN_IN_EN()   DDRC  &= ~(1<<BTN0)|(1<<BTN1)|(1<<BTN2)|(1<<BTN3)

// LED toggle macros
#define LED0_ON()  PORTD &= ~(1<<LED0)
#define LED0_OFF() PORTD |=  (1<<LED0)
#define LED1_ON()  PORTD &= ~(1<<LED1)
#define LED1_OFF() PORTD |=  (1<<LED1)

// Detect button press macros
#define BTN0_PRESSED !(PINC & (1<<BTN0))
#define BTN1_PRESSED !(PINC & (1<<BTN1))
#define BTN2_PRESSED !(PINC & (1<<BTN2))
#define BTN3_PRESSED !(PINC & (1<<BTN3))

// pin change interrupt enable
#define BTN_INT_EN() PCICR  |= (1<<PCIE1)
#define BTN_INTMSK() PCMSK1 |= (1<<PCINT8)|(1<<PCINT9)|(1<<PCINT10)|(1<<PCINT11)

#endif /* MCU_IO_H_ */