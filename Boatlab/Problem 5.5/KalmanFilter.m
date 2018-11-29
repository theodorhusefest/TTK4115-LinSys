function [b, psi] = kalman_filter(u, y, sys)

persistent init_flag A B C E Q R Pm xm I

if (isempty(init_flag))
    init_flag = 1;
    
    [A, B, C, E, Q, R, Pm, xm, I] = deal(sys.A_d, sys.B_d, sys.C_d, ... 
        sys.E_d, sys.Q, sys.R, sys.P_0m, sys.x_0m, sys.I);
            
end
% Kalman Gain
    L = (Pm*C')/(C*Pm*C'+R);
    
% Update Estimate
    x = xm + L*(y-C*xm);
 
% Update Error
    P = (I - L*C)*Pm*(I-L*C)' + L*R*L';
   
% Project ahead
    xm = A*x + B*u;
    Pm = A*P*A' + E*Q*E';
    
psi = x(3); b = x(5);

end
