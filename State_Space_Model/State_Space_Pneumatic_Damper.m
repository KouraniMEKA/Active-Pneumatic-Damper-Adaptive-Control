%% Pneumatic Damper 

%% State Space model

Gamma = 1.41;
R = 287;           %J/kg.K (J=Pa.m3) 
A_ch = pi*(100/2)^2;    %mm^2 _Pressure Chamber area
h0 = 150;               % mm _ Pressure Chamber hight
P_atm = 1;              %bar

%Volume of chamber: V=70.7 L= 7*10^4 mL

X1_bar=h0/2;            %mm
X2_bar=h0/2;            %mm

P1=2;                   %bar
P2=1.5;                 % bar
Roh_air=1.2;              % (Kg/m^3) Air Density
T0=273+20;              % K
T1=273+20;              % K

% Valve Coefficients:
b=0.21;
C=0.45*10^-3;           % (m^3/s.bar)

Tf = 273+20;            % air flow temperature

mu = 10^-3*10^-5;       %viscosity  bar.s 
d=10;                   %pipe diameter: 10 mm
l=1000;                 %pipe length mm
A_p = pi*(d/2)^2;       %pipe area mm2
Roh_w=998;                %water density kg/m^3

c1 = Gamma*R*Tf/(A_ch*X1_bar)*10^4;        % 10^4  Confirmed !
c2 = Gamma*P2/(X1_bar)*10^3;            % 10^3  Confirmed !
c3 = P1*C*Roh_air*sqrt(T0/T1)*sqrt(1-((P2/P1-b)/(1-b))^2); 
c4 = A_p*10^8/(l*Roh_w);                  % 10^8  Confirmed !
c5 = 128*mu*A_p*10^11/(pi*d^4*Roh_w);     % 10^11 Confirmed !

A = [0 0 0   0    0  0     0 
     0 0 0   0    0  0     0
     0 0 0   0    0  0  -c2/A_ch
     0 0 0   0    0  0   c2/A_ch
     0 0 0   0    0  0  10^3/A_ch
     0 0 0   0    0  0 -10^3/A_ch
     0 0 c4 -c4   0  0   -c5   ];
 
 B = [   c3         
        -c3         
       c1*c3        
       -c1*c3          
         0
         0
         0   ];
% Y= [m1;m2;X1;X2;Delta_P;Q]
% C = [0 0 0 0 0 0 1];
C = [1 0 0 0 0 0 0
     0 1 0 0 0 0 0
     0 0 0 0 1 0 0
     0 0 0 0 0 1 0
     0 0 -1 1 0 0 0
     0 0 0 0 0 0 1];
 
% D=[0];
D=[0 
   0
   0
   0
   0
   0];
  
sys = ss(A,B,C,D);
systf=tf(sys);

Co = ctrb(sys);
rank(Co)        %Rank(Co)=3
unco=length(A)-rank(Co)

Ob = obsv(sys);
rank(Ob)        % Rank(Ob)=2

rank(C*Co)      % Rank output cont.=1

% G=tf([2*c1*c3*c4],[1 c5 2*c2*c4/A_ch]) % G(s)=Q/u
% Ts = 0.005;
% Gd = c2d(G,Ts)
% pzmap(Gd)
% pzmap(systf)
% figure(2)
% bode(systf(6),logspace(0,2,1000))
% 
% 
% %% New Model
% 
zetta=0.7;      % prefered dampin ration
Wn=8;           % Prefered natural frequency
am1=2*zetta*Wn; 
am2=Wn^2;
bm=am2;
% 
% Gm=tf(bm,[1 am1 am2])    % model transfer function
% 
% figure(3)
% pzmap(Gm)
% figure(4)
% bode(Gm,logspace(0,2,1000))
