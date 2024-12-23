% Gregory Wagonblast
clear all
clc

% Setting a = 1, thus Area = 1
x = -0.5:0.001:0.5;
psi2 = sqrt(2).*sin(2*pi.*x);
xpsi2 = x.*psi2;

% Black is psi2 and Red is xpsi2
plot(x,psi2,'k', x,xpsi2,'r');
xlabel('x');
ylabel('Psi(x)');
title('Wave Functions');