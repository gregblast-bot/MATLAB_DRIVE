clear all;
clc;

x = 0 : 0.1 : 2
Rx = (1./(1-x))-((1/6).*(x.^2))+((2/3).*(x))-1;

plot(x, Rx)