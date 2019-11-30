#ifndef I2C_H
#define I2C_H

#include <avr/io.h>
#include <string.h>
#include "../io/mcu_io.h"

// enable I2C interface
#define I2C_EN()		TWCR = (1<<TWEN)
// clear interrupt and start transmit
#define I2C_START()		TWCR = (1<<TWINT) | (1<<TWSTA) | (1<<TWEN)
// clear interrupt and stop transmit
#define I2C_STOP()		TWCR = (1<<TWINT) | (1<<TWSTO) | (1<<TWEN)
// check i2c interrupt
#define I2C_BUSY()		(TWCR & (1<<TWINT)) == 0

// initialize I2C interface
void i2c_master_init(void);

// generate start condition on I2C bus
void i2c_start_cmd(void);

// generate stop condition on I2C bus
void i2c_stop_cmd(void);

// i2c write command
void i2c_write(uint8_t data);

// i2c read command with ACK
uint8_t i2c_read_ack(void);

//  i2c read command with NACK
uint8_t i2c_read_nack(void);

// read i2c status register
uint8_t i2c_get_status(void);

// write one byte without address byte to i2c bus
void i2c_write_byte_no_addr(uint8_t device, uint8_t data);

// write one byte to i2c bus
void i2c_write_byte(uint8_t device, uint8_t addr, uint8_t data);

// write two bytes to i2c bus
void i2c_write_two(uint8_t device, uint8_t addr, uint8_t data1, uint8_t data2);

// read one byte from i2c bus
uint8_t i2c_read_byte(uint8_t device, uint8_t addr);

#endif // I2C_H