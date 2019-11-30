/*
 * file: i2c.c
 * author: Tyler Huddleston
 *  
 * This file includes the ATMega328 built-in I2C related functions.
 *
 */

#include "../i2c/i2c.h"

// initialize I2C interface
void i2c_master_init(void)
{
	TWBR = 2;			// set the division factor to 2 for SCL = 100kHz
	TWSR = 0;			// additional prescaler not needed
	I2C_EN();
}

// generate start condition on I2C bus
void i2c_start_cmd(void)
{
	I2C_START();
	while (I2C_BUSY());
}

// generate stop condition on I2C bus
void i2c_stop_cmd(void)
{
	I2C_STOP();
}

// i2c write command
void i2c_write(uint8_t data)
{
	TWDR = data;
	TWCR = (1<<TWINT) | (1<<TWEN);
	while (I2C_BUSY());
}

// i2c read command with ACK
uint8_t i2c_read_ack(void)
{
	TWCR = (1<<TWINT) | (1<<TWEN) | (1<<TWEA);
	while (I2C_BUSY());
	return TWDR;
}

//  i2c read command with NACK
uint8_t i2c_read_nack(void)
{
	TWCR = (1<<TWINT) | (1<<TWEN);
	while (I2C_BUSY());
	return TWDR;
}

// read i2c status register
uint8_t i2c_get_status(void)
{
	uint8_t status;
	status = TWSR & 0XF8;
	return status;
}

// write one byte without address byte to i2c bus
void i2c_write_byte_no_addr(uint8_t device, uint8_t data)
{
	i2c_start_cmd();
	i2c_write( (device<<1) );
	i2c_write(data);
	i2c_stop_cmd();
}

// write one byte to i2c bus
void i2c_write_byte(uint8_t device, uint8_t addr, uint8_t data)
{
	i2c_start_cmd();
	i2c_write( (device<<1) );
	i2c_write(addr);
	i2c_write(data);
	i2c_stop_cmd();
}

// write two bytes to i2c bus
void i2c_write_two(uint8_t device, uint8_t addr, uint8_t data1, uint8_t data2)
{
	i2c_start_cmd();
	i2c_write( (device<<1) );
	i2c_write(addr);
	i2c_write(data1);
	i2c_write(data2);
	i2c_stop_cmd();
}

// read one byte from i2c bus
uint8_t i2c_read_byte(uint8_t device, uint8_t addr)
{
	uint8_t rd_data = 0;
	
	i2c_start_cmd();
	i2c_write( (device<<1) );
	i2c_write(addr);
	i2c_start_cmd();
	i2c_write( (device<<1) | 1);
	rd_data = i2c_read_nack();
	i2c_stop_cmd();
	
	return rd_data;
}