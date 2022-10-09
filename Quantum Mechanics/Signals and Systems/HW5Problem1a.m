clear
clc

T = 4;
Ts = 1e-3;
t = -1.5*T:Ts:1.5*T-Ts;
y = zeros(size(t));
t1 = -0.5*T:Ts:0.5*T-Ts;
x1 = -(4/T).*(t1<0.25*T).*(t1>0)+(4/T).*(t1>-0.25*T).*(t1<0);
x = [x1 x1 x1];
w0 = 2*pi/T;
K = 99;

for k = -K : K
    if k == 0
        yk = 0;
    else
        yk = (4i./(k.*pi.*T)).*(1-cos(0.5.*k.*pi)).*(1./(1+(1i.*k.*w0./3)));

    end
    
y = y+yk.*exp(1i.*k.*w0.*t);
  
end
plot(t,x)
hold on
plot(t,y)
hold off
xlabel('t');
legend('input','output');
    

    