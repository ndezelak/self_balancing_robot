%% Li-Po charger design
U_out = 9;
U_in = 12;
I_in_max = 2;
I_out = min(2.0,U_in*I_in_max/(U_out) );
f = 500000; 
ripple = 0.5;
%% Inductor selection
L = (U_in - U_out)*U_out / (ripple * I_out * f * U_in);
%% P-Mosfet power dissipation
R_on = 0.100;
P_max = (I_out)^2 * R_on * (U_out/U_in);
T_amb = 50;
T_mosfet = T_amb + 115 * P_max;
%% R_sense
R_sense = 0.1/I_out;
%% Capacitors

