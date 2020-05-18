%% MRAC,Method:I/O Stability,Pneumatic Damper,Nonlinear Model,Linear Conrol  

clear all
close all

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



%% Input Signal:
Amp_Uc=40;    %Imput signal amplitude
T_Uc=3;     %Imput signal period

%% Adaptation gain:
gamma1=10^2.5/Amp_Uc;
alfa=1/gamma1;   %gamma*alfa=1

%%  Plant (Linear):
%G(s)=2.497*10^4/(1 0.3206 56.51])    
b0=2.497*10^4;
a1=0.3206;
a2=56.51;
A=[1 a1 a2];

%% Reference Model:
%zetta=0.7; W=8;
zetta=0.7; W=8;
am1=2*zetta*W;
am2=W^2;
bm=W^2;
Am=[1 am1 am2];

%% Observer Polynomial
a0=1; %optimal: a0=1.5 (fastest)
A0=[1 a0];

%% Real values of parameters:
r1=a0+am1-a1;   
s0=(am2+a0*am1-a1*r1-a2)/b0;
s1=(a0*am2-a2*r1)/b0;
t0=bm/b0;
t1=t0*a0;
r1p=r1-a0;


%% initial estimates of the parameters:

b0_init=b0;
a1_init=a1;
a2_init=a2;

gamma2=gamma1/b0_init;

r1_init=a0+am1-a1_init;
r1p_init=am1-a1_init;
s0_init=(am2+a0*am1-a1_init*r1-a2_init)/b0_init;
s1_init=(am2*a0-a2_init*r1_init)/b0_init;
t0_init=bm/b0_init;
t1_init=t0_init*a0;

%% 
Q=conv(A0,Am);
P1=Am;
P2=A0;
P=conv(P1,P2);

 sim('MRAC_OF_Non_Linear_Simulink')