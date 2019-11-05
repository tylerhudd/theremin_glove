EESchema Schematic File Version 4
LIBS:synth-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 9
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
L opa172idbvr:OPA172IDBVR U?
U 1 1 5DD386EE
P 7300 2500
AR Path="/5DB65292/5DD386EE" Ref="U?"  Part="1" 
AR Path="/5DD3636A/5DD386EE" Ref="U8"  Part="1" 
F 0 "U8" H 7300 2300 50  0000 L CNN
F 1 "OPA172IDBVR" H 7250 2800 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 7200 2300 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22141b.pdf" H 7300 2700 50  0001 C CNN
	1    7300 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5DD386F4
P 7850 2500
AR Path="/5DB65292/5DD386F4" Ref="R?"  Part="1" 
AR Path="/5DD3636A/5DD386F4" Ref="R30"  Part="1" 
F 0 "R30" V 7645 2500 50  0000 C CNN
F 1 "50" V 7736 2500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7890 2490 50  0001 C CNN
F 3 "~" H 7850 2500 50  0001 C CNN
	1    7850 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	7700 2500 7650 2500
Wire Wire Line
	7000 2600 6950 2600
Wire Wire Line
	6950 2600 6950 3100
Wire Wire Line
	6950 3100 7650 3100
Wire Wire Line
	7650 3100 7650 2500
Connection ~ 7650 2500
Wire Wire Line
	7650 2500 7600 2500
$Comp
L Device:C C?
U 1 1 5DD38702
P 8200 2500
AR Path="/5DB65292/5DD38702" Ref="C?"  Part="1" 
AR Path="/5DD3636A/5DD38702" Ref="C23"  Part="1" 
F 0 "C23" V 8452 2500 50  0000 C CNN
F 1 "1uF" V 8361 2500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8238 2350 50  0001 C CNN
F 3 "~" H 8200 2500 50  0001 C CNN
	1    8200 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8000 2500 8050 2500
$Comp
L power:-12V #PWR?
U 1 1 5DD3870A
P 7200 2850
AR Path="/5DB65292/5DD3870A" Ref="#PWR?"  Part="1" 
AR Path="/5DD3636A/5DD3870A" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 7200 2950 50  0001 C CNN
F 1 "-12V" H 7215 3023 50  0000 C CNN
F 2 "" H 7200 2850 50  0001 C CNN
F 3 "" H 7200 2850 50  0001 C CNN
	1    7200 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	7200 2800 7200 2850
$Comp
L power:+12V #PWR?
U 1 1 5DD38711
P 7200 2150
AR Path="/5DB65292/5DD38711" Ref="#PWR?"  Part="1" 
AR Path="/5DD3636A/5DD38711" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 7200 2000 50  0001 C CNN
F 1 "+12V" H 7215 2323 50  0000 C CNN
F 2 "" H 7200 2150 50  0001 C CNN
F 3 "" H 7200 2150 50  0001 C CNN
	1    7200 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 2200 7200 2150
Text HLabel 8950 2500 2    50   Output ~ 0
WF_MUX_OUT
Wire Wire Line
	8350 2500 8700 2500
$Comp
L mux508:MUX508 U9
U 1 1 5DBF69EC
P 6000 2550
F 0 "U9" H 5950 2850 50  0000 L CNN
F 1 "MUX508" H 5850 2950 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5900 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74cbt3253" H 5900 2850 50  0001 C CNN
	1    6000 2550
	1    0    0    -1  
$EndComp
Text HLabel 4050 2500 0    50   Input ~ 0
AN_SIN
Text HLabel 4050 2600 0    50   Input ~ 0
AN_SQR
Text HLabel 4050 2700 0    50   Input ~ 0
AN_TRI
Wire Wire Line
	4050 2500 4650 2500
Wire Wire Line
	4050 2600 4900 2600
Wire Wire Line
	4050 2700 5150 2700
$Comp
L power:GND #PWR0145
U 1 1 5DBF9038
P 6100 3400
F 0 "#PWR0145" H 6100 3150 50  0001 C CNN
F 1 "GND" H 6105 3227 50  0000 C CNN
F 2 "" H 6100 3400 50  0001 C CNN
F 3 "" H 6100 3400 50  0001 C CNN
	1    6100 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3400 6100 3350
