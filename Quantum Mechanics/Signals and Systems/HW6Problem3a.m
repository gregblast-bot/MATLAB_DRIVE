clc
clear all

t = -1:0.1:2;
x = (1-t^3)*heaviside(t)+(1-t^3)*heaviside(t-1);

plot(t,x);