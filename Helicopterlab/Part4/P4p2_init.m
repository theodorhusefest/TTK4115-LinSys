%%
init;
% Matrices for LQR without integration from part 3
A_L = [0 1 0; 0 0 0; 0 0 0];
B_L = [0 0; 0 K_1; K_2 0];


Q_L = [80 0 0; 0 10 0; 0 0 100];
R_L = [1 0 ; 0 1];

K_L = lqr(A_L, B_L, Q_L, R_L);
P_L = [0 K_L(1,3); K_L(2,1) 0];



% Matrices for state-estimation
A_E = [0 1 0 0 0 0; 
     0 0 0 0 0 0; 
     0 0 0 1 0 0;
     0 0 0 0 0 0;
     0 0 0 0 0 1; 
     K_3 0 0 0 0 0];
 
B_E = [0 0; 
     0 K_1;
     0 0;
     K_2 0;  
     0 0;
     0 0];

C_E = [1 0 0 0 0 0;
     0 0 1 0 0 0;
     0 0 0 0 1 0];
 

% Check observability
O = obsv(A_E,C_E);  % Calculate observabillity matrix
rank(O); % rank(O) = 6, so every state is observable

% Calculate the poles of the gain matrix L
sys_poles_L = eig(A_L - B_L*K_L);
r0 = max(abs(sys_poles_L));

r = r0*20;
angle = pi/10;

spread = -angle:(angle/2.5):angle;
poles_L_L = -r*exp(spread*1i);

% Use Matlabs place-function to find L
L_L = place(transpose(A_E), transpose(C_E),poles_L_L).';


