
clc;
clear;
T_0 =  298;            %[K]
T_1 = 298;
X_0 = 0 ;
P_1 = 101.325;         %[KPa]
T_2 = 500;              %[K]
p_2= P_1;
p_3=500;            %[kPa]
T_3 = 350;          %[K]
T_4=283 ;           %[K]
P_4 = 200;          %[kPa]
P_5=200;            %[kPa]
m_1=1;              %[kg/s]
m_4=15;             %[kg/s]
m_5 = m_4 ;
m_3 = m_4;
"C2H2+3.5 O2+ 13.16 N2= 2CO2+ H2O+ O2+ 13.16 N2";
n_C2H2 = 1 ;
n_O2= 3.5;
n_N2=13.16;
n_t=n_O2+n_N2; 
y_O2=n_O2/n_t;
y_N2=n_N2/n_t;

%"Products"
n_p_CO2=2 ;
n_p_H2O=1 ;
n_p_O2=1 ;
n_p_N2=13.16 ;
n_p_t=n_p_CO2+n_p_H2O+n_p_O2+n_p_N2;
y_p_CO2=n_p_CO2/n_p_t; 
y_p_H2O =n_p_H2O/n_p_t;
y_p_O2=n_p_O2/n_p_t ;
y_p_N2=n_p_N2/n_p_t ;

% "Molar mass"
M_C2H2=2*12+2*1; 
M_H2O=(2*1)+16;
M_p=y_p_CO2*(12+2*16)+y_p_H2O*(2+16)+y_p_O2*(32)+y_p_N2*(28);
M_air=y_O2*(32)+ y_N2*(28);

%"Enthalpy"
h_1=(n_C2H2*226730)/M_C2H2;    %t1 = 298
h_2=(n_O2*14770)+(n_N2*14581)/M_air; %t2 =500
h_3=(n_p_CO2*11351)+(n_p_H2O*11352)+(n_p_O2*10213)+(n_p_N2*10180)/M_p; %t3=350
h_4= 9297/M_H2O; %t4=280 for H2O

% "mass"
AF_r =(3.5*32+13.16*28)/(24+2); 
m_2=m_1*AF_r;
% m_1+ m_2- m_3 == 0; 

% "Thermal anaylsis"
% m_1*h_1+m_2*h_2+m_4*h_4-m_3*h_3-m_5*h_5 == 0;
h5=h_4*M_H2O;

% "Entropy"
s_1=200.85/M_C2H2;
s_2=n_O2*200.589+n_N2*206.8*M_air;

% "products"

 s_3=(n_p_CO2*219.83)+(n_p_H2O*194.125)+(n_p_O2*209.765)+(n_p_N2*196.173)/M_p;
s_4=186.61/M_H2O;
s_5=s_4;
% s(5)=entropy(water, P=P_5,h=h_5)/M_H2O;

%"gases"
Delta_psi_g=m_1*(h_1-T_0*s_1)+m_2*(h_2-T_0*s_2)-m_3*(h_3-T_0*s_3);
Delat_psi_s=m_4*(h_4-T_0*s_4)-m_5*(h5-T_0*s_4);
% Delta_psi_g+ Delat_psi_s-psi_d_t == 0;
eta_exe_t=abs(Delat_psi_s)/abs(Delta_psi_g);

% plot(eta_exe_t)
