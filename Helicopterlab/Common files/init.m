
clear all;
% FOR HELICOPTER NR 3-10
% This file contains the initialization for the helicopter assignment in
% the course TTK4115. Run this file before you execute QuaRC_ -> Build 
% to build the file heli_q8.mdl.

% Oppdatert høsten 2006 av Jostein Bakkeheim
% Oppdatert høsten 2008 av Arnfinn Aas Eielsen
% Oppdatert høsten 2009 av Jonathan Ronen
% Updated fall 2010, Dominik Breu
% Updated fall 2013, Mark Haring
% Updated spring 2015, Mark Haring


%%%%%%%%%%% Calibration of the encoder and the hardware for the specific
%%%%%%%%%%% helicopter
Joystick_gain_x = 1;
Joystick_gain_y = -1;


%%%%%%%%%%% Physical constants
g = 9.81; % gravitational constant [m/s^2]
l_c = 0.46; % distance elevation axis to counterweight [m]
l_h = 0.66; % distance elevation axis to helicopter head [m]
l_p = 0.175; % distance pitch axis to motor [m]
m_c = 1.92; % Counterweight mass [kg]
m_p = 0.72; % Motor mass [kg]

Vs_star = 8.2; % Measured sum voltage at equilibrium
K_f = g*(2*l_h*m_p-l_c*m_c)/(l_h*Vs_star); %Motor Force Constant

% Calculate necessary constants for model equations
L_1 = l_p*K_f;
L_2 = g*l_c*m_c - 2*g*l_h*m_p;
L_3 = l_h*K_f;
L_4 = -K_f*l_h;

J_p = 2*m_p*l_p^2;
J_e = m_c*l_c^2 + 2*m_p*l_h^2;
J_lambda = m_c*l_c^2 + 2*m_p*(l_h^2 + l_p^2);


% Calculated constants for linearized model
K_1 = L_1/J_p;
K_2 = L_3/J_e;
K_3 = (L_4/J_lambda) * Vs_star;



