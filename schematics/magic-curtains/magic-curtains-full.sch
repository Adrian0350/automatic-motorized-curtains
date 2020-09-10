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
L Device:Crystal Crystal1
U 1 1 5F5A2950
P 3800 2550
F 0 "Crystal1" V 3754 2681 50  0000 L CNN
F 1 "16Mhz" V 3845 2681 50  0000 L CNN
F 2 "" H 3800 2550 50  0001 C CNN
F 3 "~" H 3800 2550 50  0001 C CNN
	1    3800 2550
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5F5A495B
P 3050 1300
F 0 "R1" H 3120 1346 50  0000 L CNN
F 1 "10k" H 3120 1255 50  0000 L CNN
F 2 "" V 2980 1300 50  0001 C CNN
F 3 "~" H 3050 1300 50  0001 C CNN
	1    3050 1300
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0101
U 1 1 5F5A820A
P 650 750
F 0 "#PWR0101" H 650 600 50  0001 C CNN
F 1 "+5V" H 665 923 50  0000 C CNN
F 2 "" H 650 750 50  0001 C CNN
F 3 "" H 650 750 50  0001 C CNN
	1    650  750 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5F5CF4DB
P 1050 750
F 0 "#PWR0102" H 1050 500 50  0001 C CNN
F 1 "GND" H 1055 577 50  0000 C CNN
F 2 "" H 1050 750 50  0001 C CNN
F 3 "" H 1050 750 50  0001 C CNN
	1    1050 750 
	-1   0    0    1   
$EndComp
Wire Wire Line
	2100 4550 2100 4600
Connection ~ 2100 4600
Wire Wire Line
	2100 4600 2100 5200
Wire Wire Line
	2700 2500 3500 2500
Wire Wire Line
	2700 2600 3500 2600
Wire Wire Line
	3500 2500 3500 2400
Wire Wire Line
	3500 2400 3800 2400
Wire Wire Line
	3500 2600 3500 2700
Wire Wire Line
	3500 2700 3800 2700
Connection ~ 3800 2400
Wire Wire Line
	3800 2400 4200 2400
Connection ~ 3800 2700
Wire Wire Line
	3800 2700 4200 2700
Wire Wire Line
	2100 5200 2900 5200
Wire Wire Line
	5250 5200 5250 3250
Wire Wire Line
	4200 2100 4200 1900
Wire Wire Line
	4200 1900 5250 1900
Connection ~ 5250 1900
Wire Wire Line
	4200 3250 5250 3250
Connection ~ 5250 3250
Wire Wire Line
	5250 3250 5250 1900
Wire Wire Line
	650  1300 1800 1300
Wire Wire Line
	2200 1300 2200 1550
Wire Wire Line
	2100 1600 2100 1400
Wire Wire Line
	2100 1400 1800 1400
Wire Wire Line
	1800 1400 1800 1300
Connection ~ 1800 1300
Wire Wire Line
	1800 1300 2200 1300
Wire Wire Line
	2200 1300 2900 1300
Connection ~ 2200 1300
Wire Wire Line
	3200 3400 3200 1300
Wire Wire Line
	2900 5200 2900 5050
Connection ~ 2900 5200
Wire Wire Line
	2900 1550 2200 1550
Connection ~ 2200 1550
Wire Wire Line
	2200 1550 2200 1600
$Comp
L MCU_Microchip_ATmega:ATmega328P-PU Control1
U 1 1 5F5BF002
P 2100 3100
F 0 "Control1" H 1456 3146 50  0000 R CNN
F 1 "ATmega328P-PU" H 1456 3055 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 2100 3100 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 2100 3100 50  0001 C CNN
	1    2100 3100
	1    0    0    -1  
$EndComp
Text Notes 2150 3100 0    50   ~ 0
A0-A5
Wire Notes Line style dash_dot rgb(0, 132, 132)
	2050 2750 2600 2750
Wire Notes Line
	2600 2750 2600 3350
Text GLabel 2700 2800 2    50   Input ~ 0
A0
Text GLabel 2700 2900 2    50   Input ~ 0
A1
Text GLabel 2700 3000 2    50   Input ~ 0
A2
Text GLabel 2700 3100 2    50   Input ~ 0
A3
Text GLabel 2700 3200 2    50   Input ~ 0
A4
Wire Notes Line style dash_dot rgb(0, 132, 132)
	2600 3350 2050 3350
