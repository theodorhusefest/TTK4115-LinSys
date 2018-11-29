clear all;
close all;

fsize = 20;
load('P5e_estimated_waves.mat')
load('P5e_waves.mat')
psi_e = est_waves;
psi_w = waves;
s = 1;
e = 4000;
t = psi_e(1,s:e);

plot(t, psi_w(2,s:e), t, psi_e(2,s:e),'LineWidth',2);
lg = legend('Actual Waves', 'Estimated Waves');
lg.FontSize = fsize;

tl = title('Actual Wave-disturbance vs. Estimated Wave-disturbance');
tl.FontSize = fsize;
xl = xlabel('Time [s]');
xl.FontSize = fsize;
yl = ylabel('Amplitude [rad]');
yl.FontSize = fsize;