%% 5.5 - Making the Kalman Filter
p5p2_init;
p5p3b_init;
close all;
load('measurement_noise.mat');

% State-space matrices
A = [0 1 0 0 0;
    -omega_0.^2 -2*lamda.*omega_0 0 0 0;
    0 0 0 1 0;
    0 0 0 -1/T -K/T;
    0 0 0 0 0];

B = [0; 0; 0; K/T; 0];
C = [0 1 1 0 0];
E = [0 0; K_omega 0; 0 0; 0 0; 0 1];

T_s = 0.1; % Sampling Time

% Discretizing matrices
[~, B_d] = c2d(A, B, T_s);
[A_d, E_d] = c2d(A, E, T_s);
C_d = C;

var_measurement = var(v(2,:)); % Variance of measurement-noise

% Initialize matrices to be used in Kalman Filter
Q = 1000000000*[30 0; 0 10^-6];
P_0m = [1 0 0 0 0; 
        0 0.013 0 0 0;
        0 0 pi^2 0 0; 
        0 0 0 1 0; 
        0 0 0 0 2.5*10^-3];
x_0m = [0; 0; 0; 0; 0];
R = var_measurement/T_s;
I = eye(5);

sys = struct('A_d', A_d, 'B_d', B_d, 'C_d', C_d, ...
    'E_d', E_d, 'Q', Q, 'R', R, 'P_0m', P_0m, 'x_0m', x_0m, 'I', I);

%sim('P5p5f.mdl');
%p5p5fd_plots;
