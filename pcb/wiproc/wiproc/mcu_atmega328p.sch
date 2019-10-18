EESchema Schematic File Version 4
LIBS:wiproc-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
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
L MCU_Microchip_ATmega:ATmega328P-AU U1
U 1 1 5DAA3BFB
P 3500 4400
F 0 "U1" H 3500 3350 50  0000 C CNN
F 1 "ATmega328P-AU" H 3500 3250 50  0000 C CNN
F 2 "Package_QFP:TQFP-32_7x7mm_P0.8mm" H 3500 4400 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 3500 4400 50  0001 C CNN
	1    3500 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3500 6200 3500
Wire Wire Line
	4100 3600 5100 3600
Wire Wire Line
	4100 3700 5200 3700
$Comp
L Device:Crystal Y1
U 1 1 5DAA3C04
P 6250 6200
F 0 "Y1" H 6250 5932 50  0000 C CNN
F 1 "Crystal" H 6250 6023 50  0000 C CNN
F 2 "" H 6250 6200 50  0001 C CNN
F 3 "~" H 6250 6200 50  0001 C CNN
	1    6250 6200
	-1   0    0    1   
$EndComp
$Comp
L Device:C C6
U 1 1 5DAA3C0A
P 6100 6500
F 0 "C6" H 5986 6546 50  0000 R CNN
F 1 "C" H 5986 6455 50  0000 R CNN
F 2 "" H 6138 6350 50  0001 C CNN
F 3 "~" H 6100 6500 50  0001 C CNN
	1    6100 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5DAA3C10
P 6400 6500
F 0 "C7" H 6515 6546 50  0000 L CNN
F 1 "C" H 6515 6455 50  0000 L CNN
F 2 "" H 6438 6350 50  0001 C CNN
F 3 "~" H 6400 6500 50  0001 C CNN
	1    6400 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5DAA3C16
P 6400 6800
F 0 "#PWR016" H 6400 6550 50  0001 C CNN
F 1 "GND" H 6405 6627 50  0000 C CNN
F 2 "" H 6400 6800 50  0001 C CNN
F 3 "" H 6400 6800 50  0001 C CNN
	1    6400 6800
	1    0    0    -1  
$EndComp
Text Label 4400 3300 0    50   ~ 0
SPI_ATTN_N
Text Label 4400 3400 0    50   ~ 0
SPI_SS_N
Text Label 4400 3700 0    50   ~ 0
SPI_CLK
Text Label 4400 3500 0    50   ~ 0
SPI_MOSI
Text Label 4400 3600 0    50   ~ 0
SPI_MISO
Text Label 4400 3800 0    50   ~ 0
XTAL1_16MHZ
Text Label 4400 3900 0    50   ~ 0
XTAL2_16MHZ
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J4
U 1 1 5DAA3C23
P 5600 2700
F 0 "J4" H 5650 2450 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 6700 2750 50  0000 C CNN
F 2 "" H 5600 2700 50  0001 C CNN
F 3 "~" H 5600 2700 50  0001 C CNN
	1    5600 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2600 5100 2600
Wire Wire Line
	5100 2600 5100 3600
Connection ~ 5100 3600
Wire Wire Line
	5400 2700 5200 2700
Wire Wire Line
	5200 2700 5200 3700
Wire Wire Line
	5300 4700 4100 4700
Wire Wire Line
	5900 2700 6200 2700
Wire Wire Line
	6200 2700 6200 3500
Connection ~ 6200 3500
$Comp
L power:GND #PWR010
U 1 1 5DAA3C34
P 6000 2950
F 0 "#PWR010" H 6000 2700 50  0001 C CNN
F 1 "GND" H 6005 2777 50  0000 C CNN
F 2 "" H 6000 2950 50  0001 C CNN
F 3 "" H 6000 2950 50  0001 C CNN
	1    6000 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 2800 6000 2800
Wire Wire Line
	6000 2800 6000 2950
