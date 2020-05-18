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

Ps=2;
P0=1;
P_atm=1;

A_ch1=pi*(100/2)^2;       %mm^2 _Pressure Chamber area
A_ch2=A_ch1;
h0_1 = 150;              % mm _ Pressure Chamber hight
h0_2 = h0_1;              

P1_init=1.0;
P2_init=1.0;
h1_init=h0_1/2;
h2_init=h0_2/2;

mu = 10^-3*10^-5;       %viscosity  bar.s 
d=10;                   %pipe diameter: 10 mm
l=1000;                 %pipe length mm
A_p = pi*(d/2)^2;       %pipe area mm2
Roh_w=998;                %water density kg/m^3

%% DSTR

Ti=1; % input signal period
Tsamp = 1/100;          %Sampling Time
Tuc = 3;                %input signal Period
Q_amp=30;               %input signal amplitude

lambda=0.95;
 
a1=-1.991;a2=0.9968; b0=1.248;b1=1.247;
P_init = eye(4,4);

% Wn=8;zetta=0.7;
am1 = -1.888; am2 = 0.894;  % Desired Closed Loop System Parameters
bm0 = 1+am1+am2; 
t0 = 1+am1+am2;
a0=0;
r0 = b0;
r1 = b1;
s0 = am1 - a1;
s1 = am2 - a2;
theta_linear=[r0;r1;s0;s1];
theta1=r0;
theta2=r1;
theta3=s0;
theta4=s1;
theta_init=1*theta_linear;

sim('DSTR_Discrete_Nonlinear')