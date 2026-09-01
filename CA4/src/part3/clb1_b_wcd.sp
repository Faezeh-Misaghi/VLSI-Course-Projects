* Worst-Case Delay Analysis for CLB_B

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

XCLB_B in_xor in_xnor OUT VDD GND CLB_B

* ----------------------------------------------------
* Base Case: Test Path in_xor
* ----------------------------------------------------
Vin_xor  in_xor  GND pulse(0V supply 1ns 50ps 50ps 2ns 4ns)
Vin_xnor in_xnor GND 0V

.tran 1ps 10ns

.measure tran delay_rise_inxor trig v(in_xor) val='supply/2' rise=1 targ v(OUT) val='supply/2' fall=1
.measure tran delay_fall_inxor trig v(in_xor) val='supply/2' fall=1 targ v(OUT) val='supply/2' rise=1


* ----------------------------------------------------
* ALTER 1: Test Path in_xnor
* ----------------------------------------------------
.ALTER Test_Path_in_xnor
Vin_xor  in_xor  GND 0V
Vin_xnor in_xnor GND pulse(0V supply 1ns 50ps 50ps 2ns 4ns)

.measure tran delay_rise_inxnor trig v(in_xnor) val='supply/2' rise=1 targ v(OUT) val='supply/2' fall=1
.measure tran delay_fall_inxnor trig v(in_xnor) val='supply/2' fall=1 targ v(OUT) val='supply/2' rise=1

.end