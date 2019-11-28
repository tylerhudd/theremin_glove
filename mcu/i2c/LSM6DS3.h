
#ifndef LSM6DS3_H
#define LSM6DS3_H

#include "../i2c/i2c.h"

#define LSM6DS3_ADDR	0X6B
#define LSM6DS3_ID		0X0F

#define OUT_TEMP_L		0x20
#define OUT_TEMP_H		0x21

#define OUTX_L_G			0X22
#define OUTX_H_G			0x23
#define OUTY_L_G			0x24
#define OUTY_H_G			0x25
#define OUTZ_L_G			0x26
#define OUTZ_H_G			0x27

#define OUTX_L_XL			0x28
#define OUTX_H_XL			0x29
#define OUTY_L_XL			0x2A
#define OUTY_H_XL			0x2B
#define OUTZ_L_XL			0x2C
#define OUTZ_H_XL			0x2D

uint8_t* read_temp(void);
uint8_t* read_gyro(void);
uint8_t* read_acc(void);
uint8_t* read_gyroacc(void);

#endif /* LSM6DS3_H */