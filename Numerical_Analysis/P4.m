% Gregory Wagonblast    
% Math 1070
% Neilan

clear all
clc

% Steps a-d
a = -1;
b = 1;
n = 100;
h = (b-a)/n;
x = linspace(-1,1,n);
f = @(x)cos(10*(x^4)-14*x)*exp(abs(sin(x)));

for i = 1:n
    y(i) = f(i);
end

% Plot original function
hold on;
title("Least Squares Projection");
xlabel("X");
ylabel("Y");
plot(x,y,'b')

% Step e
A = spdiags([x' x' x'],-1:1,n,n);

% Step f
b(1) = (h/2)*y(1);
for j = 2:n-1
    b(j) = h*y(j);
end
b(n) = (h/2)*y(n);

% Step g
c = A\b';

% Step h
plot(x,c,'k')
hold off

% Step i
for k = 2:n
    q(k) = ((k-x(k))/(x(k-1)-x(k)))*y(k-1) + ((k-x(k-1))/(x(k)-x(k-1)))*y(k);
end

temp = 0;
for l = 2:n
    err = abs(f(l)-q(l));
    if err > temp
        max = err;
    end
    temp = err;
end

disp("Max Error: ")
disp(max);
