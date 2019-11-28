
#ifndef PCF8574A_H
#define PCF8574A_H

#define PCF8574A_ADDR	0X38

#define WF_DISABLED		0x00
#define WF_GND        0x01
#define WF_SIN        0x03
#define WF_SQR        0x05
#define WF_TRI				0x07
#define WF_EXT				0x09

#define FLT_DISABLED	0x00
#define FLT_GND				0x10
#define FLT_LPF				0x30
#define FLT_BPF				0x50
#define FLT_HPF				0x70
#define FLT_EXT				0x90
#define FLT_DIR				0xB0

#endif /* PCF8574A_H */