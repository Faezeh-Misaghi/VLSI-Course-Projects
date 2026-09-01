* Dynamic Power Test for 8-Bit Brent-Kung Adder
.OPTION Post=1 Brief=1
.options num_threads=1

***********PARAMETERS***********
.param Vdd=1V 

***********LIBRARY***********
.lib 'crn90g_2d5_lk_v1d2p1.l' TT
.include 'gates.sp'
.include 'brent-kungAdder.sp'

***********SOURCES***********
VVDD VDD 0 Vdd
VGND GND 0 0

***********INSTANCE***********
.vec 'adder8bit_bk.vec'  
X_BK A8 A7 A6 A5 A4 A3 A2 A1 B8 B7 B6 B5 B4 B3 B2 B1 Cin S8 S7 S6 S5 S4 S3 S2 S1 Cout VDD GND BRENT_KUNG8

***********SIMULATION***********
.tran 10ps 900ns
.measure tran avg_power avg power 
.measure tran static_p_bk avg power from=899.5ns to=899.9ns

.END



