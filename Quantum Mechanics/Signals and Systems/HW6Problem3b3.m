clc
clear all

w = linspace(-20, 20, 1000);
x = ((pi./2).*(((exp(j.*(w+2))-exp(-j.*(w+4)))./(j.*2)).*heaviside(w+3)) - (pi./2).*(((exp(j.*(w-2))-exp(-j.*(w+4)))./(j.*2)).*heaviside(w+1)) - (pi./2).*(((exp(j.*(w+2))-exp(-j.*(w-4)))./(j.*2)).*heaviside(w-1)) + (pi./2).*(((exp(j.*(w-2))-exp(-j.*(w-4)))./(j.*2)).*heaviside(w-3)));
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