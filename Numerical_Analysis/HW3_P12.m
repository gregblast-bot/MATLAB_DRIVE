clear all;
clc;

x = -10 : 0.1 : 10;
Si3 = x.*(x-1).*(x-2).*(x-3);
Si4 = x.*(x-1).*(x-2).*(x-3).*(x-4);
Si5 = x.*(x-1).*(x-2).*(x-3).*(x-4).*(x-5);
Si6 = x.*(x-1).*(x-2).*(x-3).*(x-4).*(x-5).*(x-6);
Si7 = x.*(x-1).*(x-2).*(x-3).*(x-4).*(x-5).*(x-6).*(x-7);
Si8 = x.*(x-1).*(x-2).*(x-3).*(x-4).*(x-5).*(x-6).*(x-7).*(x-8);
figure(1)
hold on;
% plot(x, Si3, 'r')
% plot(x, Si4, 'c')
% plot(x, Si5, 'm')
plot(x, Si6, 'b')
plot(x, Si7, 'g')
plot(x, Si8, 'k')
hold off;
title("Graphed Functions");
xlabel("X-Axis");
ylabel("Y-Axis");
grid on;