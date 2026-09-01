* Worst-Case Delay Analysis for CLB_A

*********** Library Inclusions ***********
.lib 'mm018.l' TT
.inc 'circuit_gate.sp'
.inc 'partial_clb_2.sp' 

********** Power Supplies **********
.param supply=1.8V
.global VDD GND
.option post=2

VVDD VDD GND supply
VGND GND 0   0V

XCLB_A A B C D out_nand out_nor out_not VDD GND CLB_A2

* ----------------------------------------------------
* Base Case: Test Path A -> out_nand
* ----------------------------------------------------
VA A GND pulse(0V supply 1ns 50ps 50ps 2ns 4ns)
VB B GND supply
VC C GND 0V
VD D GND 0V

.tran 1ps 10ns
.measure tran delay_rise_A_nand trig v(A) val='supply/2' rise=1 targ v(out_nand) val='supply/2' fall=1
.measure tran delay_fall_A_nand trig v(A) val='supply/2' fall=1 targ v(out_nand) val='supply/2' rise=1

* ----------------------------------------------------
* ALTER 1: Test Path B -> out_nand AND B -> out_nor
* ----------------------------------------------------
.ALTER Test_Path_B
VA A GND supply
VB B GND pulse(0V supply 1ns 50ps 50ps 2ns 4ns)
VC C GND 0V
VD D GND 0V

.measure tran delay_rise_B_nand trig v(B) val='supply/2' rise=1 targ v(out_nand) val='supply/2' fall=1
.measure tran delay_fall_B_nand trig v(B) val='supply/2' fall=1 targ v(out_nand) val='supply/2' rise=1
.measure tran delay_rise_B_nor trig v(B) val='supply/2' rise=1 targ v(out_nor) val='supply/2' fall=1
.measure tran delay_fall_B_nor trig v(B) val='supply/2' fall=1 targ v(out_nor) val='supply/2' rise=1

* ----------------------------------------------------
* ALTER 2: Test Path C -> out_nor
* ----------------------------------------------------
.ALTER Test_Path_C
VA A GND supply
VB B GND 0V
VC C GND pulse(0V supply 1ns 50ps 50ps 2ns 4ns)
VD D GND 0V

.measure tran delay_rise_C_nor trig v(C) val='supply/2' rise=1 targ v(out_nor) val='supply/2' fall=1
.measure tran delay_fall_C_nor trig v(C) val='supply/2' fall=1 targ v(out_nor) val='supply/2' rise=1

* ----------------------------------------------------
* ALTER 3: Test Path D -> out_not
* ----------------------------------------------------
.ALTER Test_Path_D
VA A GND supply
VB B GND 0V
VC C GND 0V
VD D GND pulse(0V supply 1ns 50ps 50ps 2ns 4ns)

.measure tran delay_rise_D_not trig v(D) val='supply/2' rise=1 targ v(out_not) val='supply/2' fall=1
.measure tran delay_fall_D_not trig v(D) val='supply/2' fall=1 targ v(out_not) val='supply/2' rise=1

.end