$Comp
L power:-12V #PWR0146
U 1 1 5DBF9970
P 5900 3400
F 0 "#PWR0146" H 5900 3500 50  0001 C CNN
F 1 "-12V" H 5915 3573 50  0000 C CNN
F 2 "" H 5900 3400 50  0001 C CNN
F 3 "" H 5900 3400 50  0001 C CNN
	1    5900 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	5900 3350 5900 3400
$Comp
L power:+12V #PWR0147
U 1 1 5DBFA1F0
P 6000 1600
F 0 "#PWR0147" H 6000 1450 50  0001 C CNN
F 1 "+12V" H 6015 1773 50  0000 C CNN
F 2 "" H 6000 1600 50  0001 C CNN
F 3 "" H 6000 1600 50  0001 C CNN
	1    6000 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 1600 6000 1650
$Comp
L power:GND #PWR0148
U 1 1 5DBFA573
P 5400 3400
F 0 "#PWR0148" H 5400 3150 50  0001 C CNN
F 1 "GND" H 5405 3227 50  0000 C CNN
F 2 "" H 5400 3400 50  0001 C CNN
F 3 "" H 5400 3400 50  0001 C CNN
	1    5400 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3400 5400 3100
Wire Wire Line
	5400 2400 5500 2400
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 5DBFB5C5
P 3100 2800
F 0 "J4" H 3100 2600 50  0000 C CNN
F 1 "Conn_01x02" H 3018 2926 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3100 2800 50  0001 C CNN
F 3 "~" H 3100 2800 50  0001 C CNN
	1    3100 2800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3300 2800 5500 2800
$Comp
L power:GND #PWR0149
U 1 1 5DBFCC8E
P 3350 3400
F 0 "#PWR0149" H 3350 3150 50  0001 C CNN
F 1 "GND" H 3355 3227 50  0000 C CNN
F 2 "" H 3350 3400 50  0001 C CNN
F 3 "" H 3350 3400 50  0001 C CNN
	1    3350 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2900 3300 2900
Wire Wire Line
	3350 2900 3350 3400
Wire Wire Line
	5500 2900 5400 2900
Connection ~ 5400 2900
Wire Wire Line
	5400 2900 5400 2400
Wire Wire Line
	5500 3000 5400 3000
Connection ~ 5400 3000
Wire Wire Line
	5400 3000 5400 2900
Wire Wire Line
	5500 3100 5400 3100
Connection ~ 5400 3100
Wire Wire Line
	5400 3100 5400 3000
$Comp
L Connector:TestPoint TP1
U 1 1 5DBFF314
P 4650 2450
F 0 "TP1" H 4708 2522 50  0000 L CNN
F 1 "TestPoint" H 4708 2477 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 4850 2450 50  0001 C CNN
F 3 "~" H 4850 2450 50  0001 C CNN
	1    4650 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5DC00F70
P 4900 2450
F 0 "TP2" H 4958 2522 50  0000 L CNN
F 1 "TestPoint" H 4958 2477 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 5100 2450 50  0001 C CNN
F 3 "~" H 5100 2450 50  0001 C CNN
	1    4900 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5DC015E9
P 5150 2450
F 0 "TP3" H 5208 2522 50  0000 L CNN
F 1 "TestPoint" H 5208 2477 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 5350 2450 50  0001 C CNN
F 3 "~" H 5350 2450 50  0001 C CNN
	1    5150 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2450 4650 2500
Connection ~ 4650 2500
Wire Wire Line
	4650 2500 5500 2500
Wire Wire Line
	4900 2450 4900 2600
Connection ~ 4900 2600
Wire Wire Line
	4900 2600 5500 2600
Wire Wire Line
	5150 2450 5150 2700
Connection ~ 5150 2700
Wire Wire Line
	5150 2700 5500 2700
Text HLabel 4050 2000 0    50   Input ~ 0
WF_MUX_A0
Text HLabel 4050 2100 0    50   Input ~ 0
WF_MUX_A1
Text HLabel 4050 2200 0    50   Input ~ 0
WF_MUX_A2
Text HLabel 4050 1900 0    50   Input ~ 0
WF_MUX_EN
Wire Wire Line
	4050 1900 5500 1900
