clc
clear all

t = linspace(-10, 16, 100);
x = ((1./pi).*(((3.*sin(2.*(t-3)))./(t-3))+(cos(2.*(t-3))./((t-3).^2))-(1./((t-3).^3))));

plot(t,x)
xlabel('t')
ylabel('X(t)')
title('Plot 3')