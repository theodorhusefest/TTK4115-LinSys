%%
init;

% State space matrices for given state-vector
A_I = [0 1 0 0 0; 
       0 0 0 0 0; 
       0 0 0 0 0; 
       1 0 0 0 0; 
       0 0 1 0 0];
   
B_I = [0 0; 
       0 K_1; 
       K_2 0; 
       0 0;
       0 0];

   
% Chosen Q and R matrices
Q_I = [90 0 0 0 0; 
       0 10 0 0 0; 
       0 0 100 0 0; 
       0 0 0 100 0; 
       0 0 0 0 60];
   
R_I = [1 0 ; 
       0 1];

% K and P calculated with MatLab's lqr-function
K_I = lqr(A_I, B_I, Q_I, R_I);
P_I = [0 K_I(1,3); K_I(2,1) 0];



