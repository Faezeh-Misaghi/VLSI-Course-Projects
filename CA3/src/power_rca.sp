* Dynamic Power Test for 8-Bit Ripple Carry Adder 
.OPTION Brief=1
.options num_threads=4 
.option runlvl=3
.option method=gear

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
.vec 'adder8bit_rca.vec' 
X_RCA A8 A7 A6 A5 A4 A3 A2 A1 B8 B7 B6 B5 B4 B3 B2 B1 Cin S8 S7 S6 S5 S4 S3 S2 S1 Cout VDD GND RCA8

***********SIMULATION***********
.tran 10ps 1245ns 
.measure tran avg_power avg power  
.measure tran static_p_rca avg power from=760p to=820p

.END




