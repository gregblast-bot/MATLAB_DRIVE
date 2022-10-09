clc
clear all

t = linspace(-10, 10, 1000);
x =(sin(t-1)./(t-1)).*(sin(2.*(t+1))./(t+1));

plot(t,x)
xlabel('t')
ylabel('X(t)')
title('Plot 2')