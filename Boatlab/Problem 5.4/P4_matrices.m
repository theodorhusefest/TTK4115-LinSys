%% Init
clear all;
P5p1b_init;
p5p2;

%% 5.4 a) Finding matrices for statespace system
A = [0 1 0 0 0;-omega_0.^2 -2*lamda.*omega_0 0 0 0;0 0 0 1 0;0 0 0 -1/T -K/T;0 0 0 0 0];

B = [0; 0; 0; K/T; 0];

C = [0 1 1 0 0];

E = [0 0; K_omega 0; 0 0; 0 0; 0 1];

%% 5.4 b) Observability without disturbances

A_none = [0 1; 0 -1/T];
C_none = [1 0];

Ob_none = obsv(A_none, C_none);
unob_none = rank(Ob_none) - length(Ob_none),
%unob_none is the amount of unobservable states with no disturbances

%% 5.4 c) Observability with current disturbance
A_c = [0 1 0; 0 -1/T -K/T;0 0 0];
C_c = [1 0 0];

Ob_c = obsv(A_c, C_c);
unob_c = rank(Ob_c) - length(Ob_c),
%unob_c is the amount of unobservable states with current disturbance

%% 5.4 d) Observability with wave disturbance

A_w = [0 1 0 0;-omega_0.^2 -2*lamda.*omega_0 0 0;0 0 0 1;0 0 0 -1/T];
C_w = [0 1 1 0];
     
Ob_w = obsv(A_w, C_w);
unob_w = rank(Ob_w) - length(Ob_w),
%unob is the amount of unobservable states with wave disturbance

%% 5.4 e) Observability with both current and wave disturbance
% Use A and C from a)

Ob = obsv(A, C);
unob = rank(Ob) - length(Ob),
%unob is the amount of unobservable states with both wave and current disturbances