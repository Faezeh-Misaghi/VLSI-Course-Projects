* D_latch Circuit Implementations

.SUBCKT  D_LATCH_NEG  D  CLK  Q  Q_bar  VDD  GND
X_INV_CLK  CLK    CLK_bar  VDD  GND  INV
X_INV_D    D      D_bar    VDD  GND  INV

X_NAND_S   D      CLK_bar  S_bar  VDD  GND  NAND2
X_NAND_R   D_bar  CLK_bar  R_bar  VDD  GND  NAND2

X_NAND_Q   S_bar  Q_bar    Q      VDD  GND  NAND2
X_NAND_QB  R_bar  Q        Q_bar  VDD  GND  NAND2
.ENDS  D_LATCH_NEG

.SUBCKT  D_LATCH_POS  D  CLK  Q  Q_bar  VDD  GND
X_INV_D    D      D_bar    VDD  GND  INV

X_NAND_S   D      CLK      S_bar  VDD  GND  NAND2
X_NAND_R   D_bar  CLK      R_bar  VDD  GND  NAND2

X_NAND_Q   S_bar  Q_bar    Q      VDD  GND  NAND2
X_NAND_QB  R_bar  Q        Q_bar  VDD  GND  NAND2
.ENDS  D_LATCH_POS