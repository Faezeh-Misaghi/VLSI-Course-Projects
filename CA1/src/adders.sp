* Library of Adders for CA1

************LIBRARY***********
.INCLUDE 'gates.sp'

**********SUBCIRCUIT***********
*---Structure A---*

.SUBCKT    FullAdder_A    A    B    Cin    S    Cout    VDD    GND
X_xor1    A    B    net1    VDD    GND    XOR
X_xor2    net1    Cin    S    VDD    GND    XOR
X_nand1    A    B    net2    VDD    GND    NAND
X_nand2    net1    Cin    net3    VDD    GND    NAND
X_nand3    net2    net3    Cout    VDD    GND    NAND
.ENDS FullAdder_A 

*---Structure B---*

.SUBCKT FullAdder_B    A    B    Cin    S    Cout    VDD    GND
X_nand1    A    B    net1    VDD    GND    NAND
X_nand2    A    net1    net2    VDD    GND    NAND
X_nand3    B    net1    net3    VDD    GND    NAND
X_nand4    net2    net3    net4    VDD    GND    NAND
X_nand5    net4    Cin     net5    VDD    GND    NAND
X_nand6    net4    net5    net6    VDD    GND    NAND
X_nand7    Cin    net5    net7    VDD    GND    NAND
X_nand8    net6    net7    S    VDD    GND    NAND
X_nand9    net1    net5    Cout    VDD    GND    NAND
.ENDS FullAdder_B