A = 1;
T = 2;
t = (-2*T):0.1:(6*T);

y = (1/T)*(t.*heaviside(t+T) - (2*t).*heaviside(t) + t.*heaviside(t-T));
z = A.*((1/2*(t.^2)) + ((T/2).*exp((-2*t)/T).*(t + (T/2)))).*heaviside(t);
q = (4/T)*z;

subplot(2,2,1);
plot(t,y);
title("Y(t)");
xlabel("X-Axis");
ylabel("Y-Axis");
grid on;
subplot(2,2,2);
plot(t,q);
title("Q(t)");
xlabel("X-Axis");
ylabel("Y-Axis");
grid on;