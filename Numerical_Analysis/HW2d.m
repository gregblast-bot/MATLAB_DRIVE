clear all;
clc;

x = -10:0.1:10;
Fx = log(1+exp(x));
P1x = log(2)+x/2;
P2x = log(2)+(x/2)+((x.^2)/8);

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