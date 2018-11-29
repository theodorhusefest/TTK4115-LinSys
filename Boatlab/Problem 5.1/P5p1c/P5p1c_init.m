%% 5.1b) Repeating 5.1a using disturbances

load A_1_noise.mat;  % Load datafiles
load A_2_noise.mat;

plot(A_2_n(1,2000:20000), A_2_n(2,2000:20000));

A_1 = (max(A_1_n(2,2000:20000))- ...
    min(A_1_n(2,2000:20000)))/2;
A_2 = (max(A_2_n(2,2000:20000))- ... 
    min(A_2_n(2,2000:20000)))/2; % Calculate amplitudes

w_1 = 0.005; 
w_2 = 0.05;

% Calculate boatparamaters 
T = sqrt((A_1^2*w_1^2 - w_2^2*A_2^2) / ...
    ((w_2^4*A_2^2 -A_1^2*w_1^4)));   % T = 9.858
K = A_1*w_1 *sqrt(T^2*w_1^2 +1);    % K = 0.1592