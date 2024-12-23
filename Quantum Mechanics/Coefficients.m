% Gregory Wagonblast
clear all
clc

% Setting a = 1, thus Area = 1
x = -0.5:0.001:0.5;
A1 = 16/(9*(pi)^2);
psi1 = sqrt(2).*cos(pi.*x);
psi2 = sqrt(2).*sin(2*pi.*x);
A3 = -48/(25*(pi)^2);
psi3 = sqrt(2).*cos(3*pi.*x);
xpsi2 = x.*psi2;
sum = A1.*psi1 + A3.*psi3;

% Black is xpsi2 and Red is A1.*psi1 + A3.*psi3
plot(x,xpsi2,'k', x,sum,'r');
xlabel('x');
ylabel('Psi(x)');
title('Wave Functions');