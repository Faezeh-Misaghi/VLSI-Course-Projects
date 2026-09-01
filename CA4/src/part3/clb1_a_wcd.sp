* Worst-Case Delay Analysis for CLB_A

*********** Library Inclusions ***********
.lib 'mm018.l' TT
.inc 'circuit_gate.sp'
.inc 'partial_clb_1.sp' 

********** Power Supplies **********
.param supply=1.8V
.global VDD GND
.option post=2


VVDD VDD GND supply
VGND GND 0   0V

XCLB_A A B C D out_xor out_xnor VDD GND CLB_A

* ----------------------------------------------------
* Base Case: Test Path A
* ----------------------------------------------------
VA A GND pulse(0V supply 1ns 50ps 50ps 2ns 4ns)
VB B GND supply
VC C GND 0V
VD D GND 0V

.tran 1ps 10ns
.measure tran delay_rise_A_xor trig v(A) val='supply/2' rise=1 targ v(out_xor) val='supply/2' fall=1
.measure tran delay_fall_A_xor trig v(A) val='supply/2' fall=1 targ v(out_xor) val='supply/2' rise=1

* ----------------------------------------------------
* ALTER 1: Test Path B1 
* ----------------------------------------------------
.ALTER Test_Path_B1
VA A GND supply
VB B GND pulse(0V supply 1ns 50ps 50ps 2ns 4ns)
VC C GND supply
VD D GND 0V

.measure tran delay_rise_B1_xor trig v(B) val='supply/2' rise=1 targ v(out_xor) val='supply/2' fall=1
.measure tran delay_fall_B1_xor trig v(B) val='supply/2' fall=1 targ v(out_xor) val='supply/2' rise=1

* ----------------------------------------------------
* ALTER 2: Test Path B2 
* ----------------------------------------------------
.ALTER Test_Path_B2
VA A GND 0V
VB B GND pulse(0V supply 1ns 50ps 50ps 2ns 4ns)
VC C GND 0V
VD D GND 0V

.measure tran delay_rise_B2_xor trig v(B) val='supply/2' rise=1 targ v(out_xor) val='supply/2' rise=1
.measure tran delay_fall_B2_xor trig v(B) val='supply/2' fall=1 targ v(out_xor) val='supply/2' fall=1
.measure tran delay_rise_B2_xnor trig v(B) val='supply/2' rise=1 targ v(out_xnor) val='supply/2' fall=1
.measure tran delay_fall_B2_xnor trig v(B) val='supply/2' fall=1 targ v(out_xnor) val='supply/2' rise=1

* ----------------------------------------------------
* ALTER 3: Test Path C
* ----------------------------------------------------
.ALTER Test_Path_C
VA A GND 0V
VB B GND 0V
VC C GND pulse(0V supply 1ns 50ps 50ps 2ns 4ns)
VD D GND 0V

.measure tran delay_rise_C_xor trig v(C) val='supply/2' rise=1 targ v(out_xor) val='supply/2' rise=1
.measure tran delay_fall_C_xor trig v(C) val='supply/2' fall=1 targ v(out_xor) val='supply/2' fall=1
.measure tran delay_rise_C_xnor trig v(C) val='supply/2' rise=1 targ v(out_xnor) val='supply/2' fall=1
.measure tran delay_fall_C_xnor trig v(C) val='supply/2' fall=1 targ v(out_xnor) val='supply/2' rise=1

* ----------------------------------------------------
* ALTER 4: Test Path D
* ----------------------------------------------------
.ALTER Test_Path_D
VA A GND supply
VB B GND supply
VC C GND 0V
VD D GND pulse(0V supply 1ns 50ps 50ps 2ns 4ns)

.measure tran delay_rise_D_xnor trig v(D) val='supply/2' rise=1 targ v(out_xnor) val='supply/2' rise=1
.measure tran delay_fall_D_xnor trig v(D) val='supply/2' fall=1 targ v(out_xnor) val='supply/2' fall=1

.end