% Gregory Wagonblast
clear all
clc

syms x P1s R2s P2s P2p
% Setting a = 1, thus Area = 1

P1s = 4*pi*(x.^2).*exp(-2*x);
R2s = (2-x).*exp(-x/2);
P2s = 4*pi*(x.^2).*(abs(R2s).^2);
P2p = 4*pi*(x.^4).*exp(-x);

a = diff(P1s,x);
b = diff(P2s,x);
c = diff(P2p,x);
maxa = double(solve(a == 0));
maxb = double(solve(b == 0));
maxc = double(solve(c == 0));
disp('Max and Min of 1S state');
disp(maxa);
disp('Maxs and Mins of 2S state');
disp(maxb);
disp('Max and M of 2P state');
disp(maxc);