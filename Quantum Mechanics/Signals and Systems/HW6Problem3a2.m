clc
clear all

w = linspace(-20, 20, 1000);
x = (exp(-j.*w).*(6+(6.*j.*w)-(3.*w.^2))-(6+(j.*w.^3)))./(w.^4);
xMag = 20.*log10(x);
xPhase = angle(xMag);

subplot(2,1,1)
plot(w,x)
xlabel('Frequency')
ylabel('20log10(|x|)')
title('Magnitude')

subplot(2,1,2)
plot(w,xPhase)
xlabel('Frequency')
ylabel('x Phase')
title('Phase Angle')