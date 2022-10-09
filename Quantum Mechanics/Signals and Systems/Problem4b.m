clear all;
clc;

%Part 4b
t = -10:0.1:10;
x = cos(2*pi*t)+cos(3*t); 

plot(t,x);
title("Original Function");
xlabel("X-Axis");
ylabel("Y-Axis");
grid on;

%Yes, this plot is consistent with my answer.