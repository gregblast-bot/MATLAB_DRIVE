clear all;
clc;

%Part 4a
t = -4:0.1:4;
w = (exp(-t)).*(heaviside(t+2)); 
we = 0.5*((exp(-t)).*(heaviside(t+2)) + (exp(t)).*(heaviside(2-t)));
wo = 0.5*((exp(-t)).*(heaviside(t+2)) - (exp(t)).*(heaviside(2-t)));

subplot(2,2,1);
plot(t,w);
title("Original Function");
xlabel("X-Axis");
ylabel("Y-Axis");
subplot(2,2,2);
plot(t,we);
title("Even Component");
xlabel("X-Axis");
ylabel("Y-Axis");
subplot(2,2,3);
plot(t,wo);
title("Odd Component");
xlabel("X-Axis");
ylabel("Y-Axis");
grid on;