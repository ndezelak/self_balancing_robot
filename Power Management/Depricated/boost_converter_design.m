%% BOOST CONVERTER DESIGN 
% Parameters
U_out = 12; %V
U_in = 5; % V
I_in = 2; % A
f = 550000; %Hz
U_diode = 0.4; % V
ripple = 0.2; % 0 - 1
ripple_out = 0.01;
I_out = U_in * I_in / (U_out); % A
U_sense_max = 0.230; %V, because Ith is connected to ground
ro_T = 0.4; % Temperature coefficient ( rise of R with T)
%% %% Inductor selection
D = (U_out + U_diode - U_in)/(U_out + U_diode); % Duty cycle for the U_out/U_in ration
I_in = I_out / (1 - D); % Average input current
I_in_peak = I_in + (ripple/2) * I_in; % Maximum input current including inductor ripple
delta_I_L = ripple * I_in;
L = (U_in * D)/(delta_I_L * f); % Henry
%% MOSFET selection
R_on = U_sense_max * (1 - D) / ( (1+ripple/2) * I_out * ro_T);  
%% Output Capacitor selection
ESR = ripple_out * U_out/ (I_in_peak);
C_out = I_out/(ripple_out * U_out * f);