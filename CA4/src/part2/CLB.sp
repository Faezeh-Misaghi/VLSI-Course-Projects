*Main Circuit Implementation

**********SUBCIRCUITS***********

.SUBCKT MainCircuit A B C D OUT VDD GND

X_NAND2_1  A B net1 VDD GND NAND2_2_2
X_NOR2_1   B C net2 VDD GND NOR2_2_8
X_NOT  D D_bar VDD GND NOT_1_2

X_XOR2_1   net2 net1 net3 VDD GND XOR2_3_4
X_XNOR2_1  net2 D_bar net4 VDD GND XNOR2_3_8

X_AND2_1  net4 net3 net5 VDD GND AND2_2_4

X_NOR3_FINAL net5 net3 net4 OUT VDD GND NOR3_5_0

C_load OUT GND 100f
.ENDS MainCircuit
