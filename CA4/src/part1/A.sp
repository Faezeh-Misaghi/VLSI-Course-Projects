*================ TEST A =================
.lib 'mm018.l' TT
.inc 'gates.sp'
.inc 'circuit.sp'

VDD vdd 0 1.8
VSS gnd 0 0

X_Main A B C D OUT vdd gnd MainCircuit

.OPTION POST=2
.TEMP 25
.TRAN 10p 50n

VA A 0 PULSE(0 1.8 5n 10p 10p 5n 20n)
VB B 0 DC 1.8
VC C 0 DC 0
VD D 0 DC 0

.measure tran tpd_a_rise TRIG v(A) VAL=0.9 RISE=1
+ TARG v(OUT) VAL=0.9 RISE=1

.measure tran tpd_a_fall TRIG v(A) VAL=0.9 FALL=1
+ TARG v(OUT) VAL=0.9 FALL=1

.END