Wire Wire Line
	4050 2000 5500 2000
Wire Wire Line
	4050 2100 5500 2100
Wire Wire Line
	4050 2200 5500 2200
$Comp
L mux508:MUX508 U11
U 1 1 5DC0B342
P 6000 5050
F 0 "U11" H 5950 5350 50  0000 L CNN
F 1 "MUX508" H 5850 5450 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5900 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74cbt3253" H 5900 5350 50  0001 C CNN
	1    6000 5050
	1    0    0    -1  
$EndComp
Text HLabel 4050 5000 0    50   Input ~ 0
AN_LPF
Text HLabel 4050 5100 0    50   Input ~ 0
AN_BPF
Text HLabel 4050 5200 0    50   Input ~ 0
AN_HPF
$Comp
L power:GND #PWR0150
U 1 1 5DC0B352
P 6100 5900
F 0 "#PWR0150" H 6100 5650 50  0001 C CNN
F 1 "GND" H 6105 5727 50  0000 C CNN
F 2 "" H 6100 5900 50  0001 C CNN
F 3 "" H 6100 5900 50  0001 C CNN
	1    6100 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 5900 6100 5850
$Comp
L power:-12V #PWR0151
U 1 1 5DC0B35D
P 5900 5900
F 0 "#PWR0151" H 5900 6000 50  0001 C CNN
F 1 "-12V" H 5915 6073 50  0000 C CNN
F 2 "" H 5900 5900 50  0001 C CNN
F 3 "" H 5900 5900 50  0001 C CNN
	1    5900 5900
	-1   0    0    1   
$EndComp
Wire Wire Line
	5900 5850 5900 5900
$Comp
L power:+12V #PWR0152
U 1 1 5DC0B368
P 6000 4100
F 0 "#PWR0152" H 6000 3950 50  0001 C CNN
F 1 "+12V" H 6015 4273 50  0000 C CNN
F 2 "" H 6000 4100 50  0001 C CNN
F 3 "" H 6000 4100 50  0001 C CNN
	1    6000 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4100 6000 4150
$Comp
L power:GND #PWR0153
U 1 1 5DC0B373
P 5400 5900
F 0 "#PWR0153" H 5400 5650 50  0001 C CNN
F 1 "GND" H 5405 5727 50  0000 C CNN
F 2 "" H 5400 5900 50  0001 C CNN
F 3 "" H 5400 5900 50  0001 C CNN
	1    5400 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5900 5400 5600
Wire Wire Line
	5400 4900 5500 4900
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 5DC0B37F
P 3150 5300
F 0 "J5" H 3150 5100 50  0000 C CNN
F 1 "Conn_01x02" H 3068 5426 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3150 5300 50  0001 C CNN
F 3 "~" H 3150 5300 50  0001 C CNN
	1    3150 5300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3350 5300 5500 5300
$Comp
L power:GND #PWR0154
U 1 1 5DC0B38A
P 3400 5900
F 0 "#PWR0154" H 3400 5650 50  0001 C CNN
F 1 "GND" H 3405 5727 50  0000 C CNN
F 2 "" H 3400 5900 50  0001 C CNN
F 3 "" H 3400 5900 50  0001 C CNN
	1    3400 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5400 3350 5400
Wire Wire Line
	3400 5400 3400 5900
Wire Wire Line
	5500 5500 5400 5500
Connection ~ 5400 5500
Wire Wire Line
	5500 5600 5400 5600
Connection ~ 5400 5600
Wire Wire Line
	5400 5600 5400 5500
$Comp
L Connector:TestPoint TP5
U 1 1 5DC0B3A9
P 4900 4950
F 0 "TP5" H 4958 5022 50  0000 L CNN
F 1 "TestPoint" H 4958 4977 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 5100 4950 50  0001 C CNN
F 3 "~" H 5100 4950 50  0001 C CNN
	1    4900 4950
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 5DC0B3B3
P 5150 4950
F 0 "TP6" H 5208 5022 50  0000 L CNN
F 1 "TestPoint" H 5208 4977 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 5350 4950 50  0001 C CNN
F 3 "~" H 5350 4950 50  0001 C CNN
	1    5150 4950
	1    0    0    -1  
