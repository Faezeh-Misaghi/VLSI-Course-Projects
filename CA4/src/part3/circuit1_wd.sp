* Final Timing Analysis: Critical Path B @ Max Frequency

*********** Library Inclusions ***********
.lib 'mm018.l' TT
.inc 'circuit_gate.sp'
.inc 'partial_clb_1.sp'
.inc 'gates.sp'
.inc 'd_latch.sp'
.inc 'pipeline_circuit1.sp'

********** Power Supplies **********
.param supply=1.8V
.global VDD GND
VVDD VDD GND supply
VGND GND 0   0V

********** Clock & Parameters **********
.param Tclk=410ps
.param Thalf='Tclk/2'
VCLK CLK1 GND pulse(0V supply 0ns 10ps 10ps 'Thalf-10ps' 'Tclk')

********** Stimulatio**********
VA A_in GND supply
VB B_in GND pulse(0V supply 'Tclk' 20ps 20ps 'Tclk*4' 'Tclk*8')
VC C_in GND 0V
VD D_in GND 0V

********** Circuit Instantiation **********
X_DUT A_in B_in C_in D_in OUT_C CLK1 VDD GND PIPELINE

********** Simulation & Measurement **********
.tran 1ps '5*Tclk'
.option post=2 unwrap

.measure tran Total_Path_Delay trig v(B_in) val='supply/2' rise=2 targ v(OUT_C) val='supply/2' rise=1

.end