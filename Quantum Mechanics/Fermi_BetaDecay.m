% Gregory Wagonblast
clc 
clear all

% Mass of an electron (kg)
Me = 9.10938356*10^-31;
% Speed of light (m/s)
c = 299792458;
% Plank's Constant (J*s)
h = 6.63*10^-34;
% Disintegration energy for B+ decay (J)
Qbp = 1674.66;
% Disintegration energy for B- decay (J)
Qbn =579.66;

% Set velocity to constant
Ve = 1;
% Energy incrementing (J)
KE = 0:0.1:1000;
% Relativistic momentum of electron is constant along with velocity
Pe = (Me.*Ve)./(sqrt(1-((Ve.^2)/(c^2))));

% Fermi dn/dQ
G = (((4*pi)^2)/((h)^6))*(Pe.^2).*(((Qbn-KE).^2)/(c^3));

hold on
xlabel('Kinetic Energy');
ylabel('Decay Rate');
title('Fermi Theory of B- Decay');
plot(KE,G);
grid on;