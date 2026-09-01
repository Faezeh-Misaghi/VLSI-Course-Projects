* Section 3: Verification of Positive and Negative D-Latches

*********** Library Inclusions ***********
.lib 'mm018.l' TT
.inc 'gates.sp'
.inc 'd_latch.sp'

********** Power Supplies **********
VDD vdd 0 1.8V
VSS gnd 0 0V

*********** Circuit Instantiations *************

X_Latch_Pos  D CLK Q_pos Q_bar_pos vdd gnd D_LATCH_POS
X_Latch_Neg  D CLK Q_neg Q_bar_neg vdd gnd D_LATCH_NEG

.IC V(Q_pos)=0 V(Q_neg)=0 V(D)=0

********** Stimulation  ***********
VCLK CLK 0 PULSE(0 1.8 0 10p 10p 1n 2n)
VD D 0 PULSE(0 1.8 400p 10p 10p 800p 2.5n)

********** Plotting **********
.PROBE TRAN V(CLK) V(D) V(Q_pos) V(Q_neg)

********** Simulation Control ***********
.TRAN 10p 5n
.OPTION POST=2
.END