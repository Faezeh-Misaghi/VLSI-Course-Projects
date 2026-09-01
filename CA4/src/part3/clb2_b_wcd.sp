* Worst-Case Delay Analysis for CLB_B2

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

XCLB_B in_nand in_nor in_not OUT VDD GND CLB_B2

* ----------------------------------------------------
* Base Case: Test Path in_nand -> OUT
* ----------------------------------------------------
Vin_nand in_nand GND pulse(0V supply 1ns 50ps 50ps 2ns 4ns)
Vin_nor  in_nor  GND 0V
Vin_not  in_not  GND supply

.tran 1ps 10ns
.measure tran delay_rise_nand_OUT trig v(in_nand) val='supply/2' rise=1 targ v(OUT) val='supply/2' fall=1
.measure tran delay_fall_nand_OUT trig v(in_nand) val='supply/2' fall=1 targ v(OUT) val='supply/2' rise=1

* ----------------------------------------------------
* ALTER 1: Test Path in_nor -> OUT
* ----------------------------------------------------
.ALTER Test_Path_in_nor
Vin_nand in_nand GND 0V
Vin_nor  in_nor  GND pulse(0V supply 1ns 50ps 50ps 2ns 4ns)
Vin_not  in_not  GND supply

.measure tran delay_rise_nor_OUT trig v(in_nor) val='supply/2' rise=1 targ v(OUT) val='supply/2' fall=1
.measure tran delay_fall_nor_OUT trig v(in_nor) val='supply/2' fall=1 targ v(OUT) val='supply/2' rise=1

* ----------------------------------------------------
* ALTER 2: Test Path in_not -> OUT
* ----------------------------------------------------
.ALTER Test_Path_in_not
Vin_nand in_nand GND 0V
Vin_nor  in_nor  GND 0V
Vin_not  in_not  GND pulse(0V supply 1ns 50ps 50ps 2ns 4ns)

.measure tran delay_rise_not_OUT trig v(in_not) val='supply/2' rise=1 targ v(OUT) val='supply/2' rise=1
.measure tran delay_fall_not_OUT trig v(in_not) val='supply/2' fall=1 targ v(OUT) val='supply/2' fall=1

.end