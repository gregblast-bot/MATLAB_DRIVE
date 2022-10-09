

w0 = pi/4;
N = 40;
k = -N : N;
%X = -2./((k.^2).*pi).*(cos(k.*(pi/2)));

X = -2./(k.*pi*j).*(sin(k.*(pi/4)).^2);
%X(41) = .25;

figure(1)
stem(k ,abs(X), 'b', 'filled');
xlabel('k')
ylabel('|Xk|')
title('Magnitude of Xk')

figure(2)
stem(k ,angle(X), 'r', 'filled');
xlabel('k')
ylabel('Angle Xk')
title('Angle of Xk')
