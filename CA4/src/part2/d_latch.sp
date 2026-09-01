* D-Latch 
**********SUBCIRCUIT***********
.SUBCKT    D_LATCH    D    E    Q    Q_bar    VDD    GND

X_INV_D    D      D_bar  VDD  GND  INV

X_NAND_S   D      E      S_bar  VDD  GND   NAND2
X_NAND_R   D_bar  E      R_bar  VDD  GND  NAND2

X_NAND_Q   S_bar  Q_bar  Q      VDD  GND  NAND2
X_NAND_QB  R_bar  Q      Q_bar  VDD  GND  NAND2

.ENDS  D_LATCH