$EndComp
Text HLabel 4050 4500 0    50   Input ~ 0
FLT_MUX_A0
Text HLabel 4050 4600 0    50   Input ~ 0
FLT_MUX_A1
Text HLabel 4050 4700 0    50   Input ~ 0
FLT_MUX_A2
Text HLabel 4050 4400 0    50   Input ~ 0
FLT_MUX_EN
Wire Wire Line
	4050 4400 5500 4400
Wire Wire Line
	4050 4500 5500 4500
Wire Wire Line
	4050 4600 5500 4600
Wire Wire Line
	4050 4700 5500 4700
Wire Wire Line
	5400 4900 5400 5500
$Comp
L Connector:TestPoint TP4
U 1 1 5DC270B5
P 4650 4950
F 0 "TP4" H 4708 5022 50  0000 L CNN
F 1 "TestPoint" H 4708 4977 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_2.0x2.0mm" H 4850 4950 50  0001 C CNN
F 3 "~" H 4850 4950 50  0001 C CNN
	1    4650 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2400 7000 2400
$Comp
L opa172idbvr:OPA172IDBVR U?
U 1 1 5DC3E314
P 7300 5000
AR Path="/5DB65292/5DC3E314" Ref="U?"  Part="1" 
AR Path="/5DD3636A/5DC3E314" Ref="U10"  Part="1" 
F 0 "U10" H 7300 4800 50  0000 L CNN
F 1 "OPA172IDBVR" H 7250 5300 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 7200 4800 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22141b.pdf" H 7300 5200 50  0001 C CNN
	1    7300 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5DC3E31E
P 7850 5000
AR Path="/5DB65292/5DC3E31E" Ref="R?"  Part="1" 
AR Path="/5DD3636A/5DC3E31E" Ref="R31"  Part="1" 
F 0 "R31" V 7645 5000 50  0000 C CNN
F 1 "50" V 7736 5000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7890 4990 50  0001 C CNN
F 3 "~" H 7850 5000 50  0001 C CNN
	1    7850 5000
	0    1    1    0   
$EndComp
Wire Wire Line
	7700 5000 7650 5000
Wire Wire Line
	7000 5100 6950 5100
Wire Wire Line
	6950 5100 6950 5600
Wire Wire Line
	6950 5600 7650 5600
Wire Wire Line
	7650 5600 7650 5000
Connection ~ 7650 5000
Wire Wire Line
	7650 5000 7600 5000
$Comp
L Device:C C?
U 1 1 5DC3E32F
P 8200 5000
AR Path="/5DB65292/5DC3E32F" Ref="C?"  Part="1" 
AR Path="/5DD3636A/5DC3E32F" Ref="C24"  Part="1" 
F 0 "C24" V 8452 5000 50  0000 C CNN
F 1 "1uF" V 8361 5000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8238 4850 50  0001 C CNN
F 3 "~" H 8200 5000 50  0001 C CNN
	1    8200 5000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8000 5000 8050 5000
$Comp
L power:-12V #PWR?
U 1 1 5DC3E33A
P 7200 5350
AR Path="/5DB65292/5DC3E33A" Ref="#PWR?"  Part="1" 
AR Path="/5DD3636A/5DC3E33A" Ref="#PWR0155"  Part="1" 
F 0 "#PWR0155" H 7200 5450 50  0001 C CNN
F 1 "-12V" H 7215 5523 50  0000 C CNN
F 2 "" H 7200 5350 50  0001 C CNN
F 3 "" H 7200 5350 50  0001 C CNN
	1    7200 5350
	-1   0    0    1   
$EndComp
Wire Wire Line
	7200 5300 7200 5350
$Comp
L power:+12V #PWR?
U 1 1 5DC3E345
P 7200 4650
AR Path="/5DB65292/5DC3E345" Ref="#PWR?"  Part="1" 
AR Path="/5DD3636A/5DC3E345" Ref="#PWR0156"  Part="1" 
F 0 "#PWR0156" H 7200 4500 50  0001 C CNN
F 1 "+12V" H 7215 4823 50  0000 C CNN
F 2 "" H 7200 4650 50  0001 C CNN
F 3 "" H 7200 4650 50  0001 C CNN
	1    7200 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 4700 7200 4650
