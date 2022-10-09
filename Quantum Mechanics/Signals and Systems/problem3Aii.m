w = linspace(-20, 20, 1000);
xw = (exp(-j.*w).*(6 + j.*w.*6 - 3.*w.*w) - (6 + j.*w.*w.*w))./(w.^4);
X = 20.*log(xw);
Xangle = angle(X);
subplot(2,1,1)
plot(w, X)
xlabel('frequency')
ylabel('20log(|Xw|)')
title('Xw vs w')

subplot(2,1,2)
plot(w, Xangle)
xlabel('frequency')
ylabel('Xw angle')
title('Angle of Xw vs w')