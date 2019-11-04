EESchema Schematic File Version 4
LIBS:synth-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Interface_Expansion:PCF8574A U12
U 1 1 5DCB4D0F
P 3600 3050
F 0 "U12" H 3250 2350 50  0000 C CNN
F 1 "PCF8574A" H 3250 2450 50  0000 C CNN
F 2 "Package_SO:SOIC-16W-12_7.5x10.3mm_P1.27mm" H 3600 3050 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/PCF8574_PCF8574A.pdf" H 3600 3050 50  0001 C CNN
	1    3600 3050
	1    0    0    -1  
$EndComp
$Comp
L ad5694r:AD5694R U13
U 1 1 5DCB6DE9
P 5650 4800
F 0 "U13" H 5450 4150 50  0000 C CNN
F 1 "AD5694R" H 5450 4250 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 5650 4800 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD5697R.pdf" H 5650 4800 50  0001 C CNN
	1    5650 4800
	1    0    0    -1  
$EndComp
Text HLabel 8500 4600 2    50   Output ~ 0
CTRL_VCO
Text HLabel 8500 4700 2    50   Output ~ 0
CTRL_VCF
Text HLabel 8500 4800 2    50   Output ~ 0
CTRL_VCA
Text HLabel 1450 2650 0    50   Input ~ 0
I2C_SCL
Text HLabel 1450 2750 0    50   Input ~ 0
I2C_SDA
$EndSCHEMATC
