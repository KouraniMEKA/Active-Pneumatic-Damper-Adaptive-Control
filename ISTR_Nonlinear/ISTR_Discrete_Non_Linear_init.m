%% ISTR, No Zero Cancelation,Pneumatic Damper,Nonlinear Model,Linear Conrol  


close all
clear all

%% Pneumatic_Damper_Non_Linear_Model

T1=273+20;
T2=T1;
T0=273+20;
Ts=273+20;
Tf=273+20;


Roh_air=1.2;
R = 287*10^4;        %J/kg.K*10^4>>bar.mm^3/kg.K (J=Pa.m3) 
Gamma = 1.41;

C=0.45*10^-3;           % (m^3/s.bar)
b=0.21;

Ps=1.2;
P0=1;
P_atm=1;

A_ch1=pi*(100/2)^2;       %mm^2 _Pressure Chamber area
A_ch2=A_ch1;
h0_1 = 150;              % mm _ Pressure Chamber hight
h0_2 = h0_1;              
%P_steady_state= 1.588 bar
P1_init=1.0; 
P2_init=1.0;
h1_init=h0_1/2;
h2_init=h0_2/2;

mu = 10^-3*10^-5;       %viscosity  bar.s 
d=10;                   %pipe diameter: 10 mm
l=1000;                 %pipe length mm
A_p = pi*(d/2)^2;       %pipe area mm2
Roh_w=998;                %water density kg/m^3

%% ISTR

% Linearized transfer function Q(ml)/U(valve opening):

%G(s)=2.497*10^4/(1 0.3206 56.51])

% Ti=10;               % input signal period
Tsamp = 1/100;          %Sampling Time
Tuc = 3;                %input signal Period
Q_amp=30;               %input signal amplitude
Wn=8;
zetta=0.7;
%Filter: (has some disadvatages), increases the error, error ringing
% However, small errors can be accepted for valve protection
%Num_f=1;Den_f=conv(conv([1/Wn_filt 1],[1/Wn_filt 1]),[1/Wn_filt 1]);
Wn_filt = 100*Wn;       %filtering frequency
Noise=0.00;            %noise variance on control signal


lambda=0.95;        %Forgetting factor
P_init = 1*eye(4,4);

% sys = tf(2.497*10^4,[1 0.3206 56.51]);
% pzplot(sys)
% bode (sys)

% Discrete Model Parameters (Tsamp=0.05)
% a1=-1.85;a2=0.984; b0=30.7;b1=30.5;
% sysd = c2d( sys , Tsamp )
% pzplot(sysd)

% Discrete Model Parameters (Tsamp=1/100)
a1=-1.991;a2=0.9968; b0=1.247;b1=1.245;

% Desired Closed Loop transfer function:
% sysm = tf(65,[1 11.2 64]);
% sysmd = c2d( sysm , Tsamp )
% pzplot(sysm)
% bode (sysm)

% Desired Discrete Closed Loop System Parameters (Tsamp=1/100s)
am1 = -1.888; am2 = 0.894;  bm0 = 1+am1+am2; 
a0=0;

%Estimation parameters:
theta_linear=[a1;a2;b0;b1];
theta1=a1;
theta2=a2;
theta3=b0;
theta4=b1;
% theta_init=[0.5;1.1;0.9;0.4].*theta_real;
theta_init=theta_linear;

sim('ISTR_Discrete_Non_Linear')