* 8-bit Brent-Kung Adder Monte Carlo Simulation

********** LIBRARIES & INCLUDES **********
.lib 'crn90g_2d5_lk_v1d2p1.l' TT
.include 'gates.sp'
.include 'brent-kungAdder.sp'

********** MONTE CARLO PARAMETERS **********
.param dev_raw = agauss(0, 0.1, 1)
.param dev = 'max(min(dev_raw, 0.2), -0.25)'
.param Vdd_val = '1 + dev'

********** POWER SUPPLIES **********
V_VDD VDD 0 Vdd_val
V_GND GND 0 0

********** INPUTS (VECTOR FILE) **********
.vec 'part3.vec'

********** CIRCUIT INSTANTIATION **********
X_BK A8 A7 A6 A5 A4 A3 A2 A1 B8 B7 B6 B5 B4 B3 B2 B1 Cin S8 S7 S6 S5 S4 S3 S2 S1 Cout VDD GND BRENT_KUNG8

********** MEASUREMENTS **********
.tran 5p 1100n SWEEP MONTE=100

.measure tran tpd_cout trig v(Cin) val='Vdd_val*0.5' cross=1 targ v(Cout) val='Vdd_val*0.5' cross=1
.measure tran tpd_sum8 trig v(Cin) val='Vdd_val*0.5' cross=1 targ v(S8) val='Vdd_val*0.5' cross=1
.measure tran tpd_max param='max(tpd_cout, tpd_sum8)'

.measure tran P_stat avg power from=0n to=2n
.measure tran P_total avg power from=0n to=1100n
.measure tran P_dyn param='P_total - P_stat'

.end