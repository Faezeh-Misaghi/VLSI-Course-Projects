* Phase 2 - Part D 

************LIBRARY***********
.include "gates.sp"

************PARAMETERS***********
.param size_nor2 = 8
.param size_nand2 = 5.75     
.param size_inv = 26
.param size_nor3_sweep = 5.14        

************SIMULATION OPTIONS************
.options post=2 list node

************INPUT SOURCE & VDD************
Va A 0 DC 0  
Vdd vdd 0 DC 1.8

*********CIRCUIT INSTANTIATION*********

X_gate1 A gnd node_1 vdd gnd nor2 size=size_nor2

X_gate2 node_1 gnd gnd i vdd gnd nor3 size=size_nor3_sweep 
X_gate3 node_1 gnd gnd node_X_mid vdd gnd nor3 size=size_nor3_sweep   
X_gate4 node_1 gnd gnd j vdd gnd nor3 size=size_nor3_sweep  

X_gate5 vdd node_X_mid k vdd gnd nand2 size=size_nand2    
X_gate6 vdd node_X_mid out vdd gnd nand2 size=size_nand2  
X_gate7 vdd node_X_mid l vdd gnd nand2 size=size_nand2  

X_gate8 out n vdd gnd inv size=size_inv

*********SIMULATION & MEASUREMENTS*********
.tran 0.05n 8n

.measure tran avg_power avg power from=0 to=8n

************ .ALTER BLOCK FOR PARAMETRIC SWEEP ************
.alter
.param size_nor3_sweep = 2.5  

.alter
.param size_nor3_sweep = 3.0  

.alter
.param size_nor3_sweep = 3.5  

.alter
.param size_nor3_sweep = 4.0  

.alter
.param size_nor3_sweep = 4.5  

.alter
.param size_nor3_sweep = 5.5 

.alter
.param size_nor3_sweep = 6.0  

.alter
.param size_nor3_sweep = 6.5  

.alter
.param size_nor3_sweep = 7.0  

.alter
.param size_nor3_sweep = 7.5  

.end
