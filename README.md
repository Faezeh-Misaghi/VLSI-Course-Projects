# VLSI Course Computer Assignments

This repository contains a collection of four computer assignments completed for the **VLSI Design** course at the University of Tehran (Academic Year 2025-2026). The projects focus on the transistor-level design, simulation, and optimization of digital CMOS circuits using 90nm and 180nm technologies.

---

## Repository Structure

The repository is organized into four main directories, each containing the HSPICE source files (`src`) and a detailed engineering report (`report_en.pdf`).

.
├── CA1
│   ├── src/                 # HSPICE netlists for basic gates and 8-bit RCA
│   └── report_en.pdf        # Simulation and Analysis of CMOS Basic Gates
├── CA2
│   ├── src/                 # HSPICE netlists and Python plot scripts
│   └── report_en.pdf        # Delay Optimization and Logical Effort
├── CA3
│   ├── src/                 # Test vector generators and corner simulation files
│   └── report_en.pdf        # Performance Analysis of Adders and Monte Carlo Simulations
├── CA4
│   ├── src/                 # Flip-flop, latches, and pipeline netlists
│   └── report_en.pdf        # Logic Gate Sizing, Flip-Flops, and Pipelining
└── .gitignore

---

## Project Abstracts

**CA1: Simulation and Analysis of CMOS Basic Gates**
This project establishes the foundational transistor-level design of standard logic gates (INV, NAND, NOR, XOR, MUX) using 90nm CMOS technology. The assignment evaluates worst-case propagation delays, analyzes the impact of PVT (Process, Voltage, Temperature) variations, and concludes with the implementation of an 8-bit Ripple Carry Adder. 
> *For detailed waveforms, tables, and step-by-step delay calculations, please read the full report in the `CA1` directory.*

**CA2: Delay Optimization and Logical Effort**
Focusing on the critical balance between speed and power, this assignment applies the Logical Effort method to size transistors optimally across a multi-stage logic path. It explores the trade-off between dynamic and static (leakage) power and demonstrates how adding buffer stages can achieve theoretical minimum delays. 
> *Check out the complete mathematical breakdown and HSPICE power measurements in the `CA2` report.*

**CA3: Performance Analysis of Adders & Monte Carlo Simulations**
This project contrasts a standard 8-bit Ripple-Carry Adder with a high-speed Brent-Kung (Parallel Prefix) Adder. It features comprehensive Process Corner analysis (TT, FF, SS, FS, SF) and uses Monte Carlo simulations to statistically evaluate how temperature and supply voltage fluctuations impact the critical path. 
> *For comprehensive histograms, scatter plots, and process corner data, read the full report in the `CA3` directory.*

**CA4: Logic Gate Sizing, Flip-Flops, and Pipelining**
Exploring synchronous digital design, this assignment involves the construction of a Positive Edge-Triggered Master-Slave D-Flip-Flop to evaluate setup, hold, and clock-to-Q times. By implementing a pipelined architecture with level-sensitive latches and non-overlapping two-phase clocks, the design successfully exploits "Time Borrowing" to reach a maximum operating frequency of 2.44 GHz. 
> *For an in-depth look at the timing diagrams and pipeline balancing, please read the `CA4` report.*

---

## Tools and Technologies
* **Simulation:** Synopsys HSPICE
* **Data Processing & Plotting:** Python (Numpy, Matplotlib)
* **Documentation:** LaTeX

## Author
**Faezeh Misaghi**  
School of Electrical and Computer Engineering, University of Tehran
