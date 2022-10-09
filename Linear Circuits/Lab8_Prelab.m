a = -5500;
B = 316180;
f = 2*pi*316180;
T = 1/f;
t = linspace(0,1000*T,50000);
k1 = 1;
k2 = 0.017395;

Vc = 5.*(1-exp(a.*t).*((k1.*cos(B.*t))+(k2.*sin(B.*t))));

plot(t,Vc);

grid on;