/*
 * file: LSM6DS3.c
 * author: Tyler Huddleston
 */

#include "../i2c/LSM6DS3.h"

// read 6DoF temperature
uint8_t* read_temp(void)
{
	uint8_t temp[2] = {0};
	
	i2c_start_cmd();
	i2c_write( (LSM6DS3_ADDR<<1) );
	i2c_write(OUT_TEMP_L);
	i2c_start_cmd();
	i2c_write( (LSM6DS3_ADDR<<1) | 1);
	temp[0] = i2c_read_ack();
	temp[1] = i2c_read_nack();
	i2c_stop_cmd();
	
	return temp;
}

// read 6DoF gyroscope
uint8_t* read_gyro(void)
{
	uint8_t gyro[6] = {0};
	
	i2c_start_cmd();
	i2c_write( (LSM6DS3_ADDR<<1) );
	i2c_write(OUTX_L_G);
	i2c_start_cmd();
	i2c_write( (LSM6DS3_ADDR<<1) | 1);
	gyro[0] = i2c_read_ack();
	gyro[1] = i2c_read_ack();
	gyro[2] = i2c_read_ack();
	gyro[3] = i2c_read_ack();
	gyro[4] = i2c_read_ack();
	gyro[5] = i2c_read_nack();
	i2c_stop_cmd();
	
	return gyro;
}

// read 6DoF accelerometer
uint8_t* read_acc(void)
{
	uint8_t acc[6] = {0};
	
	i2c_start_cmd();
	i2c_write( (LSM6DS3_ADDR<<1) );
	i2c_write(OUTX_L_XL);
	i2c_start_cmd();
	i2c_write( (LSM6DS3_ADDR<<1) | 1);
	acc[0] = i2c_read_ack();
	acc[1] = i2c_read_ack();
	acc[2] = i2c_read_ack();
	acc[3] = i2c_read_ack();
	acc[4] = i2c_read_ack();
	acc[5] = i2c_read_nack();
	i2c_stop_cmd();
	
	return acc;
}

// read 6DoF gyroscope and acceleroemter
uint8_t* read_gyroacc(void)
{
	uint8_t data[12] = {0};
	
	i2c_start_cmd();
	i2c_write( (LSM6DS3_ADDR<<1) );
	i2c_write(OUTX_L_G);
	i2c_start_cmd();
	i2c_write( (LSM6DS3_ADDR<<1) | 1);
	data[0]  = i2c_read_ack();
	data[1]  = i2c_read_ack();
	data[2]  = i2c_read_ack();
	data[3]  = i2c_read_ack();
	data[4]  = i2c_read_ack();
	data[5]  = i2c_read_ack();
	data[6]  = i2c_read_ack();
	data[7]  = i2c_read_ack();
	data[8]  = i2c_read_ack();
	data[9]  = i2c_read_ack();
	data[10] = i2c_read_ack();
	data[11] = i2c_read_nack();
	i2c_stop_cmd();
	
	return data;
}