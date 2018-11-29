%% 5.2a) - Finding estimate of PSD
P5p1b_init;

load('wave.mat');
fs = 10;
[pxx, f] = pwelch(psi_w(2,:).*(pi/180), 4096, [], [], fs);

pxx = pxx./2*pi;
omega = f.*2*pi;

figure();
plot(omega(1:150), pxx(1:150), 'LineWidth', 2);

%% 5.2c) Finding omega 0 and standard deviation from PSD
[max_pxx, index] = max(pxx);
omega_0 = omega(index);
sigma = sqrt(max_pxx);

%% 5.2d Finding a lambda based on PSD 
figure()
for lamda = 0.00:0.04:0.12
    K_omega = 2 .* lamda .* omega_0 .* sigma;

    P_psi = ((omega.*K_omega).^2)./ ...
        (omega.^4 + omega_0^4 + 2*omega_0^2.*omega.^2*(2*lamda.^2-1));

    plot(omega(1:150), P_psi(1:150),'--',omega(1:150), pxx(1:150));
    hold on
end
