% Gregory Wagonblast
clear all
clc

syms r P1s R2s P2s P2p
% Expectation value of r will be the integral of r*p(r) dr
% Setting a = 1, thus Area = 1
P1s = 4*pi*(r.^2).*exp(-2*r);
R2s = (2-r).*exp(-r/2);
P2s = 4*pi*(r.^2).*(abs(R2s).^2);
P2p = 4*pi*(r.^4).*exp(-r);

disp('Expecation Value Formula of 1S State');
a = abs(int(P1s,r))
disp('Expecation Value Formula of 2S State');
b = abs(int(P2s,r))
disp('Expecation Value Formula of 2P State');
c = abs(int(P2p,r))

% Maximums
r1 = 1;
r2 = 0.7639;
r3 = 5.2361;
r4 = 4;
disp('Expecation Value At Max of 1S State');
a1 = (pi*exp(-2*r1)*(4*r1^2 + 4*r1 + 2))/2
disp('Expecation Value At Max of 2S State 1st Peak');
b1 = 4*pi*(8*sin(r2 - 2)^2*exp(-r2) + 4*r2^2*sin(r2 - 2)^2*exp(-r2) + r2^4*sin(r2 - 2)^2*exp(-r2) + 8*r2*sin(r2 - 2)^2*exp(-r2))
disp('Expecation Value At Max of 2S State 2nd Peak');
b2 = 4*pi*(8*sin(r3 - 2)^2*exp(-r3) + 4*r3^2*sin(r3 - 2)^2*exp(-r3) + r3^4*sin(r3 - 2)^2*exp(-r3) + 8*r3*sin(r3 - 2)^2*exp(-r3))
disp('Expecation Value At Max of 2P State');
c1 = 4*pi*exp(-r4)*(r4^4 + 4*r4^3 + 12*r4^2 + 24*r4 + 24)

