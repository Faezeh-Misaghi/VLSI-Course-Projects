* Maximum Clock Frequency 

*********** Library Inclusions ***********
.lib 'mm018.l' TT
.inc 'circuit_gate.sp'
.inc 'partial_clb_2.sp'
.inc 'gates.sp'
.inc 'd_latch.sp'
.inc 'pipeline_circuit2.sp'

********** Power Supplies **********
.param supply=1.8V
.global VDD GND

VVDD VDD GND supply
VGND GND 0   0V

********** Clock & Parameters **********
.PARAM Tclk = 1200p
.PARAM Thalf = 'Tclk/2'

VCLK CLK1 GND pulse(0V supply 0ns 10ps 10ps 'Thalf-10ps' 'Tclk')

********** Input Stimulation (Worst-Case Path) **********
VA A_in GND pulse(0V supply 'Tclk' 10ps 10ps 'Tclk*2' 'Tclk*4')
VB B_in GND supply
VC C_in GND 0V
VD D_in GND 0V

********** Circuit Instantiation **********
X_DUT A_in B_in C_in D_in OUT_FINAL CLK1 VDD GND PIPELINE

********** Measurements **********
.measure tran Total_Delay trig v(A_in) val='supply/2' rise=1 TD='Tclk-10ps' targ v(OUT_FINAL) val='supply/2' rise=1 TD='Tclk'
.measure tran Delay_CLB_B trig v(CLK1) val='supply/2' fall=2 targ v(X_DUT.out_B) val='supply/2' rise=1
.measure tran Time_Borrowed param='Delay_CLB_B - Thalf'

********** Simulation Control (SWEEP) **********
.TRAN 1ps '4 * Tclk' SWEEP Tclk 1000p 300p -10p

.OPTION POST=2 unwrap
.END