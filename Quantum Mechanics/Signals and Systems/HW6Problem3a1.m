clc
clear all

t = linspace(-1,2,1000);
x = (1-t.^3).*heaviside(t)-(1-t.^3).*heaviside(t-1);

plot(t,x)
xlabel('t')
ylabel('X(t)')
title('Plot 1')