$Comp
L power:+3.3V #PWR07
U 1 1 5DAA3C3C
P 6200 2000
F 0 "#PWR07" H 6200 1850 50  0001 C CNN
F 1 "+3.3V" H 6215 2173 50  0000 C CNN
F 2 "" H 6200 2000 50  0001 C CNN
F 3 "" H 6200 2000 50  0001 C CNN
	1    6200 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 2000 6200 2100
Wire Wire Line
	6200 2600 5900 2600
Wire Wire Line
	4100 3800 6400 3800
Wire Wire Line
	6400 6350 6400 6200
Connection ~ 6400 6200
Wire Wire Line
	4100 3900 6100 3900
Wire Wire Line
	6100 6350 6100 6200
Connection ~ 6100 6200
Wire Wire Line
	6100 6650 6100 6700
Wire Wire Line
	6100 6700 6400 6700
Wire Wire Line
	6400 6700 6400 6650
Wire Wire Line
	6400 6800 6400 6700
Connection ~ 6400 6700
Wire Wire Line
	6100 3900 6100 6200
Wire Wire Line
	4100 5500 6750 5500
Wire Wire Line
	4100 3300 6750 3300
Wire Wire Line
	4100 3400 6750 3400
Wire Wire Line
	6200 3500 6750 3500
Wire Wire Line
	5100 3600 6750 3600
Wire Wire Line
	6750 3700 5200 3700
Connection ~ 5200 3700
Text Label 4400 5000 0    50   ~ 0
UART_TX
Text Label 4400 4900 0    50   ~ 0
UART_RX
$Comp
L power:+3.3V #PWR08
U 1 1 5DAA3C5C
P 3500 2200
F 0 "#PWR08" H 3500 2050 50  0001 C CNN
F 1 "+3.3V" H 3515 2373 50  0000 C CNN
F 2 "" H 3500 2200 50  0001 C CNN
F 3 "" H 3500 2200 50  0001 C CNN
	1    3500 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 2900 3500 2800
Wire Wire Line
	3600 2900 3600 2800
Wire Wire Line
	3600 2800 3500 2800
Connection ~ 3500 2800
Wire Wire Line
	3500 2800 3500 2400
$Comp
L power:GND #PWR015
U 1 1 5DAA3C67
P 3500 6000
F 0 "#PWR015" H 3500 5750 50  0001 C CNN
F 1 "GND" H 3505 5827 50  0000 C CNN
F 2 "" H 3500 6000 50  0001 C CNN
F 3 "" H 3500 6000 50  0001 C CNN
	1    3500 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 6000 3500 5900
Text Label 4400 4700 0    50   ~ 0
MCU_RST_N
$Comp
L Device:C C2
U 1 1 5DAA47CB
P 1600 2600
F 0 "C2" H 1715 2646 50  0000 L CNN
F 1 "0.1uF" H 1715 2555 50  0000 L CNN
F 2 "" H 1638 2450 50  0001 C CNN
F 3 "~" H 1600 2600 50  0001 C CNN
	1    1600 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5DAA66A2
P 1600 2850
F 0 "#PWR09" H 1600 2600 50  0001 C CNN
F 1 "GND" H 1605 2677 50  0000 C CNN
F 2 "" H 1600 2850 50  0001 C CNN
F 3 "" H 1600 2850 50  0001 C CNN
	1    1600 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2450 1600 2400
Connection ~ 3500 2400
Wire Wire Line
	3500 2400 3500 2200
Wire Wire Line
	2900 3200 2850 3200
Wire Wire Line
	2850 3200 2850 2400
Wire Wire Line
	2850 2400 3500 2400
$Comp
L Device:C C4
U 1 1 5DAB3F78
P 2500 2600
F 0 "C4" H 2615 2646 50  0000 L CNN
F 1 "0.1uF" H 2615 2555 50  0000 L CNN
F 2 "" H 2538 2450 50  0001 C CNN
F 3 "~" H 2500 2600 50  0001 C CNN
	1    2500 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2750 1600 2800
