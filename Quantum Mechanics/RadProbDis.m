% Gregory Wagonblast
clear all
clc

% Setting a = 1, thus Area = 1
x = 0:0.1:20;
P1s = 4*pi*(x.^2).*exp(-2*x);
R2s = (2-x).*exp(-x/2);
P2s = (4*pi*(x.^2).*(abs(R2s).^2))/100;
P2p = (4*pi*(x.^4).*exp(-x))/100;
R3s = (2/sqrt(27))*(1-(2/3).*x+((2/27).*x.^2)).*exp(-x/3);
R3p = (8/(27*sqrt(6)))*(1-(1/6).*x).*x.*exp(-x/3);
R3d = (4/(81*sqrt(30))).*(x.^2).*exp(-x/3);
P3s = 4*pi*(x.^2).*(abs(R3s).^2);
P3p = 4*pi*(x.^2).*(abs(R3p).^2);
P3d = 4*pi*(x.^2).*(abs(R3d).^2);

% 3S is green, 3p is magenta and 3d is cyan
plot(x,P1s,'r', x,P2s,'k', x, P2p,'c', x,P3s,'g', x,P3p,'m', x,P3d,'c');
xlabel('r/ab');
ylabel('P(x)');
title('Radial Probability Distribution');