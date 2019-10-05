

#ifndef SPI_H
#define SPI_H

#include <avr/io.h>
#include <string.h>
#include "../io/mcu_io.h"
#include "../xbee/api_frame.h"

// Set SS_N, MOSI, and SCK output, all others input
#define SPI_PINS_EN()  DDRB  = (1<<SPI_SS_N) | (1<<SPI_MOSI) | (1<<SPI_SCK)

// set the SPI control register
//   - SPE  = 1 --> SPI  enabled
//   - MSTR = 1 --> SPI interface is in master mode
//   - SPR0 = 1 --> SCK frequency is fosc/16
#define SPI_EN()       SPCR  = (1<<SPE) | (1<<MSTR) | (1<<SPR0);

// SPI conditional macros
#define SPI_ATTN_N_LOW !(PINB & (1<<SPI_ATTN_N))

// SPI pin set macros
#define SPI_SS_N_ASSERT()    PORTB &= ~(1<<SPI_SS_N)
#define SPI_SS_N_RELEASE()   PORTB |=  (1<<SPI_SS_N)

extern char    spi_miso_buf[MAX_API_FRAME_SIZE];  // received data buffer (64 bytes max)
extern uint8_t f_rcv_data_rdy;    // 0 = no new data to read,       1 = received data

void spi_master_init(void);
void spi_xmit(char cData);
void spi_set_ss_n(uint8_t ss_n);
void spi_xmit_string(char sData[]);
void spi_xmit_api_string(char sData[]);
void spi_xmit_api_byte(char cData);
char* spi_read(void);

#endif // SPI_H