$Comp
L Device:C C3
U 1 1 5DAB1AAC
P 2050 2600
F 0 "C3" H 2165 2646 50  0000 L CNN
F 1 "0.1uF" H 2165 2555 50  0000 L CNN
F 2 "" H 2088 2450 50  0001 C CNN
F 3 "~" H 2050 2600 50  0001 C CNN
	1    2050 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2400 2050 2400
Connection ~ 2850 2400
Wire Wire Line
	2050 2450 2050 2400
Connection ~ 2050 2400
Wire Wire Line
	2050 2400 2500 2400
Wire Wire Line
	2500 2450 2500 2400
Connection ~ 2500 2400
Wire Wire Line
	2500 2400 2850 2400
Wire Wire Line
	2500 2750 2500 2800
Wire Wire Line
	2500 2800 2050 2800
Connection ~ 1600 2800
Wire Wire Line
	1600 2800 1600 2850
Wire Wire Line
	2050 2750 2050 2800
Connection ~ 2050 2800
Wire Wire Line
	2050 2800 1600 2800
Wire Wire Line
	5300 4700 6750 4700
Connection ~ 5300 4700
Wire Wire Line
	5300 2450 5300 2800
Wire Wire Line
	5400 2800 5300 2800
Connection ~ 5300 2800
Wire Wire Line
	5300 2800 5300 4700
Wire Wire Line
	5300 2150 5300 2100
Wire Wire Line
	5300 2100 6200 2100
Connection ~ 6200 2100
Wire Wire Line
	6200 2100 6200 2600
Wire Wire Line
	4100 4900 6750 4900
Wire Wire Line
	4100 5000 6750 5000
Text HLabel 6750 3300 2    50   Input ~ 0
SPI_ATTN_N
Text HLabel 6750 3400 2    50   Output ~ 0
SPI_SS_N
Text HLabel 6750 3500 2    50   Output ~ 0
SPI_MOSI
Text HLabel 6750 3700 2    50   Output ~ 0
SPI_CLK
Text HLabel 6750 3600 2    50   Input ~ 0
SPI_MISO
Text HLabel 6750 4700 2    50   Input ~ 0
MCU_RST_N
Text HLabel 6750 5000 2    50   Output ~ 0
UART_TX
Text HLabel 6750 4900 2    50   Input ~ 0
UART_RX
Text Label 4400 5500 0    50   ~ 0
XBEE_DOUT
Wire Wire Line
	4100 5600 6750 5600
Text Label 4400 5600 0    50   ~ 0
XBEE_RST_N
Text HLabel 6750 5500 2    50   Output ~ 0
XBEE_DOUT
Text HLabel 6750 5600 2    50   Output ~ 0
XBEE_RST_N
$Comp
L Device:R_US R5
U 1 1 5DAC98B5
P 5300 2300
F 0 "R5" H 5368 2346 50  0000 L CNN
F 1 "10k" H 5368 2255 50  0000 L CNN
F 2 "" V 5340 2290 50  0001 C CNN
F 3 "~" H 5300 2300 50  0001 C CNN
	1    5300 2300
	1    0    0    -1  
$EndComp
Text HLabel 1500 3400 0    50   Input ~ 0
ADC_IN1
Wire Wire Line
	1500 3400 2900 3400
Text HLabel 9500 4500 2    50   BiDi ~ 0
I2C_SDA
Text HLabel 9500 4600 2    50   Output ~ 0
I2C_SCL
Wire Wire Line
	4100 4600 8700 4600
Wire Wire Line
	4100 4500 8500 4500
Wire Wire Line
	8700 4250 8700 4600
$Comp
L Device:R_US R7
U 1 1 5DB03FB5
P 8700 4100
F 0 "R7" H 8768 4146 50  0000 L CNN
F 1 "10k" H 8768 4055 50  0000 L CNN
F 2 "" V 8740 4090 50  0001 C CNN
F 3 "~" H 8700 4100 50  0001 C CNN
	1    8700 4100
	1    0    0    -1  
