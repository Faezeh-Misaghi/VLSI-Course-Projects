* 8-bit Brent-Kung Adder Temperature Sweep Simulation

********** LIBRARIES & INCLUDES **********
.lib 'crn90g_2d5_lk_v1d2p1.l' TT
.include 'gates.sp'
.include 'brent-kungAdder.sp'

********** TEMPERATURE PARAMETERS **********
.param Vdd_val = 1.0V

********** POWER SUPPLIES **********
V_VDD VDD 0 Vdd_val
V_GND GND 0 0

********** INPUTS (VECTOR FILE) **********
.vec 'part3.vec'

********** CIRCUIT INSTANTIATION **********
X_BK A8 A7 A6 A5 A4 A3 A2 A1 B8 B7 B6 B5 B4 B3 B2 B1 Cin S8 S7 S6 S5 S4 S3 S2 S1 Cout VDD GND BRENT_KUNG8

********** MEASUREMENTS **********
.tran 5p 220n

.temp 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90

* 1. Propagation Delay 
.measure tran tpd_cout trig v(Cin) val='Vdd_val*0.5' cross=1 targ v(Cout) val='Vdd_val*0.5' cross=1
.measure tran tpd_sum7 trig v(Cin) val='Vdd_val*0.5' cross=1 targ v(S8) val='Vdd_val*0.5' cross=1
.measure tran tpd_max param='max(tpd_cout, tpd_sum7)'

* 2. Power 
.measure tran P_stat avg p(V_VDD) from=0n to=2n
.measure tran P_total avg p(V_VDD) from=0n to=220n
.measure tran P_dyn param='P_total - P_stat'

.end