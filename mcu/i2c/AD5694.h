#ifndef AD5694_H
#define AD5694_H

#define AD5694_ADDR			0X0C

#define DAC_NO_OP			0x00
#define DAC_WR_IN_REG		0x10
#define DAC_UPDATE			0x20
#define DAC_WR_UPDATE		0x30
#define DAC_PWR				0x40
#define DAC_LDACN_MASK		0x50
#define DAC_SW_RST			0x60

#define DAC_VCO				0x01
#define DAC_VCF				0x02
#define DAC_VCA				0x04
#define DAC_TP				0x08

#endif /* AD5694_H */