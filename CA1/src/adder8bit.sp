* PART2-8Bit Ripple Carry Adder

************ INCLUDE ***********
.INCLUDE 'adders.sp'

********** SUBCIRCUIT ***********
* Inputs: A[7:0], B[7:0], Cin
* Outputs: S[7:0], Cout

.SUBCKT Adder_8Bit A0 A1 A2 A3 A4 A5 A6 A7  B0 B1 B2 B3 B4 B5 B6 B7  Cin  S0 S1 S2 S3 S4 S5 S6 S7  Cout  VDD GND
    
X_FA0    A0    B0    Cin   S0    C1    VDD    GND    FullAdder_B
X_FA1    A1    B1    C1    S1    C2    VDD    GND    FullAdder_B
X_FA2    A2    B2    C2    S2    C3    VDD    GND    FullAdder_B
X_FA3    A3    B3    C3    S3    C4    VDD    GND    FullAdder_B
X_FA4    A4    B4    C4    S4    C5    VDD    GND    FullAdder_B
X_FA5    A5    B5    C5    S5    C6    VDD    GND    FullAdder_B
X_FA6    A6    B6    C6    S6    C7    VDD    GND    FullAdder_B
X_FA7    A7    B7    C7    S7    Cout    VDD    GND    FullAdder_B

.ENDS Adder_8Bit
