* Positive Edge-Triggered Master-Slave D-Flip-Flop
**********SUBCIRCUIT***********
.SUBCKT  DFF  D  CLK  Q  Q_bar  VDD  GND

X_INV_1    CLK       CLK_bar      VDD  GND  INV
X_INV_2    CLK_bar   CLK_delayed  VDD  GND  INV

X_Master   D         CLK_bar      Qm  Qm_bar VDD  GND  D_LATCH
X_Slave    Qm        CLK_delayed  Q   Q_bar  VDD  GND  D_LATCH

.ENDS      DFF