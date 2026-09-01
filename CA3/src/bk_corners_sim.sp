* 8-bit Brent-Kung Adder - 5 Process Corners Simulation

.OPTION Post=1 Brief=1

***********PARAMETERS***********
.param Vdd=1V

***********LIBRARY***********
.lib 'crn90g_2d5_lk_v1d2p1.l' TT
.include 'gates.sp'
.include 'brent-kungAdder.sp' 

***********SOURCES***********
VVDD VDD 0 Vdd
VGND GND 0 0

********** INPUTS (VECTOR FILE) **********
.vec 'part3.vec'

***********INSTANCE***********
X_BK A8 A7 A6 A5 A4 A3 A2 A1 B8 B7 B6 B5 B4 B3 B2 B1 Cin S8 S7 S6 S5 S4 S3 S2 S1 Cout VDD GND BRENT_KUNG8

***********ANALYSIS & MEASUREMENTS***********
.tran 5p 220n

* 1. Propagation Delay (Corrected Vdd_val to Vdd)
.measure tran tpd_cout trig v(Cin) val='Vdd*0.5' cross=1 targ v(Cout) val='Vdd*0.5' cross=1
.measure tran tpd_sum7 trig v(Cin) val='Vdd*0.5' cross=1 targ v(S8) val='Vdd*0.5' cross=1
.measure tran tpd_max param='max(tpd_cout, tpd_sum7)'

* 2. Power (Corrected V_VDD to VVDD)
.measure tran P_stat avg p(VVDD) from=0n to=2n
.measure tran P_total avg p(VVDD) from=0n to=220n
.measure tran P_dyn param='P_total - P_stat'

***********CORNERS (ALTERS)***********
* Fast-Fast
.alter 'FF_Corner'
.del lib 'crn90g_2d5_lk_v1d2p1.l' TT
.lib 'crn90g_2d5_lk_v1d2p1.l' FF

* Slow-Slow
.alter 'SS_Corner'
.del lib 'crn90g_2d5_lk_v1d2p1.l' FF
.lib 'crn90g_2d5_lk_v1d2p1.l' SS

* Fast-Slow
.alter 'FS_Corner'
.del lib 'crn90g_2d5_lk_v1d2p1.l' SS
.lib 'crn90g_2d5_lk_v1d2p1.l' FS

* Slow-Fast
.alter 'SF_Corner'
.del lib 'crn90g_2d5_lk_v1d2p1.l' FS
.lib 'crn90g_2d5_lk_v1d2p1.l' SF

.end