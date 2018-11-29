clear all;

load step_response_deg.mat;
load step_response_tf_deg.mat;

t = step_res(1,1:10000);
plot(t, step_res(2,1:10000), 'b', t, step_res_tf(2,1:10000), 'r');
xlabel('Time [s]')
ylabel('Amplitude [degrees]')
title('Step Response of Ship and Model')
lg = legend('Ship', 'Model');
lg.FontSize = 16;