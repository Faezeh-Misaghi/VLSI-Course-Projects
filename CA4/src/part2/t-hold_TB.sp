* Measuring t_hold of D-Flip-Flop

***********Library Inclusions***********
.lib 'mm018.l' TT
.inc 'gates.sp'
.inc 'd_latch.sp'
.inc 'd_ff.sp'

**********Power Supplies**********
VDD vdd 0 1.8V
VSS gnd 0 0V

***********Instantiating*************
X_DFF D CLK Q Q_bar vdd gnd DFF
C_load Q 0 50f

**********Initial Conditions**********
.IC V(Q)=0 V(Q_bar)=1.8

**********Stimulation & Sweep**********
VCLK CLK 0 PULSE(0 1.8 5n 50p 50p 5n 10n)
.PARAM t_h = 0p
VD D 0 PULSE(0 1.8 2n 50p 50p '3n + t_h' 20n)

**********Delay Measurement**********
.MEASURE TRAN tcq_rise TRIG V(CLK) VAL=0.9 RISE=1 TARG V(Q) VAL=0.9 RISE=1

**********Simulation Control***********
.TRAN 10p 10n SWEEP t_h 0p -400p -10p
.OPTION POST=2
.END