Wire Notes Line style dash_dot rgb(0, 132, 132)
	2050 2750 2050 3350
Text GLabel 2700 3300 2    50   Input ~ 0
A5
Wire Wire Line
	3200 3400 2700 3400
Wire Wire Line
	5250 950  1050 950 
Wire Wire Line
	1050 950  1050 750 
Wire Wire Line
	5250 950  5250 1300
Wire Wire Line
	650  750  650  1300
Text Notes 2800 5600 2    39   Italic 0
Curtain Down (OPEN)
Text Notes 4400 5700 2    39   Italic 0
Curtain Up (CLOSE)
Wire Notes Line
	2050 4350 2050 3550
Wire Notes Line
	2050 4350 2600 4350
Text GLabel 2700 3600 2    50   Input Italic 0
RX
Text GLabel 2700 3700 2    50   Input Italic 0
TX
Text GLabel 2700 3800 2    50   Input Italic 0
D2
Text GLabel 2700 3900 2    50   Input Italic 0
D3
Text GLabel 2700 4000 2    50   Input Italic 0
D4
Text GLabel 2700 4100 2    50   Input Italic 0
D5
Text GLabel 2700 4200 2    50   Input Italic 0
D6
Text GLabel 2700 4300 2    50   Input Italic 0
D7
Text GLabel 2700 1900 2    50   Input Italic 0
D8
Text GLabel 2700 2000 2    50   Input Italic 0
D9
Text GLabel 2700 2100 2    39   Input Italic 0
D10
Text GLabel 2700 2200 2    39   Input Italic 0
D11
Text GLabel 2700 2300 2    39   Input Italic 0
D12
Wire Notes Line
	2600 3550 2050 3550
Wire Notes Line
	2600 1850 2250 1850
Wire Notes Line
	2250 1850 2250 2450
Wire Notes Line
	2250 2450 2600 2450
Wire Wire Line
	2850 3800 6250 3800
Text Notes 6000 3900 2    39   Italic 0
Curtain 1 Up (CLOSE)
Text Notes 6050 3800 2    39   Italic 0
Curtain 1 Down (OPEN)
Text Notes 6050 4000 2    39   Italic 0
Curtain 2 Down (OPEN)
Text Notes 6000 4100 2    39   Italic 0
Curtain 2 Up (CLOSE)
Wire Wire Line
	2850 2900 3500 2900
Wire Wire Line
	2850 2800 3600 2800
Text GLabel 2700 2400 2    39   Input Italic 0
D13
$Comp
L Device:R R4
U 1 1 5F5B7CB1
P 7500 3500
F 0 "R4" V 7707 3500 50  0000 C CNN
F 1 "1k" V 7616 3500 50  0000 C CNN
F 2 "" V 7430 3500 50  0001 C CNN
F 3 "~" H 7500 3500 50  0001 C CNN
	1    7500 3500
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C1
U 1 1 5F5BF75C
P 4200 2250
F 0 "C1" H 4318 2296 50  0000 L CNN
F 1 "22pF" H 4318 2205 50  0000 L CNN
F 2 "" H 4238 2100 50  0001 C CNN
F 3 "~" H 4200 2250 50  0001 C CNN
	1    4200 2250
	-1   0    0    1   
$EndComp
$Comp
L Device:CP C2
U 1 1 5F5BFA16
P 4200 2850
F 0 "C2" H 4318 2896 50  0000 L CNN
F 1 "22pF" H 4318 2805 50  0000 L CNN
F 2 "" H 4238 2700 50  0001 C CNN
F 3 "~" H 4200 2850 50  0001 C CNN
	1    4200 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 5F5C003A
P 2900 4900
F 0 "C3" H 3018 4946 50  0000 L CNN
F 1 "10uF" H 3018 4855 50  0000 L CNN
F 2 "" H 2938 4750 50  0001 C CNN
F 3 "~" H 2900 4900 50  0001 C CNN
	1    2900 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1550 2900 4750
Wire Wire Line
	4200 3000 4200 3250
Wire Wire Line
	3500 2900 3500 4700
Wire Wire Line
	3600 4600 3750 4600
