t = linspace(-1, 2, 1000);
xt = (1 - t.*t.*t).*heaviside(t) - heaviside(t - 1).*(1 - t.*t.*t);

plot(t, xt)
xlabel('time')
ylabel('Xt')
title('1 - t^3')