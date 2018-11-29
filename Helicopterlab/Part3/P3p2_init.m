%%
init;

% State space matrices for given statevector
A_L = [0 1 0; 0 0 0; 0 0 0];
B_L = [0 0; 0 K_1; K_2 0];

% Q and R matrices chosen for regulation
Q_L = [80 0 0; 0 10 0; 0 0 100];
R_L = [1 0 ; 0 1];

% Calculate K and P with MatLabs lqr function
K_L = lqr(A_L, B_L, Q_L, R_L);
P_L = [0 K_L(1,3); K_L(2,1) 0];