Wire Wire Line
	3600 2800 3600 4600
$Comp
L Device:R R2
U 1 1 5F5F80C8
P 3750 4950
F 0 "R2" H 3680 4904 50  0000 R CNN
F 1 "10k" H 3680 4995 50  0000 R CNN
F 2 "" V 3680 4950 50  0001 C CNN
F 3 "~" H 3750 4950 50  0001 C CNN
	1    3750 4950
	-1   0    0    1   
$EndComp
Wire Wire Line
	2900 5200 3750 5200
$Comp
L Device:R R3
U 1 1 5F5FB5A8
P 4050 4950
F 0 "R3" H 3980 4904 50  0000 R CNN
F 1 "10k" H 3980 4995 50  0000 R CNN
F 2 "" V 3980 4950 50  0001 C CNN
F 3 "~" H 4050 4950 50  0001 C CNN
	1    4050 4950
	-1   0    0    1   
$EndComp
Wire Wire Line
	3500 4700 4050 4700
Wire Wire Line
	3750 5100 3750 5200
Connection ~ 3750 5200
Wire Wire Line
	3750 5200 4050 5200
Wire Wire Line
	4050 5100 4050 5200
Connection ~ 4050 5200
Wire Wire Line
	4050 5200 5250 5200
Wire Wire Line
	4050 4800 4050 4700
Connection ~ 4050 4700
Wire Wire Line
	4050 4700 4350 4700
Wire Wire Line
	3750 4800 3750 4600
Connection ~ 3750 4600
Wire Wire Line
	3750 4600 4450 4600
$Comp
L Device:R R5
U 1 1 5F60AA8A
P 7500 3800
F 0 "R5" V 7707 3800 50  0000 C CNN
F 1 "1k" V 7616 3800 50  0000 C CNN
F 2 "" V 7430 3800 50  0001 C CNN
F 3 "~" H 7500 3800 50  0001 C CNN
	1    7500 3800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R6
U 1 1 5F60AE02
P 7500 4100
F 0 "R6" V 7707 4100 50  0000 C CNN
F 1 "1k" V 7616 4100 50  0000 C CNN
F 2 "" V 7430 4100 50  0001 C CNN
F 3 "~" H 7500 4100 50  0001 C CNN
	1    7500 4100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 5F60B150
P 7500 4400
F 0 "R7" V 7707 4400 50  0000 C CNN
F 1 "1k" V 7616 4400 50  0000 C CNN
F 2 "" V 7430 4400 50  0001 C CNN
F 3 "~" H 7500 4400 50  0001 C CNN
	1    7500 4400
	0    -1   -1   0   
$EndComp
Connection ~ 650  1300
$Comp
L Connector:Conn_01x01_Female OUT1
U 1 1 5F63059F
P 8100 3500
F 0 "OUT1" H 8128 3526 50  0000 L CNN
F 1 "5v" H 8128 3435 50  0000 L CNN
F 2 "" H 8100 3500 50  0001 C CNN
F 3 "~" H 8100 3500 50  0001 C CNN
	1    8100 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female OUT2
U 1 1 5F6317AD
P 8100 3800
F 0 "OUT2" H 8128 3826 50  0000 L CNN
F 1 "5v" H 8128 3735 50  0000 L CNN
F 2 "" H 8100 3800 50  0001 C CNN
F 3 "~" H 8100 3800 50  0001 C CNN
	1    8100 3800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female OUT3
U 1 1 5F631D32
P 8100 4100
F 0 "OUT3" H 8128 4126 50  0000 L CNN
F 1 "5v" H 8128 4035 50  0000 L CNN
F 2 "" H 8100 4100 50  0001 C CNN
F 3 "~" H 8100 4100 50  0001 C CNN
	1    8100 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female OUT4
U 1 1 5F632113
P 8100 4400
F 0 "OUT4" H 8128 4426 50  0000 L CNN
F 1 "5v" H 8128 4335 50  0000 L CNN
F 2 "" H 8100 4400 50  0001 C CNN
F 3 "~" H 8100 4400 50  0001 C CNN
	1    8100 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3500 7900 3500
Wire Wire Line
	7650 3800 7900 3800
Wire Wire Line
	7900 4100 7650 4100
Wire Wire Line
	7650 4400 7900 4400
