* Phase 2 - Part B

************LIBRARY***********
.include "gates.sp"

************ SIMULATION OPTIONS ************
.options post=2                 
.options list node

************INPUT SOURCE************
Va A 0 PULSE (0 1.8 0 0.01n 0.01n 2n 4n)
Vdd vdd 0 DC 1.8
*********CIRCUIT INSTANTIATION*********
X_gate1 A 0 node_1 vdd 0 nor2 size=size_nor2

X_gate2 node_1 0 0 i vdd 0 nor3 size=size_nor3
X_gate3 node_1 0 0 node_X_mid vdd 0 nor3 size=size_nor3   
X_gate4 node_1 0 0 j vdd 0 nor3 size=size_nor3

X_gate5 vdd node_X_mid k vdd 0 nand2 size=size_nand2
X_gate6 vdd node_X_mid out vdd 0 nand2 size=size_nand2     
X_gate7 vdd node_X_mid l vdd 0 nand2 size=size_nand2

X_gate8 out n vdd 0 inv size=size_inv

*********SIMULATION & MEASUREMENTS*********
.tran 0.05n 8n

.measure tran tp_hl trig v(a) val=0.9 rise=1 targ v(out) val=0.9 fall=1
.measure tran tp_lh trig v(a) val=0.9 fall=1 targ v(out) val=0.9 rise=1

.measure tran t_propagation param='(tp_HL + tp_LH)/2'

.measure tran t_rise trig v(out) val=0.18 rise=1 targ v(out) val=1.62 rise=1
.measure tran t_fall trig v(out) val=1.62 fall=1 targ v(out) val=0.18 fall=1

.probe tran v(A) v(node_1) v(node_X_mid) v(out)


.end