
load('P5d_compass.mat')
load('P5d_estimated_bias.mat')
load('P5d_rudder_input.mat')
load('P5d_ref')

load('P5d_compass_w.mat')
load('P5d_estimated_bias_w.mat')
load('P5d_rudder_input_w.mat')

fsize = 20;

s = 1; 
e = 4000;

t = compass(1,s:e);
subplot(2, 1, 1)
%figure()
    plot(t, compass(2,s:e), t, compass_w(2,s:e), t , ref(2, s:e), '--', 'LineWidth', 2);
    lg = legend({'Compass Course with $\hat{b}_{feedforward}$', ...
        'Compass Course without $\hat{b}_{feedforward}$', 'Compass Reference'}, 'Interpreter', 'latex');
    lg.FontSize = fsize;

    tl = title('Compass Course with Estimated Bias');
    tl.FontSize = fsize;
    xl = xlabel('Time [s]');
    xl.FontSize = fsize;
    yl = ylabel('Compass Course [degrees]');
    yl.FontSize = fsize;
    grid on;
    

subplot(2, 1, 2); 
%figure()
    plot(t, rudder_input(2, s:e), t, rudder_input_w(2,s:e),t, est_b(2,s:e), 'LineWidth', 2);
    lg = legend({'Rudder Input with $\hat{b}_{feedforward}$', ...
        'Rudder Input without $\hat{b}_{feedforward}$', '$\hat{b}_{feedforward}$'}, 'Interpreter', 'latex');
    lg.FontSize = fsize;
    
    tl = title('Rudder Input with Estimated Bias');
    tl.FontSize = fsize;
    xl = xlabel('Time [s]');
    xl.FontSize = fsize;
    yl = ylabel('Rudder Input [degrees]');
    yl.FontSize = fsize;
    grid on;
    