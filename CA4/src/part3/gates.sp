* Library of Scaled Logic Gates 

***********PARAMETERS***********
.param    Lmin = 180n

* Base Inverter 
.param    wn_inv_base = 220n
.param    wp_inv_base = 770n

* NAND2 
.param    wn_nand2_2_2 = 440n
.param    wp_nand2_2_2 = 770n

**********SUBCIRCUITS***********

*--- INV ---*
.SUBCKT    INV    in    out    VDD    GND
Mn    out    in    GND    GND    nmos    W='wn_inv_base'    L='Lmin'
Mp    out    in    VDD    VDD    pmos    W='wp_inv_base'    L='Lmin'
.ENDS    INV


*--- NAND2 (2.2) ---*
.SUBCKT    NAND2    inA    inB    out    VDD    GND
Mn1    out     inB    net1   GND    nmos    W='wn_nand2_2_2'    L='Lmin'
Mn2    net1    inA    GND    GND    nmos    W='wn_nand2_2_2'    L='Lmin'
Mp1    out     inB    VDD    VDD    pmos    W='wp_nand2_2_2'    L='Lmin'
Mp2    out     inA    VDD    VDD    pmos    W='wp_nand2_2_2'    L='Lmin'
.ENDS    NAND2
