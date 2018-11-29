
load('p5p3d_compass.mat')
load('p5p3d_rudder_input.mat')
load('p5p3d_ref.mat')

%Simulations without distubance
% \ Plots of compass course
t = compass(1,:);
figure()

plot(t, compass(2,:), t, rudder_input(2,:),t,ref(2,:),'--', 'LineWidth', 2);
tl = title('PD-Controller with measurement-noise and wave-disturbance');
tl.FontSize = 20;
xl = xlabel('Time [s]');
xl.FontSize = 20;
yl = ylabel('Compass angle [degrees]');
yl.FontSize = 20;
lg = legend('Compass', 'Rudder Input', 'Compass Reference');
lg.FontSize = 20;