$EndComp
Connection ~ 8700 4600
Wire Wire Line
	8700 4600 9500 4600
$Comp
L Device:R_US R6
U 1 1 5DB060A9
P 8500 4100
F 0 "R6" H 8432 4146 50  0000 R CNN
F 1 "10k" H 8432 4055 50  0000 R CNN
F 2 "" V 8540 4090 50  0001 C CNN
F 3 "~" H 8500 4100 50  0001 C CNN
	1    8500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4250 8500 4500
Connection ~ 8500 4500
Wire Wire Line
	8500 4500 9500 4500
$Comp
L power:+3.3V #PWR012
U 1 1 5DB0935D
P 8600 3800
F 0 "#PWR012" H 8600 3650 50  0001 C CNN
F 1 "+3.3V" H 8615 3973 50  0000 C CNN
F 2 "" H 8600 3800 50  0001 C CNN
F 3 "" H 8600 3800 50  0001 C CNN
	1    8600 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 3950 8500 3850
Wire Wire Line
	8500 3850 8600 3850
Wire Wire Line
	8600 3850 8600 3800
Wire Wire Line
	8700 3950 8700 3850
Wire Wire Line
	8700 3850 8600 3850
Connection ~ 8600 3850
Text HLabel 1500 3500 0    50   Input ~ 0
ADC_IN2
Wire Wire Line
	1500 3500 2900 3500
Text Label 2300 3400 0    50   ~ 0
ADC_IN1
Text Label 2300 3500 0    50   ~ 0
ADC_IN2
Text HLabel 6750 5400 2    50   BiDi ~ 0
SPARE_IO_2
Text HLabel 6750 5300 2    50   BiDi ~ 0
SPARE_IO_1
Wire Wire Line
	6400 3800 6400 6200
Wire Wire Line
	4100 5300 6750 5300
Wire Wire Line
	4100 5400 6750 5400
Text Label 4400 5300 0    50   ~ 0
SPARE_IO_1
Text Label 4400 5400 0    50   ~ 0
SPARE_IO_2
$Comp
L Device:LED D1
U 1 1 5DB297CF
P 8650 5050
F 0 "D1" H 8643 4795 50  0000 C CNN
F 1 "LED" H 8643 4886 50  0000 C CNN
F 2 "" H 8650 5050 50  0001 C CNN
F 3 "~" H 8650 5050 50  0001 C CNN
	1    8650 5050
	1    0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 5DB2BCAC
P 8650 5250
F 0 "D2" H 8643 5373 50  0000 C CNN
F 1 "LED" H 8643 5464 50  0000 C CNN
F 2 "" H 8650 5250 50  0001 C CNN
F 3 "~" H 8650 5250 50  0001 C CNN
	1    8650 5250
	1    0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR013
U 1 1 5DB358F1
P 8950 4850
F 0 "#PWR013" H 8950 4700 50  0001 C CNN
F 1 "+3.3V" H 8965 5023 50  0000 C CNN
F 2 "" H 8950 4850 50  0001 C CNN
F 3 "" H 8950 4850 50  0001 C CNN
	1    8950 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 4850 8950 4950
Wire Wire Line
	8950 5250 8800 5250
Wire Wire Line
	8800 5050 8950 5050
Wire Wire Line
	8950 5050 8950 5250
Connection ~ 8950 5050
$Comp
L Device:R_US R8
U 1 1 5DB41EA4
P 7550 5050
F 0 "R8" V 7345 5050 50  0000 C CNN
F 1 "220" V 7436 5050 50  0000 C CNN
F 2 "" V 7590 5040 50  0001 C CNN
F 3 "~" H 7550 5050 50  0001 C CNN
	1    7550 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R9
U 1 1 5DB44993
P 7550 5250
F 0 "R9" V 7663 5250 50  0000 C CNN
F 1 "220" V 7754 5250 50  0000 C CNN
F 2 "" V 7590 5240 50  0001 C CNN
F 3 "~" H 7550 5250 50  0001 C CNN
	1    7550 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	7700 5050 8500 5050
