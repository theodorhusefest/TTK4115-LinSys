%%

init;

% Matrices for LGR with integration from part 3 problem 3
A_I = [0 1 0  0 0;0 0 0 0 0; 0 0 0 0 0; 1 0 0 0 0; 0 0 1 0 0];
B_I = [0 0; 0 K_1; K_2 0; 0 0; 0 0];

Q_I = [90 0 0 0 0; 0 10 0 0 0; 0 0 100 0 0; 0 0 0 100 0; 0 0 0 0 60];
R_I = [1 0 ; 0 1];

K_I = lqr(A_I, B_I, Q_I, R_I);
P_I = [0 K_I(1,3); K_I(2,1) 0];


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

C_E_old = [1 0 0 0 0 0;
     0 0 1 0 0 0;
     0 0 0 0 1 0];
 
 C_E_1 = [0 0 1 0 0 0;
     0 0 0 0 1 0];
 
 C_E_2 = [1 0 0 0 0 0;
     0 0 1 0 0 0];
 
 

% Check observability of C_E_1
O_1 = obsv(A_E,C_E_1);  % Calculate observabillity matrix
rank(O_1); % rank(O_1) = 6, so every state is observable

% Check observability of C_E_2
O_2 = obsv(A_E,C_E_2);  % Calculate observabillity matrix
rank(O_2); % rank(O_2) = 4, so two states are not observable



% Calculate the poles of the gain matrix L
sys_poles_I = eig(A_I - B_I*K_I);
r0 = max(abs(sys_poles_I));

r = 10*r0;
angle = pi/10;

spread = -angle:(angle/2.5):angle;
poles_L_I = -r*exp(spread*1i);

% Use MatLab's place-function to calculate L
L_I = place(transpose(A_E), transpose(C_E_1), poles_L_I).';








