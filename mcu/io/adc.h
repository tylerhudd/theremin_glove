/*
 * adc.h
 *
 * Created: 11/229/019
 *  Author: tyler
 */ 


#ifndef ADC_H_
#define ADC_H_

// enable and start ADC with prescaler 64
#define ADC_EN()       ADCSRA |= (1<<ADEN)
// start ADC conversion
#define ADC_STRT()     ADCSRA |= (1<<ADSC)
// select ADC6 pin as input to ADC
#define ADC_IN1_SEL()  ADMUX  |= (1<<MUX2)|(1<<MUX1)

#endif /* ADC_H_ */