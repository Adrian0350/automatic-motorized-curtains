EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Device:Crystal Crystal
U 1 1 5F5A2950
P 4100 3550
F 0 "Crystal" V 4054 3681 50  0000 L CNN
F 1 "16Mhz" V 4145 3681 50  0000 L CNN
F 2 "" H 4100 3550 50  0001 C CNN
F 3 "~" H 4100 3550 50  0001 C CNN
	1    4100 3550
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5F5A495B
P 3350 2300
F 0 "R1" H 3420 2346 50  0000 L CNN
F 1 "10k" H 3420 2255 50  0000 L CNN
F 2 "" V 3280 2300 50  0001 C CNN
F 3 "~" H 3350 2300 50  0001 C CNN
	1    3350 2300
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C3
U 1 1 5F5A574C
P 3200 5900
F 0 "C3" H 3315 5946 50  0000 L CNN
F 1 "10uF" H 3315 5855 50  0000 L CNN
F 2 "" H 3238 5750 50  0001 C CNN
F 3 "~" H 3200 5900 50  0001 C CNN
	1    3200 5900
	-1   0    0    1   
$EndComp
$Comp
L Device:C C2
U 1 1 5F5A622D
P 4500 3850
F 0 "C2" H 4615 3896 50  0000 L CNN
F 1 "22pF" H 4615 3805 50  0000 L CNN
F 2 "" H 4538 3700 50  0001 C CNN
F 3 "~" H 4500 3850 50  0001 C CNN
	1    4500 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5F5A6820
P 4500 3250
F 0 "C1" H 4615 3296 50  0000 L CNN
F 1 "22pF" H 4615 3205 50  0000 L CNN
F 2 "" H 4538 3100 50  0001 C CNN
F 3 "~" H 4500 3250 50  0001 C CNN
	1    4500 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F5A820A
P 950 1750
F 0 "#PWR?" H 950 1600 50  0001 C CNN
F 1 "+5V" H 965 1923 50  0000 C CNN
F 2 "" H 950 1750 50  0001 C CNN
F 3 "" H 950 1750 50  0001 C CNN
	1    950  1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5CF4DB
P 1350 1750
F 0 "#PWR?" H 1350 1500 50  0001 C CNN
F 1 "GND" H 1355 1577 50  0000 C CNN
F 2 "" H 1350 1750 50  0001 C CNN
F 3 "" H 1350 1750 50  0001 C CNN
	1    1350 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	2400 5550 2400 5600
Connection ~ 2400 5600
Wire Wire Line
	2400 5600 2400 6200
Wire Wire Line
	3000 3500 3800 3500
Wire Wire Line
	3000 3600 3800 3600
Wire Wire Line
	3800 3500 3800 3400
Wire Wire Line
	3800 3400 4100 3400
Wire Wire Line
	3800 3600 3800 3700
Wire Wire Line
	3800 3700 4100 3700
Connection ~ 4100 3400
Wire Wire Line
	4100 3400 4500 3400
Connection ~ 4100 3700
Wire Wire Line
	4100 3700 4500 3700
Wire Wire Line
	2400 6200 3200 6200
Wire Wire Line
	5550 6200 5550 4250
Wire Wire Line
	4500 3100 4500 2900
Wire Wire Line
	4500 2900 5550 2900
Connection ~ 5550 2900
Wire Wire Line
	4500 4000 4500 4250
Wire Wire Line
	4500 4250 5550 4250
Connection ~ 5550 4250
Wire Wire Line
	5550 4250 5550 2900
Wire Wire Line
	950  2300 2100 2300
Wire Wire Line
	2500 2300 2500 2550
Wire Wire Line
	2400 2600 2400 2400
Wire Wire Line
	2400 2400 2100 2400
Wire Wire Line
	2100 2400 2100 2300
Connection ~ 2100 2300
Wire Wire Line
	2100 2300 2500 2300
Wire Wire Line
	2500 2300 3200 2300
Connection ~ 2500 2300
Wire Wire Line
	3500 4400 3500 2300
Wire Wire Line
	3200 6200 3200 6050
Connection ~ 3200 6200
Wire Wire Line
	3200 6200 5550 6200
Wire Wire Line
	3200 5750 3200 2550
Wire Wire Line
	3200 2550 2500 2550
Connection ~ 2500 2550
Wire Wire Line
	2500 2550 2500 2600
$Comp
L MCU_Microchip_ATmega:ATmega328P-PU Control
U 1 1 5F5BF002
P 2400 4100
F 0 "Control" H 1756 4146 50  0000 R CNN
F 1 "ATmega328P-PU" H 1756 4055 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 2400 4100 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 2400 4100 50  0001 C CNN
	1    2400 4100
	1    0    0    -1  
$EndComp
Text Notes 2450 4100 0    50   ~ 0
A0-A5
Wire Notes Line style dash_dot rgb(0, 132, 132)
	2350 3750 2900 3750
Wire Notes Line
	2900 3750 2900 4350
Text GLabel 3000 3800 2    50   Input ~ 0
A0
Text GLabel 3000 3900 2    50   Input ~ 0
A1
Text GLabel 3000 4000 2    50   Input ~ 0
A2
Text GLabel 3000 4100 2    50   Input ~ 0
A3
Text GLabel 3000 4200 2    50   Input ~ 0
A4
Wire Notes Line style dash_dot rgb(0, 132, 132)
	2900 4350 2350 4350
Wire Notes Line style dash_dot rgb(0, 132, 132)
	2350 3750 2350 4350
Text GLabel 3000 4300 2    50   Input ~ 0
A5
Wire Wire Line
	3500 4400 3000 4400
Wire Wire Line
	5550 1950 1350 1950
Wire Wire Line
	1350 1950 1350 1750
Wire Wire Line
	5550 1950 5550 2900
Wire Wire Line
	950  1750 950  2300
Wire Wire Line
	3150 3800 3650 3800
Wire Wire Line
	3650 3800 3650 2250
Wire Wire Line
	3150 3900 3750 3900
Wire Wire Line
	3750 3900 3750 2350
Wire Wire Line
	3750 2350 6500 2350
Text Notes 6450 2250 2    39   Italic 0
Curtain Down (OPEN)
Text Notes 6400 2350 2    39   Italic 0
Curtain Up (CLOSE)
Wire Wire Line
	3650 2250 6500 2250
$EndSCHEMATC