$Comp
L Relay:ADW11 K?
U 1 1 5F638E72
P 1800 6900
F 0 "K?" H 1370 6854 50  0000 R CNN
F 1 "ADW11" H 1370 6945 50  0000 R CNN
F 2 "Relay_THT:Relay_1P1T_NO_10x24x18.8mm_Panasonic_ADW11xxxxW_THT" H 3125 6850 50  0001 C CNN
F 3 "https://www.panasonic-electric-works.com/pew/es/downloads/ds_dw_hl_en.pdf" H 1800 6900 50  0001 C CNN
	1    1800 6900
	0    -1   -1   0   
$EndComp
$Comp
L Relay:ADW11 K?
U 1 1 5F63B455
P 3500 6900
F 0 "K?" H 3070 6854 50  0000 R CNN
F 1 "ADW11" H 3070 6945 50  0000 R CNN
F 2 "Relay_THT:Relay_1P1T_NO_10x24x18.8mm_Panasonic_ADW11xxxxW_THT" H 4825 6850 50  0001 C CNN
F 3 "https://www.panasonic-electric-works.com/pew/es/downloads/ds_dw_hl_en.pdf" H 3500 6900 50  0001 C CNN
	1    3500 6900
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x01_Female External1
U 1 1 5F6B2913
P 1300 7650
F 0 "External1" V 1146 7698 50  0000 L CNN
F 1 "Vv" V 1237 7698 50  0000 L CNN
F 2 "" H 1300 7650 50  0001 C CNN
F 3 "~" H 1300 7650 50  0001 C CNN
	1    1300 7650
	0    1    1    0   
$EndComp
Wire Wire Line
	1300 7450 1300 7100
Wire Wire Line
	1300 7100 1500 7100
Wire Wire Line
	2100 7100 2300 7100
Wire Wire Line
	2300 7100 2300 7450
Wire Wire Line
	2950 7450 2950 7100
Wire Wire Line
	2950 7100 3200 7100
Wire Wire Line
	4000 7450 4000 7100
Wire Wire Line
	4000 7100 3800 7100
Wire Wire Line
	650  6600 1500 6600
Wire Wire Line
	650  1300 650  6000
Wire Wire Line
	650  6000 3000 6000
Wire Wire Line
	3000 6000 3000 6600
Wire Wire Line
	3000 6600 3200 6600
Connection ~ 650  6000
Wire Wire Line
	650  6000 650  6600
Wire Wire Line
	4350 5600 2100 5600
Wire Wire Line
	2100 5600 2100 6700
Wire Wire Line
	4350 4700 4350 5600
Wire Wire Line
	3800 5700 3800 6700
Wire Wire Line
	4450 4600 4450 5700
Wire Wire Line
	4450 5700 3800 5700
$Comp
L Connector:Conn_01x01_Female External2
U 1 1 5F6D5C97
P 2300 7650
F 0 "External2" V 2146 7698 50  0000 L CNN
F 1 "Vv" V 2237 7698 50  0000 L CNN
F 2 "" H 2300 7650 50  0001 C CNN
F 3 "~" H 2300 7650 50  0001 C CNN
	1    2300 7650
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Female External3
U 1 1 5F6D61C8
P 2950 7650
F 0 "External3" V 2796 7698 50  0000 L CNN
F 1 "Vv" V 2887 7698 50  0000 L CNN
F 2 "" H 2950 7650 50  0001 C CNN
F 3 "~" H 2950 7650 50  0001 C CNN
	1    2950 7650
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x01_Female External4
U 1 1 5F6D66BA
P 4000 7650
F 0 "External4" V 3846 7698 50  0000 L CNN
F 1 "Vv" V 3937 7698 50  0000 L CNN
F 2 "" H 4000 7650 50  0001 C CNN
F 3 "~" H 4000 7650 50  0001 C CNN
	1    4000 7650
	0    1    1    0   
$EndComp
Text Notes 2350 7000 0    39   Italic 8
CRESTRON MPC-M5
Wire Wire Line
	2850 3900 6350 3900
Wire Wire Line
	2850 4000 6350 4000
Wire Wire Line
	2850 4100 6250 4100
