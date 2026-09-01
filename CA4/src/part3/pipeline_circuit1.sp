* Pipeline Circuit Implementation (Figure 4)

.SUBCKT PIPELINE A_in B_in C_in D_in OUT_C CLK1 VDD GND

X_INV_CLK CLK1 CLK2 VDD GND INV

X_L1_A A_in CLK1 A_latched Qbar_A VDD GND D_LATCH_POS
X_L1_B B_in CLK1 B_latched Qbar_B VDD GND D_LATCH_POS
X_L1_C C_in CLK1 C_latched Qbar_C VDD GND D_LATCH_POS
X_L1_D D_in CLK1 D_latched Qbar_D VDD GND D_LATCH_POS

X_CLB_A A_latched B_latched C_latched D_latched out_xor_A out_xnor_A VDD GND CLB_A

X_L2_1 out_xor_A  CLK2 latched_in_xor  Qbar_L2_1 VDD GND D_LATCH_POS
X_L2_2 out_xnor_A CLK2 latched_in_xnor Qbar_L2_2 VDD GND D_LATCH_POS

X_CLB_B latched_in_xor latched_in_xnor out_B VDD GND CLB_B

X_L1_OUT out_B CLK1 OUT_C Qbar_OUT VDD GND D_LATCH_POS

.ENDS PIPELINE