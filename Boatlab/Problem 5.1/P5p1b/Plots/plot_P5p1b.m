clear all;

load amplitude_1_1.mat;
load amplitude_2_1.mat;

subplot(2,1,1)
    plot(amplitude_1_1(1,:),amplitude_1_1(2,:));
    title('\omega_1 = 0.005')
    xlabel('Time [s]')
    ylabel('Amplitude [degrees]')
    
subplot(2,1,2)
    plot(amplitude_2_1(1,:),amplitude_2_1(2,:));
    title('\omega_2 = 0.05')
    xlabel('Time [s]')
    ylabel('Amplitude [degrees]')
    