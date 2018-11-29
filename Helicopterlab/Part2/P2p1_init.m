%%
init;

%Using w0 to tune the controller

w0 = 2.6; 
Kpp = w0^2/K_1;
Kpd = 2*w0/K_1;