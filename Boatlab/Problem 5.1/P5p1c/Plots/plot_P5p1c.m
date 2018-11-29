clear all;

load A_1_noise.mat;
load A_2_noise.mat;

subplot(2,1,1)
    plot(A_1_n(1,:),A_1_n(2,:));
    title('\omega_1 = 0.005')
    xlabel('Time [s]')
    ylabel('Amplitude [degrees]')
    
subplot(2,1,2)
    plot(A_2_n(1,:),A_2_n(2,:));
    title('\omega_2 = 0.05')
    xlabel('Time [s]')
    ylabel('Amplitude [degrees]')
    