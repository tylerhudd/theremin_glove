

#ifndef SPI_H
#define SPI_H

void spi_master_init(void);
char spi_xmit(char cData);
void spi_set_ss_n(uint8_t ss_n);
void spi_xmit_string(char sData[]);
void spi_xmit_api_string(char sData[]);

#endif // SPI_H