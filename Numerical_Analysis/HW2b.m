clear all;
clc;

x = -10:0.1:10;
Fx = sin(x);
P1x = (sqrt(2)/2)*(1+(x-pi/4));
P2x = (sqrt(2)/2)*(1+(x-pi/4)-((x-pi/4).^2)/2);

figure(1)
hold on;
plot(x, Fx, 'r');
plot(x, P1x, 'c');
plot(x, P2x, 'm');
hold off;
title("Graphed Functions");
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