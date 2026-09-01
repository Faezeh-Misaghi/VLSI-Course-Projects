*Brent-Kung Adder 8-bit*

********** SUBCIRCUITS ***********

*Generate and Propagate
.SUBCKT PREPROC A B g p VDD GND
X1 A B g VDD GND AND
X2 A B p VDD GND XOR
.ENDS PREPROC

*Black Cell
.SUBCKT BC g1 p1 g0 p0 g_out p_out VDD GND
X1 p1 g0 net1 VDD GND AND
X2 g1 net1 g_out VDD GND OR
X3 p1 p0 p_out VDD GND AND
.ENDS BC

*َAdder*
.SUBCKT BRENT_KUNG8 A7 A6 A5 A4 A3 A2 A1 A0 B7 B6 B5 B4 B3 B2 B1 B0 Cin Sum7 Sum6 Sum5 Sum4 Sum3 Sum2 Sum1 Sum0 Cout VDD GND

*Preprocessing 
Xpre0 A0 B0 g0_base p0 VDD GND PREPROC
Xpre1 A1 B1 g1 p1 VDD GND PREPROC
Xpre2 A2 B2 g2 p2 VDD GND PREPROC
Xpre3 A3 B3 g3 p3 VDD GND PREPROC
Xpre4 A4 B4 g4 p4 VDD GND PREPROC
Xpre5 A5 B5 g5 p5 VDD GND PREPROC
Xpre6 A6 B6 g6 p6 VDD GND PREPROC
Xpre7 A7 B7 g7 p7 VDD GND PREPROC

*Incorporate Cin
Xcin_and p0 Cin net_cin_and VDD GND AND
Xcin_or g0_base net_cin_and C0 VDD GND OR

*Forward Tree
XBC1 g1 p1 C0 p0 C1 p1_0 VDD GND BC
XBC2 g3 p3 g2 p2 g3_2 p3_2 VDD GND BC
XBC3 g5 p5 g4 p4 g5_4 p5_4 VDD GND BC
XBC4 g7 p7 g6 p6 g7_6 p7_6 VDD GND BC

* Stage 2
XBC5 g3_2 p3_2 C1 p1_0 C3 p3_0 VDD GND BC
XBC6 g7_6 p7_6 g5_4 p5_4 g7_4 p7_4 VDD GND BC

* Stage 3
XBC7 g7_4 p7_4 C3 p3_0 Cout p7_0 VDD GND BC

* Stage 4
XBC8 g5_4 p5_4 C3 p3_0 C5 p5_0 VDD GND BC

* Stage 5
XBC9  g2 p2 C1 p1_0  C2 p2_0 VDD GND BC
XBC10 g4 p4 C3 p3_0  C4 p4_0 VDD GND BC
XBC11 g6 p6 C5 p5_0  C6 p6_0 VDD GND BC

*Postprocessing 
Xsum0 p0 Cin  Sum0 VDD GND XOR
Xsum1 p1 C0   Sum1 VDD GND XOR
Xsum2 p2 C1   Sum2 VDD GND XOR
Xsum3 p3 C2   Sum3 VDD GND XOR
Xsum4 p4 C3   Sum4 VDD GND XOR
Xsum5 p5 C4   Sum5 VDD GND XOR
Xsum6 p6 C5   Sum6 VDD GND XOR
Xsum7 p7 C6   Sum7 VDD GND XOR

.ENDS BRENT_KUNG8