clear
clc
j = sqrt(-1);
N = 99;
t = linspace(-5, 10, 10000);
k = 1 : N;
Xk = (8./(((k.*k)).*(pi*pi))).*(sin(k.*(pi/4)).^2);
%Xk = (-2./(k.*pi*j)).*(sin(k.*(pi/4)).^2);
Xt = .25;
for k = 1 : N
   Xt = Xt + Xk(k).*exp(j*k*(pi/2)*t); 
   
end
plot(t, Xt)