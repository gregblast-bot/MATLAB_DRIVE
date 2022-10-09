clear all
clc
s=tf('s');
H = ((2*10^11)*s+(4*10^13))/(s^3+(5.4*10^4)*s^2+(2.7*10^9)*s+10^13);

pzmap(H);

[p,z] = pzmap(H);

margin(H);
grid on;