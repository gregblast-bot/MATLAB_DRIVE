clc
clear all

N = 40;
k = -N : N;

% Xk, k = 0 for Xk is zero
%   X = j./((k.*pi).*(1-cos(k.*(pi/2))));

% Yk
  X =  (4.*(1-cos(k.*(pi/2))))./((k.^2).*(pi^2));

% k = 0 for Yk
  X(41) = 1/4;

figure(1);
stem(k ,abs(X), 'b', 'filled');
title('Magnitude');
xlabel('k');
ylabel('Magnitude');
grid on;

figure(2);
stem(k ,angle(X), 'r', 'filled');
title('Angle');
xlabel('k');
ylabel('Angle');
grid on;
