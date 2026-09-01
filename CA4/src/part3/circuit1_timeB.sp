* Pipeline Testbench: Testing Different Inputs & Max Frequency

*********** Library Inclusions ***********
.lib 'mm018.l' TT
.inc 'circuit_gate.sp'
.inc 'partial_clb_1.sp'
.inc 'gates.sp'
.inc 'd_latch.sp'
.inc 'pipeline_circuit1.sp'

********** Power Supplies and Parameters **********
.param supply=1.8V
.global VDD GND

VVDD VDD GND supply
VGND GND 0   0V

.param Tclk=640ps
.param Thalf='Tclk/2'
VCLK CLK1 GND pulse(0V supply 0ns 10ps 10ps 'Thalf-10ps' 'Tclk')

X_DUT A_in B_in C_in D_in OUT_C CLK1 VDD GND PIPELINE

VA A_in GND pulse(0V supply 'Tclk' 10ps 10ps 'Tclk*2' 'Tclk*4')
VB B_in GND supply
VC C_in GND 0V
VD D_in GND 0V

.tran 1ps 4ns
.option post=2 unwrap

.measure tran Total_Delay_Path_A trig v(A_in) val='supply/2' rise=1 TD='Tclk-10ps' targ v(OUT_C) val='supply/2' rise=1 TD='Tclk'

.ALTER Test_Path_B
VA A_in GND supply
VB B_in GND pulse(0V supply 'Tclk' 10ps 10ps 'Tclk*2' 'Tclk*4')
VC C_in GND 0V
VD D_in GND 0V

.measure tran Total_Delay_Path_B trig v(B_in) val='supply/2' rise=1 TD='Tclk-10ps' targ v(OUT_C) val='supply/2' rise=1 TD='Tclk'
.measure tran Time_Borrowed_B trig v(CLK1) val='supply/2' fall=2 targ v(X_DUT.out_xnor_A) val='supply/2' fall=1 TD='Tclk'


.ALTER Test_Path_D
VA A_in GND supply
VB B_in GND supply
VC C_in GND 0V
VD D_in GND pulse(0V supply 'Tclk' 10ps 10ps 'Tclk*2' 'Tclk*4')

.measure tran Total_Delay_Path_D trig v(D_in) val='supply/2' rise=1 TD='Tclk-10ps' targ v(OUT_C) val='supply/2' fall=1 TD='Tclk'

.end