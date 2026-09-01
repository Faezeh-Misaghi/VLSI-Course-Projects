*8-Bit Ripple Carry Adder*

********** SUBCIRCUITS ***********
   
*Full Adder*
.SUBCKT FA A B Cin Sum Cout VDD GND
X1 A B net_xor1 VDD GND XOR
X2 net_xor1 Cin Sum VDD GND XOR
X3 A B net_and1 VDD GND AND
X4 net_xor1 Cin net_and2 VDD GND AND
X5 net_and1 net_and2 Cout VDD GND OR
.ENDS FA

*8-Bit RCA*
.SUBCKT RCA8 A7 A6 A5 A4 A3 A2 A1 A0 B7 B6 B5 B4 B3 B2 B1 B0 Cin Sum7 Sum6 Sum5 Sum4 Sum3 Sum2 Sum1 Sum0 Cout VDD GND
XFA0 A0 B0 Cin      Sum0 C1  VDD GND FA
XFA1 A1 B1 C1       Sum1 C2  VDD GND FA
XFA2 A2 B2 C2       Sum2 C3  VDD GND FA
XFA3 A3 B3 C3       Sum3 C4  VDD GND FA
XFA4 A4 B4 C4       Sum4 C5  VDD GND FA
XFA5 A5 B5 C5       Sum5 C6  VDD GND FA
XFA6 A6 B6 C6       Sum6 C7  VDD GND FA
XFA7 A7 B7 C7       Sum7 Cout VDD GND FA
.ENDS RCA8