Wire Wire Line
	7700 5250 8500 5250
Wire Wire Line
	7400 5050 7350 5050
Wire Wire Line
	7350 5050 7350 5100
Wire Wire Line
	7350 5100 4100 5100
Wire Wire Line
	4100 5200 7350 5200
Wire Wire Line
	7350 5200 7350 5250
Wire Wire Line
	7350 5250 7400 5250
Text Label 4400 5100 0    50   ~ 0
MCU_LED1
Text Label 4400 5200 0    50   ~ 0
MCU_LED2
Text Label 7800 5050 0    50   ~ 0
MCU_LED1_R
Text Label 7800 5250 0    50   ~ 0
MCU_LED2_R
$Comp
L Device:C C5
U 1 1 5DB7928C
P 9150 5150
F 0 "C5" H 9265 5196 50  0000 L CNN
F 1 "0.1uF" H 9265 5105 50  0000 L CNN
F 2 "" H 9188 5000 50  0001 C CNN
F 3 "~" H 9150 5150 50  0001 C CNN
	1    9150 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 5000 9150 4950
Wire Wire Line
	9150 4950 8950 4950
Connection ~ 8950 4950
Wire Wire Line
	8950 4950 8950 5050
$Comp
L power:GND #PWR014
U 1 1 5DB8048D
P 9150 5400
F 0 "#PWR014" H 9150 5150 50  0001 C CNN
F 1 "GND" H 9155 5227 50  0000 C CNN
F 2 "" H 9150 5400 50  0001 C CNN
F 3 "" H 9150 5400 50  0001 C CNN
	1    9150 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 5300 9150 5400
$Comp
L Switch:SW_Push SW1
U 1 1 5DB9E115
P 9750 1900
F 0 "SW1" H 9750 2185 50  0000 C CNN
F 1 "SW_Push" H 9750 2094 50  0000 C CNN
F 2 "" H 9750 2100 50  0001 C CNN
F 3 "~" H 9750 2100 50  0001 C CNN
	1    9750 1900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 5DB9F3CE
P 10250 2250
F 0 "SW2" H 10250 2535 50  0000 C CNN
F 1 "SW_Push" H 10250 2444 50  0000 C CNN
F 2 "" H 10250 2450 50  0001 C CNN
F 3 "~" H 10250 2450 50  0001 C CNN
	1    10250 2250
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW3
U 1 1 5DBA1BD1
P 9800 2600
F 0 "SW3" H 9800 2885 50  0000 C CNN
F 1 "SW_Push" H 9800 2794 50  0000 C CNN
F 2 "" H 9800 2800 50  0001 C CNN
F 3 "~" H 9800 2800 50  0001 C CNN
	1    9800 2600
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW4
U 1 1 5DBA1BDB
P 10300 2950
F 0 "SW4" H 10300 3235 50  0000 C CNN
F 1 "SW_Push" H 10300 3144 50  0000 C CNN
F 2 "" H 10300 3150 50  0001 C CNN
F 3 "~" H 10300 3150 50  0001 C CNN
	1    10300 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R4
U 1 1 5DBA94A8
P 9200 1550
F 0 "R4" H 9132 1596 50  0000 R CNN
F 1 "10k" H 9132 1505 50  0000 R CNN
F 2 "" V 9240 1540 50  0001 C CNN
F 3 "~" H 9200 1550 50  0001 C CNN
	1    9200 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R3
U 1 1 5DBBFF36
P 8900 1550
F 0 "R3" H 8832 1596 50  0000 R CNN
F 1 "10k" H 8832 1505 50  0000 R CNN
F 2 "" V 8940 1540 50  0001 C CNN
F 3 "~" H 8900 1550 50  0001 C CNN
	1    8900 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R2
U 1 1 5DBC25A5
P 8600 1550
F 0 "R2" H 8532 1596 50  0000 R CNN
F 1 "10k" H 8532 1505 50  0000 R CNN
F 2 "" V 8640 1540 50  0001 C CNN
F 3 "~" H 8600 1550 50  0001 C CNN
	1    8600 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R1
