clear all;
clc;

x = -10:0.1:10;
Fx = sqrt(x);
P1x = 1 + (x-1)/2;
P2x = 1 + (x-1)/2 - ((x-1).^2)/8;

figure(1)
hold on;
plot(x, Fx, 'r');
plot(x, P1x, 'c');
plot(x, P2x, 'm');
hold off;
title("Graphed Function");
xlabel("X-Axis");
ylabel("Y-Axis");
grid on;

% figure(2)
% plot(x, P1x);
% title("Linear Taylor Polynomial");
% xlabel("X-Axis");
% ylabel("Y-Axis");
% grid on;
% 
% figure(3)
% plot(x, P2x);
% title("Quadratic Taylor Polynomial");
% xlabel("X-Axis");
% ylabel("Y-Axis");
% grid on;