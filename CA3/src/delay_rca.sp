* Test for worstcase delay - Ripple Carry
.OPTION Post=1 Brief=1

***********PARAMETERS***********
.param Vdd=1V

***********LIBRARY***********
.lib 'crn90g_2d5_lk_v1d2p1.l' TT
.include 'gates.sp'
.include 'ripple-carryAdder.sp'

***********SOURCES***********
VVDD VDD 0 Vdd
VGND GND 0 0

***********INSTANCE***********
X_RCA A8 A7 A6 A5 A4 A3 A2 A1 B8 B7 B6 B5 B4 B3 B2 B1 Cin S8 S7 S6 S5 S4 S3 S2 S1 Cout VDD GND RCA8

***********INPUTS***********
VA1 A1 0 Vdd
VA2 A2 0 Vdd
VA3 A3 0 Vdd
VA4 A4 0 Vdd
VA5 A5 0 Vdd
VA6 A6 0 Vdd
VA7 A7 0 Vdd
VA8 A8 0 Vdd

VB1 B1 0 0
VB2 B2 0 0
VB3 B3 0 0
VB4 B4 0 0
VB5 B5 0 0
VB6 B6 0 0
VB7 B7 0 0
VB8 B8 0 0

Vcin Cin 0 PULSE(0 Vdd 10n 0.1n 0.1n 20n 40n)

***********ANALYSIS***********
.tran 0.05n 50n

***********MEASURE COMMANDS***********
.measure tran tpd_cout trig v(Cin) val='Vdd*0.5' rise=1 targ v(Cout) val='Vdd*0.5' rise=1
.measure tran tpd_s8   trig v(Cin) val='Vdd*0.5' rise=1 targ v(S8)   val='Vdd*0.5' fall=1

.end