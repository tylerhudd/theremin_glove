

#ifndef SPI_H
#define SPI_H

#define SPI_ATTN_N_LOW !(PINB & (1<<SPI_ATTN_N))

extern char    spi_miso_buf[64];  // received data buffer (64 bytes max)
extern uint8_t f_rcv_data_rdy;    // 0 = no new data to read,       1 = received data

void spi_master_init(void);
void spi_xmit(char cData);
void spi_set_ss_n(uint8_t ss_n);
void spi_xmit_string(char sData[]);
void spi_xmit_api_string(char sData[]);
void spi_xmit_api_byte(char cData);
char* spi_read(void);

#endif // SPI_H