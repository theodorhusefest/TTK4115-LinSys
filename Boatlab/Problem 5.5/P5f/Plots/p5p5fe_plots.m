clear all;
close all;
load('P5e_compass.mat')
load('P5e_estimated_bias.mat')
load('P5e_rudder_input.mat')
load('P5e_estimated_compass.mat')

load('P5f_compass.mat')
load('P5f_estimated_bias.mat')
load('P5f_rudder_input.mat')
load('P5f_estimated_compass.mat')


load('P5f_refmat.mat')

fsize = 20;

s = 1; 
e = 4000;

t = compass(1,s:e);
subplot(2, 1, 1)
%figure()
    plot(t, compass(2, s:e), t, compass_f(2, s:e), t, ref(2, s:e), '--', 'LineWidth', 2);
    lg = legend({'Compass Course Original $\mathbf{Q} $', ...
        'Compass Course $\mathbf{Q} = 0$', 'Compass Reference'}, 'Interpreter', 'latex');
    lg.FontSize = fsize;

    tl = title('Compass Course');
    tl.FontSize = fsize;
    xl = xlabel('Time [s]');
    xl.FontSize = fsize;
    yl = ylabel('Compass Course [degrees]');
    yl.FontSize = fsize;
    grid on;
    

subplot(2, 1, 2); 
%figure()
    plot(t, rudder_input(2, s:e), t, rudder_input_f(2,s:e), t, est_b_f(2,s:e), 'LineWidth', 2);
    lg = legend({'Rudder Input Original $\mathbf{Q}$', 'Rudder Input $\mathbf{Q} = 0$', '$\hat{b}$'}, 'Interpreter', 'latex');
    lg.FontSize = fsize;
     
    tl = title('Rudder Input');
    tl.FontSize = fsize;
    xl = xlabel('Time [s]');
    xl.FontSize = fsize;
    yl = ylabel('Rudder Input [degrees]');
    yl.FontSize = fsize;
    grid on;
    