# Formula Student EV Powertrain Model in MATLAB-Simulink

This repository contains a Simulink powertrain model and control architecture developed in MATLAB-Simulink R2025b for a Formula Student electric vehicle. 
The control logic is inspired by the **AMK Motion*** drive system, but it may be used for different FS solutions.

Two models are available:
1. **`FS_PWT_Full_Assembly.slx`**: complete model with control algorithm, inverter and motor.
2. **`FS_PWT_Control_and_Motor.slx`**: faster model with no inverter.

For a detailed explanation of the mathematical modeling, system architecture, control logic, and simulation methodology, please refer to the attached Technical Report: **`Simulink_Powertrain_Report_public.pdf`**.

<sub>*This is an independent model developed strictly from publicly available datasheets and is not affiliated with or endorsed by AMK Motion

## License
This material is licensed under a Creative Commons Attribution-
NonCommercial 4.0 International License (CC BY-NC 4.0). You are free to share, study, and
adapt the material for educational and Formula Student purposes, provided you give appropriate
credit and do not use the material for commercial purposes.

## Getting Started

### Prerequisites
- MATLAB & Simulink version R2025b or later
- Simscape Electrical and Simscape Mechanical toolbox

### How to run the simulation
1. Download this repository and set it as MATLAB current folder (make sure that every file is in the same folder, including **`.slxp`** file)
2. Run an initialization script to set every parameter required
3. Open the desired **`.slx`** file
4. Log the desired output data or uncomment the scope
5. Set the solver with **fixed-step** configuration, check the report testing section for detailed information
6. Accelerator/Rapid accelerator mode may be used

## Example Simulation
The parameters of the simulations illustrated in the report testing sections are available as an example in **`Example_parameters.m`**. This script can be used with both the complete and simplified model.
**`Example_torque_reference.mat`** contains torque reference values for a simulation of about 17 seconds, make sure that this file is in the same folder before running the script
