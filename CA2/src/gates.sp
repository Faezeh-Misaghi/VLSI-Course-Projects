* PART1-Gates library

************LIBRARY***********
.include "32nm_bulk.pm.txt"

***********PARAMETERS***********
.param L_min=32n
.param size_inv=26
.param size_nor2=8
.param size_nor3=5.14
.param size_nand2=5.75

*********SUBCIRCUIT***********
*---INV---*
.subckt inv in out vdd gnd size=1
Mp out in vdd vdd pmos W='64n*size' L='L_min'
Mn out in gnd gnd nmos W='32n*size' L='L_min'
.ends

*---NOR2---*
.subckt nor2 in1 in2 out vdd gnd size=1
Mp1 mid in1 vdd vdd pmos W='128n*size' L='L_min'
Mp2 out in2 mid vdd pmos W='128n*size' L='L_min'
Mn1 out in1 gnd gnd nmos W='32n*size' L='L_min'
Mn2 out in2 gnd gnd nmos W='32n*size' L='L_min'
.ends

*---NOR3---*
.subckt nor3 in1 in2 in3 out vdd gnd size=1
Mp1 mid1 in1 vdd vdd pmos W='192n*size' L='L_min'
Mp2 mid2 in2 mid1 vdd pmos W='192n*size' L='L_min'
Mp3 out in3 mid2 vdd pmos W='192n*size' L='L_min'
Mn1 out in1 gnd gnd nmos W='32n*size' L='L_min'
Mn2 out in2 gnd gnd nmos W='32n*size' L='L_min'
Mn3 out in3 gnd gnd nmos W='32n*size' L='L_min'
.ends

*---NAND2---*
.subckt nand2 in1 in2 out vdd gnd size=1
Mp1 out in1 vdd vdd pmos W='64n*size' L='L_min'
Mp2 out in2 vdd vdd pmos W='64n*size' L='L_min'
Mn1 out in1 mid gnd nmos W='64n*size' L='L_min'
Mn2 mid in2 gnd gnd nmos W='64n*size' L='L_min'
.ends