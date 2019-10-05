/*
 * xbee.h
 *
 * Created: 9/26/2019 8:58:33 PM
 *  Author: tyler
 */ 


#ifndef XBEE_H_
#define XBEE_H_

// XBee pin direction macros
#define XBEE_RESET_OUT_EN  DDRD  |=  (1<<XBEE_RST_N)
#define XBEE_DOUT_OUT_EN   DDRD  |=  (1<<XBEE_DOUT)
#define XBEE_DOUT_IN_EN    DDRD  &= ~(1<<XBEE_DOUT)

// XBee pin set macros
#define XBEE_RESET_ASSERT  PORTD &= ~(1<<XBEE_RST_N)
#define XBEE_RESET_RELEASE PORTD |=  (1<<XBEE_RST_N)
#define XBEE_DOUT_LOW      PORTD &= ~(1<<XBEE_DOUT)
#define XBEE_DOUT_HIGH     PORTD |=  (1<<XBEE_DOUT)

void xbee_config_spi(void);
char* api_frame_decode(char *frame);

#endif /* XBEE_H_ */