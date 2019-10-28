EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
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
P 8550 3550
AR Path="/5DB65292/5DD386EE" Ref="U?"  Part="1" 
AR Path="/5DD3636A/5DD386EE" Ref="U?"  Part="1" 
F 0 "U?" H 8550 3350 50  0000 L CNN
F 1 "OPA172IDBVR" H 8500 3850 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 8450 3350 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22141b.pdf" H 8550 3750 50  0001 C CNN
	1    8550 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5DD386F4
P 9100 3550
AR Path="/5DB65292/5DD386F4" Ref="R?"  Part="1" 
AR Path="/5DD3636A/5DD386F4" Ref="R?"  Part="1" 
F 0 "R?" V 8895 3550 50  0000 C CNN
F 1 "50" V 8986 3550 50  0000 C CNN
F 2 "" V 9140 3540 50  0001 C CNN
F 3 "~" H 9100 3550 50  0001 C CNN
	1    9100 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	8950 3550 8900 3550
Wire Wire Line
	8250 3450 8050 3450
Wire Wire Line
	8250 3650 8200 3650
Wire Wire Line
	8200 3650 8200 4150
Wire Wire Line
	8200 4150 8900 4150
Wire Wire Line
	8900 4150 8900 3550
Connection ~ 8900 3550
Wire Wire Line
	8900 3550 8850 3550
$Comp
L Device:C C?
U 1 1 5DD38702
P 9450 3550
AR Path="/5DB65292/5DD38702" Ref="C?"  Part="1" 
AR Path="/5DD3636A/5DD38702" Ref="C?"  Part="1" 
F 0 "C?" V 9702 3550 50  0000 C CNN
F 1 "1uF" V 9611 3550 50  0000 C CNN
F 2 "" H 9488 3400 50  0001 C CNN
F 3 "~" H 9450 3550 50  0001 C CNN
	1    9450 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9250 3550 9300 3550
$Comp
L power:-12V #PWR?
U 1 1 5DD3870A
P 8450 3900
AR Path="/5DB65292/5DD3870A" Ref="#PWR?"  Part="1" 
AR Path="/5DD3636A/5DD3870A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8450 4000 50  0001 C CNN
F 1 "-12V" H 8465 4073 50  0000 C CNN
F 2 "" H 8450 3900 50  0001 C CNN
F 3 "" H 8450 3900 50  0001 C CNN
	1    8450 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	8450 3850 8450 3900
$Comp
L power:+12V #PWR?
U 1 1 5DD38711
P 8450 3200
AR Path="/5DB65292/5DD38711" Ref="#PWR?"  Part="1" 
AR Path="/5DD3636A/5DD38711" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8450 3050 50  0001 C CNN
F 1 "+12V" H 8465 3373 50  0000 C CNN
F 2 "" H 8450 3200 50  0001 C CNN
F 3 "" H 8450 3200 50  0001 C CNN
	1    8450 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 3250 8450 3200
Text HLabel 10200 3550 2    50   Output ~ 0
MUX_OUT
Wire Wire Line
	9600 3550 10200 3550
$EndSCHEMATC
