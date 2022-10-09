clear all
clc

x=0;
S0 = (11/8)*x^2 - (3/8)*x^3;
S1 = 1 + (13/8)*(x-1) + (1/4)*(x-1)^2 + (1/8)*(x-1)^3;

for x = 0:0.1:1
    plot(x, S0(x));
    hold on;
end

for x = 1:0.1:2
    plot(S1(x),x);
    hold on;
end