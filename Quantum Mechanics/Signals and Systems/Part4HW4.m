clc
clear all

N = 7;
t = linspace(-5, 10, 10000);
k = 1 : N;
% Xk
 X = (j./((k.*pi)).*(1-cos(k.*(pi/2))));

% Yk
% X =  (4.*(1-cos(k.*(pi/2))))./((k.^2).*(pi^2));
X0 = 0;
for k = 1 : N
   X0 = X0 + X(k).*exp(j*k*(pi/2)*t); 
end

plot(t, X0)
grid on;