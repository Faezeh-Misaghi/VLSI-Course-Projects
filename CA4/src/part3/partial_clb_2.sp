* Partitioned Combinational Logic Blocks 

* CLB_A

.SUBCKT CLB_A2 A B C D out_nand out_nor out_not VDD GND

X_NAND2_1  A B out_nand VDD GND NAND2_2_2
X_NOR2_1   B C out_nor  VDD GND NOR2_2_8
X_NOT      D out_not    VDD GND NOT_1_2

.ENDS CLB_A2


* CLB_B

.SUBCKT CLB_B2 in_nand in_nor in_not OUT VDD GND

X_XOR2_1   in_nor in_nand net3 VDD GND XOR2_3_4
X_XNOR2_1  in_nor in_not  net4 VDD GND XNOR2_3_8

X_AND2_1   net4 net3 net5 VDD GND AND2_2_4

X_NOR3_FINAL net5 net3 net4 OUT VDD GND NOR3_5_0

C_load OUT GND 100f

.ENDS CLB_B2