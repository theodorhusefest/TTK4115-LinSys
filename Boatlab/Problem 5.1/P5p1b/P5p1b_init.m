%% 5.1a) Finding boatparamaters using no disturbances

load('amplitude_1_1.mat'); % Load data files
load('amplitude_2_1.mat');

A_1 = (max(amplitude_1_1(2,2000:20000))- ... 
    min(amplitude_1_1(2,2000:20000)))/2;
A_2 = (max(amplitude_2_1(2,2000:20000))- ...
    min(amplitude_2_1(2,2000:20000)))/2;  % Calculate amplitude

w_1 = 0.005; 
w_2 = 0.05;

% Calculate boatparamaters 
T = sqrt((A_1^2*w_1^2 - w_2^2*A_2^2) / ...
    ((w_2^4*A_2^2 -A_1^2*w_1^4)));   % K = 0.1561
K = A_1*w_1 *sqrt(T^2*w_1^2 +1);     % T = 72.43