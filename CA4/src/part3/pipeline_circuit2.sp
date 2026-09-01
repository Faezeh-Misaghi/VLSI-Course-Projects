*Pipeline Circuit Implementation 

.SUBCKT PIPELINE A_in B_in C_in D_in OUT_FINAL CLK1 VDD GND

X_INV_CLK CLK1 CLK2 VDD GND INV

X_L1_A A_in CLK1 A_latched Qbar_A VDD GND D_LATCH_POS
X_L1_B B_in CLK1 B_latched Qbar_B VDD GND D_LATCH_POS
X_L1_C C_in CLK1 C_latched Qbar_C VDD GND D_LATCH_POS
X_L1_D D_in CLK1 D_latched Qbar_D VDD GND D_LATCH_POS


X_CLB_A A_latched B_latched C_latched D_latched out_nand_A out_nor_A out_not_A VDD GND CLB_A2


X_L2_NAND out_nand_A CLK2 latched_in_nand Qbar_L2_1 VDD GND D_LATCH_POS
X_L2_NOR  out_nor_A  CLK2 latched_in_nor  Qbar_L2_2 VDD GND D_LATCH_POS
X_L2_NOT  out_not_A  CLK2 latched_in_not  Qbar_L2_3 VDD GND D_LATCH_POS


X_CLB_B latched_in_nand latched_in_nor latched_in_not out_B VDD GND CLB_B2

X_L1_OUT out_B CLK1 OUT_FINAL Qbar_OUT VDD GND D_LATCH_POS

.ENDS PIPELINE