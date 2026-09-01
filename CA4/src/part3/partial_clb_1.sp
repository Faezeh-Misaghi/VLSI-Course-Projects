* Partitioned Combinational Logic Blocks

* CLB_A
.SUBCKT CLB_A A B C D out_xor out_xnor VDD GND

X_NAND2_1  A B net1 VDD GND NAND2_2_2
X_NOR2_1   B C net2 VDD GND NOR2_2_8
X_NOT      D D_bar  VDD GND NOT_1_2

X_XOR2_1   net2 net1  out_xor  VDD GND XOR2_3_4
X_XNOR2_1  net2 D_bar out_xnor VDD GND XNOR2_3_8

.ENDS CLB_A


* CLB_B
.SUBCKT CLB_B in_xor in_xnor OUT VDD GND

X_AND2_1      in_xnor in_xor net5 VDD GND AND2_2_4
X_NOR3_FINAL  net5 in_xor in_xnor OUT VDD GND NOR3_5_0

C_load OUT GND 100f

.ENDS CLB_B