U 1 1 5DBC25AF
P 8300 1550
F 0 "R1" H 8232 1596 50  0000 R CNN
F 1 "10k" H 8232 1505 50  0000 R CNN
F 2 "" V 8340 1540 50  0001 C CNN
F 3 "~" H 8300 1550 50  0001 C CNN
	1    8300 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR06
U 1 1 5DBCF334
P 8450 1300
F 0 "#PWR06" H 8450 1150 50  0001 C CNN
F 1 "+3.3V" H 8465 1473 50  0000 C CNN
F 2 "" H 8450 1300 50  0001 C CNN
F 3 "" H 8450 1300 50  0001 C CNN
	1    8450 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 1400 8300 1350
Wire Wire Line
	8300 1350 8450 1350
Wire Wire Line
	8450 1350 8450 1300
Wire Wire Line
	8600 1400 8600 1350
Wire Wire Line
	8600 1350 8450 1350
Connection ~ 8450 1350
Wire Wire Line
	8600 1350 8900 1350
Wire Wire Line
	8900 1350 8900 1400
Connection ~ 8600 1350
Wire Wire Line
	8900 1350 9200 1350
Wire Wire Line
	9200 1350 9200 1400
Connection ~ 8900 1350
Wire Wire Line
	9200 1700 9200 1900
Wire Wire Line
	9200 1900 9550 1900
Wire Wire Line
	8900 1700 8900 2250
Wire Wire Line
	8900 2250 10050 2250
Wire Wire Line
	8600 1700 8600 2600
Wire Wire Line
	8600 2600 9600 2600
Wire Wire Line
	8300 1700 8300 2950
Wire Wire Line
	8300 2950 10100 2950
$Comp
L power:GND #PWR011
U 1 1 5DBEEAEB
P 10600 3050
F 0 "#PWR011" H 10600 2800 50  0001 C CNN
F 1 "GND" H 10605 2877 50  0000 C CNN
F 2 "" H 10600 3050 50  0001 C CNN
F 3 "" H 10600 3050 50  0001 C CNN
	1    10600 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 1900 10600 1900
Wire Wire Line
	10600 1900 10600 2250
Wire Wire Line
	10450 2250 10600 2250
Connection ~ 10600 2250
Wire Wire Line
	10600 2250 10600 2600
Wire Wire Line
	10000 2600 10600 2600
Connection ~ 10600 2600
Wire Wire Line
	10600 2600 10600 2950
Wire Wire Line
	10500 2950 10600 2950
Connection ~ 10600 2950
Wire Wire Line
	10600 2950 10600 3050
Wire Wire Line
	4100 4400 7900 4400
Wire Wire Line
	7900 4400 7900 2950
Wire Wire Line
	7900 2950 8300 2950
Connection ~ 8300 2950
Wire Wire Line
	4100 4300 7800 4300
Wire Wire Line
	7800 4300 7800 2600
Wire Wire Line
	7800 2600 8600 2600
Connection ~ 8600 2600
Wire Wire Line
	8900 2250 7700 2250
Wire Wire Line
	7700 2250 7700 4200
Wire Wire Line
	7700 4200 4100 4200
Connection ~ 8900 2250
Wire Wire Line
	4100 4100 7600 4100
Wire Wire Line
	7600 4100 7600 1900
Wire Wire Line
	7600 1900 9200 1900
Connection ~ 9200 1900
Text Label 4400 4100 0    50   ~ 0
MCU_BTN1
Text Label 4400 4200 0    50   ~ 0
MCU_BTN2
Text Label 4400 4300 0    50   ~ 0
MCU_BTN3
Text Label 4400 4400 0    50   ~ 0
MCU_BTN4
Text Label 4400 4500 0    50   ~ 0
I2C_SDA
Text Label 4400 4600 0    50   ~ 0
I2C_SCL
NoConn ~ 4100 3200
$EndSCHEMATC