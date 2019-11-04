EESchema Schematic File Version 4
LIBS:synth-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
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
L Amplifier_Audio:LM386 U14
U 1 1 5DCC107B
P 6050 3500
F 0 "U14" H 6394 3546 50  0000 L CNN
F 1 "LM386" H 6394 3455 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6150 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm386.pdf" H 6250 3700 50  0001 C CNN
	1    6050 3500
	1    0    0    -1  
$EndComp
Text HLabel 3950 3400 0    50   Input ~ 0
AUDIO_IN
Text HLabel 7700 3500 2    50   Output ~ 0
AUDIO_OUT
$EndSCHEMATC