Text HLabel 8950 5000 2    50   Output ~ 0
FLT_MUX_OUT
Wire Wire Line
	8350 5000 8950 5000
Wire Wire Line
	6500 4900 7000 4900
Wire Wire Line
	4050 5000 4650 5000
Wire Wire Line
	4050 5100 4900 5100
Wire Wire Line
	4050 5200 5150 5200
Wire Wire Line
	4650 4950 4650 5000
Connection ~ 4650 5000
Wire Wire Line
	4650 5000 5500 5000
Wire Wire Line
	4900 4950 4900 5100
Connection ~ 4900 5100
Wire Wire Line
	4900 5100 5500 5100
Wire Wire Line
	5150 4950 5150 5200
Connection ~ 5150 5200
Wire Wire Line
	5150 5200 5500 5200
Wire Wire Line
	4400 3800 8700 3800
Wire Wire Line
	8700 3800 8700 2500
Connection ~ 8700 2500
Wire Wire Line
	8700 2500 8950 2500
Wire Wire Line
	4400 3800 4400 5400
Wire Wire Line
	4400 5400 5500 5400
$Comp
L Device:C C25
U 1 1 5DC5204D
P 1900 6050
F 0 "C25" H 2015 6096 50  0000 L CNN
F 1 "0.1u" H 2015 6005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1938 5900 50  0001 C CNN
F 3 "~" H 1900 6050 50  0001 C CNN
	1    1900 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C27
U 1 1 5DC52A43
P 1900 6550
F 0 "C27" H 2015 6596 50  0000 L CNN
F 1 "0.1u" H 2015 6505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1938 6400 50  0001 C CNN
F 3 "~" H 1900 6550 50  0001 C CNN
	1    1900 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C26
U 1 1 5DC54B13
P 2300 6050
F 0 "C26" H 2415 6096 50  0000 L CNN
F 1 "0.1u" H 2415 6005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2338 5900 50  0001 C CNN
F 3 "~" H 2300 6050 50  0001 C CNN
	1    2300 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C28
U 1 1 5DC54B1D
P 2300 6550
F 0 "C28" H 2415 6596 50  0000 L CNN
F 1 "0.1u" H 2415 6505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2338 6400 50  0001 C CNN
F 3 "~" H 2300 6550 50  0001 C CNN
	1    2300 6550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0157
U 1 1 5DC56AFF
P 1650 6350
F 0 "#PWR0157" H 1650 6100 50  0001 C CNN
F 1 "GND" H 1655 6177 50  0000 C CNN
F 2 "" H 1650 6350 50  0001 C CNN
F 3 "" H 1650 6350 50  0001 C CNN
	1    1650 6350
	1    0    0    -1  
$EndComp
$Comp
L power:-12V #PWR0158
U 1 1 5DC56B09
P 1650 6800
F 0 "#PWR0158" H 1650 6900 50  0001 C CNN
F 1 "-12V" H 1665 6973 50  0000 C CNN
F 2 "" H 1650 6800 50  0001 C CNN
F 3 "" H 1650 6800 50  0001 C CNN
	1    1650 6800
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5DC5ABE1
P 1650 5800
AR Path="/5DB65292/5DC5ABE1" Ref="#PWR?"  Part="1" 
AR Path="/5DD3636A/5DC5ABE1" Ref="#PWR0159"  Part="1" 
F 0 "#PWR0159" H 1650 5650 50  0001 C CNN
F 1 "+12V" H 1665 5973 50  0000 C CNN
F 2 "" H 1650 5800 50  0001 C CNN
F 3 "" H 1650 5800 50  0001 C CNN
	1    1650 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5900 1900 5850
Wire Wire Line
	1900 5850 1650 5850
Wire Wire Line
	1650 5850 1650 5800
Wire Wire Line
	2300 5900 2300 5850
Wire Wire Line
	2300 5850 1900 5850
Connection ~ 1900 5850
Wire Wire Line
	1900 6200 1900 6250
Wire Wire Line
	2300 6200 2300 6350
Wire Wire Line
	1900 6250 1650 6250
Wire Wire Line
	1650 6250 1650 6350
Connection ~ 1900 6250
Wire Wire Line
	1900 6250 1900 6350
