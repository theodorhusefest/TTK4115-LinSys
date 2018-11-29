clear all;
close all;
load('P5e_compass.mat')
load('P5e_estimated_bias.mat')
load('P5e_rudder_input.mat')
load('P5e_estimated_compass.mat')
load('P5e_rudder_input_w.mat')
load('P5e_compass_w.mat')

load('P5e_ref.mat')
fsize = 20;

s = 1; 
e = 150;

t = compass(1,s:e);
figure()
    plot(t, compass(2,s:e), t, est_compass(2,s:e), 'LineWidth', 2);
    lg = legend({'Compass Course', ...
        'Estimated Compass Course'}, 'Interpreter', 'latex');
    lg.FontSize = fsize;

    tl = title('Compass Course with Estimated Compass Course');
    tl.FontSize = fsize;
    xl = xlabel('Time [s]');
    xl.FontSize = fsize;
    yl = ylabel('Compass Course [degrees]');
    yl.FontSize = fsize;
    grid on;