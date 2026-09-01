* Pipelined Main Circuit 

.SUBCKT CIRCUIT CLK A B C D OUT OUT_bar VDD GND

* Negative Latches for Inputs (L1)
X_Reg_A  A CLK  A_reg A_bar_reg  VDD GND D_LATCH_NEG
X_Reg_B  B CLK  B_reg B_bar_reg  VDD GND D_LATCH_NEG
X_Reg_C  C CLK  C_reg C_bar_reg  VDD GND D_LATCH_NEG
X_Reg_D  D CLK  D_reg D_bar_reg  VDD GND D_LATCH_NEG

X_Comb  A_reg B_reg C_reg D_reg  OUT_comb  VDD GND MainCircuit

* Positive Latch for Output (L2)
X_Reg_OUT OUT_comb CLK  OUT OUT_bar  VDD GND D_LATCH_POS

.ENDS CIRCUIT