Wire Wire Line
	1900 6350 2300 6350
Connection ~ 1900 6350
Wire Wire Line
	1900 6350 1900 6400
Connection ~ 2300 6350
Wire Wire Line
	2300 6350 2300 6400
Wire Wire Line
	2300 6700 2300 6750
Wire Wire Line
	2300 6750 1900 6750
Wire Wire Line
	1900 6750 1900 6700
Wire Wire Line
	1650 6800 1650 6750
Wire Wire Line
	1650 6750 1900 6750
Connection ~ 1900 6750
$Comp
L Device:C C19
U 1 1 5DC7BE97
P 1850 1700
F 0 "C19" H 1965 1746 50  0000 L CNN
F 1 "0.1u" H 1965 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1888 1550 50  0001 C CNN
F 3 "~" H 1850 1700 50  0001 C CNN
	1    1850 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C21
U 1 1 5DC7BEA1
P 1850 2200
F 0 "C21" H 1965 2246 50  0000 L CNN
F 1 "0.1u" H 1965 2155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1888 2050 50  0001 C CNN
F 3 "~" H 1850 2200 50  0001 C CNN
	1    1850 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C20
U 1 1 5DC7BEAB
P 2250 1700
F 0 "C20" H 2365 1746 50  0000 L CNN
F 1 "0.1u" H 2365 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2288 1550 50  0001 C CNN
F 3 "~" H 2250 1700 50  0001 C CNN
	1    2250 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C22
U 1 1 5DC7BEB5
P 2250 2200
F 0 "C22" H 2365 2246 50  0000 L CNN
F 1 "0.1u" H 2365 2155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2288 2050 50  0001 C CNN
F 3 "~" H 2250 2200 50  0001 C CNN
	1    2250 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0160
U 1 1 5DC7BEBF
P 1600 2000
F 0 "#PWR0160" H 1600 1750 50  0001 C CNN
F 1 "GND" H 1605 1827 50  0000 C CNN
F 2 "" H 1600 2000 50  0001 C CNN
F 3 "" H 1600 2000 50  0001 C CNN
	1    1600 2000
	1    0    0    -1  
$EndComp
$Comp
L power:-12V #PWR0161
U 1 1 5DC7BEC9
P 1600 2450
F 0 "#PWR0161" H 1600 2550 50  0001 C CNN
F 1 "-12V" H 1615 2623 50  0000 C CNN
F 2 "" H 1600 2450 50  0001 C CNN
F 3 "" H 1600 2450 50  0001 C CNN
	1    1600 2450
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5DC7BED3
P 1600 1450
AR Path="/5DB65292/5DC7BED3" Ref="#PWR?"  Part="1" 
AR Path="/5DD3636A/5DC7BED3" Ref="#PWR0162"  Part="1" 
F 0 "#PWR0162" H 1600 1300 50  0001 C CNN
F 1 "+12V" H 1615 1623 50  0000 C CNN
F 2 "" H 1600 1450 50  0001 C CNN
F 3 "" H 1600 1450 50  0001 C CNN
	1    1600 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1550 1850 1500
Wire Wire Line
	1850 1500 1600 1500
Wire Wire Line
	1600 1500 1600 1450
Wire Wire Line
	2250 1550 2250 1500
Wire Wire Line
	2250 1500 1850 1500
Connection ~ 1850 1500
Wire Wire Line
	1850 1850 1850 1900
Wire Wire Line
	2250 1850 2250 2000
Wire Wire Line
	1850 1900 1600 1900
Wire Wire Line
	1600 1900 1600 2000
Connection ~ 1850 1900
Wire Wire Line
	1850 1900 1850 2000
Wire Wire Line
	1850 2000 2250 2000
Connection ~ 1850 2000
Wire Wire Line
	1850 2000 1850 2050
Connection ~ 2250 2000
Wire Wire Line
	2250 2000 2250 2050
Wire Wire Line
	2250 2350 2250 2400
Wire Wire Line
	2250 2400 1850 2400
Wire Wire Line
	1850 2400 1850 2350
Wire Wire Line
	1600 2450 1600 2400
Wire Wire Line
	1600 2400 1850 2400
Connection ~ 1850 2400
$EndSCHEMATC
