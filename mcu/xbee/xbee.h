/*
 * xbee.h
 *
 * Created: 9/26/2019 8:58:33 PM
 *  Author: tyler
 */ 


#ifndef XBEE_H_
#define XBEE_H_

void xbee_config_spi(void);
char* api_frame_decode(char *frame);

#endif /* XBEE_H_ */