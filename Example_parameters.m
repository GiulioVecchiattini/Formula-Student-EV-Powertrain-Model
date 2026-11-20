%% EXAMPLE OF SIMULATION PARAMETERS

clear variables
clc
close all

%% CONTROL ALGORITHM PARAMETERS

% Saturation
V_dc = 600; %[V]
V_dc_max = 650; %[V]
V_max = 0.9*(V_dc/2); %[Vpk] Max voltage for control saturation
T_max = 20; %[Nm] Max torque for control saturation
k_T = 0.208; %[Nm/Arms] Torque constant
I_max = 105; %[Apk] Max current for saturation

% Controller (AMK public datasheet)

% Q-axis current
Kp_q = 0.64; %[V/A]
tau_q = 1.2e-3; %[s]
Ki_q = Kp_q/tau_q;

% D-axis current
Kp_d = 0.58; %[V/A]
tau_d = 1.2e-3;
Ki_d = Kp_d/tau_d;

% Speed 
Kp_n = 40; %[Nm/(rad/s)]
tau_n = 20e-3; %[s]
Ki_n = Kp_n/tau_n;
Kd_n = 0;

% FW
Kp_v = 0.08; %[A/V]
tau_v = 6e-3; %[s]
Ki_v = Kp_v/tau_v;


%% MOTOR PARAMETERS
% From public AMK datasheet

p = 5; %Pole pairs
R_s = 0.135; %[Ohm] Winding resistance
J_m = 2.74e-4; %[kg*m^2] Rotor moment of inertia
L0 = 1e-8; %[H] Zero-sequence inductance
n_max = 20000; %[rpm] Max speed
n_base = 12000; %[rpm] Base speed
T_rated = 9.8; %[Nm] Rated torque

% Mechanical load
J_eq = J_m + 0.032; %[kg*m^2] Equivalent load moment of inertia
B_m = 1e-4; %[N*s/m] Viscous friction

% Inductances
Lq = 0.24e-3; %[H] Q-axis inductance
Ld = 0.12e-3; %[H] D-axis inductance
Fm = 0.028; %[Vs] Estimated magnet flux


%% INVERTER PARAMETERS

f_sw = 10000; %[Hz]
R_ds = 0.01; %[Ohm] Drain-source resistance
G_off = 1e-6; %[1/Ohm] Off-conductance 
V_th = 2; %[V] Voltage threshold 


%% INPUT SIMULATION

nm_ref = n_max; %[rpm] Speed reference for speed control mode

% 1. Simple step simulation
t0 = 0.2; %[s]
T1 = 0.9*T_max; %[Nm] Acceleration
t1 = t0+5; %[s]
T2 = -T_rated; %[Nm] Braking
t2 = t1+10; %[s]

% 2. Real log simulation
load("Example_torque_reference.mat")