$Comp
L Relay_SolidState:S102S02 U?
U 1 1 5F709CAF
P 10250 2750
F 0 "U?" H 10250 3075 50  0000 C CNN
F 1 "S102S02" H 10250 2984 50  0000 C CNN
F 2 "Package_SIP:SIP4_Sharp-SSR_P7.62mm_Straight" H 10050 2550 50  0001 L CIN
F 3 "http://www.sharp-world.com/products/device/lineup/data/pdf/datasheet/s102s02_e.pdf" H 10250 2750 50  0001 L CNN
	1    10250 2750
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:S102S02 U?
U 1 1 5F70CD40
P 10250 3500
F 0 "U?" H 10250 3825 50  0000 C CNN
F 1 "S102S02" H 10250 3734 50  0000 C CNN
F 2 "Package_SIP:SIP4_Sharp-SSR_P7.62mm_Straight" H 10050 3300 50  0001 L CIN
F 3 "http://www.sharp-world.com/products/device/lineup/data/pdf/datasheet/s102s02_e.pdf" H 10250 3500 50  0001 L CNN
	1    10250 3500
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:S102S02 U?
U 1 1 5F70F091
P 10250 4600
F 0 "U?" H 10250 4925 50  0000 C CNN
F 1 "S102S02" H 10250 4834 50  0000 C CNN
F 2 "Package_SIP:SIP4_Sharp-SSR_P7.62mm_Straight" H 10050 4400 50  0001 L CIN
F 3 "http://www.sharp-world.com/products/device/lineup/data/pdf/datasheet/s102s02_e.pdf" H 10250 4600 50  0001 L CNN
	1    10250 4600
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:S102S02 U?
U 1 1 5F70FD8A
P 10250 5350
F 0 "U?" H 10250 5675 50  0000 C CNN
F 1 "S102S02" H 10250 5584 50  0000 C CNN
F 2 "Package_SIP:SIP4_Sharp-SSR_P7.62mm_Straight" H 10050 5150 50  0001 L CIN
F 3 "http://www.sharp-world.com/products/device/lineup/data/pdf/datasheet/s102s02_e.pdf" H 10250 5350 50  0001 L CNN
	1    10250 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3800 6250 3500
Wire Wire Line
	6250 3500 7350 3500
Wire Wire Line
	6350 3900 6350 3800
Wire Wire Line
	6350 3800 7350 3800
Wire Wire Line
	6250 4100 6250 4400
Wire Wire Line
	6250 4400 7350 4400
Wire Wire Line
	6350 4000 6350 4100
Wire Wire Line
	6350 4100 7350 4100
Wire Wire Line
	8100 3500 8350 3500
Wire Wire Line
	8100 3800 8550 3800
Wire Wire Line
	8550 3800 8550 3400
Wire Wire Line
	8550 3400 9950 3400
Wire Wire Line
	8100 4100 8550 4100
Wire Wire Line
	8100 4400 8400 4400
Wire Wire Line
	8400 4400 8400 5250
Wire Wire Line
	8400 5250 9950 5250
Wire Wire Line
	5250 1300 9550 1300
Wire Wire Line
	9550 5450 9950 5450
Connection ~ 5250 1300
Wire Wire Line
	5250 1300 5250 1900
Wire Wire Line
	9550 1300 9550 2850
Wire Wire Line
	8550 4100 8550 4500
Wire Wire Line
	8350 3500 8350 2650
Wire Wire Line
	8350 2650 9950 2650
Wire Wire Line
	8550 4500 9950 4500
Wire Wire Line
	9550 4700 9950 4700
Connection ~ 9550 4700
Wire Wire Line
	9550 4700 9550 5450
Wire Wire Line
	9550 3600 9950 3600
Connection ~ 9550 3600
Wire Wire Line
	9550 3600 9550 4700
Wire Wire Line
	9950 2850 9550 2850
Connection ~ 9550 2850
Wire Wire Line
	9550 2850 9550 3600
Text Notes 10700 2750 0    39   Italic 8
CUR1 (OPEN)
Text Notes 10700 3500 0    39   Italic 8
CUR1 (CLOSE)
Text Notes 10700 4600 0    39   Italic 8
CUR2 (OPEN)
Text Notes 10700 5350 0    39   Italic 8
CUR2 (CLOSE)
$EndSCHEMATC
