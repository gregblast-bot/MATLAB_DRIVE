clear all 
clc

x = [0:10];
y = [1.9, 8.5, 3.3, 9.0, 4.6, 2.1, 0.2, 0.9, 12.8, 17.68, 8.888];

plot(x,y,'r*');
sx = sum(x);
n = length(x);
sxx = sum(x.^2);
sxy = sum(x.*y);
sy = sum(y);

% A = [sx, n;sxx, sx];
% b = [sy;sxy];
% eqn = (A^-1)*b;
% my_y = eqn(1) * x + eqn(2);
% plot(x, y, 'r*', x, my_y);

my_x = 0:0.1:10;
coeff = polyfit(x,y,3);
my_y2 = polyval(coeff,my_x);

% sum(my_y-my_y2);

plot(x, y, 'r*', my_x, my_y2);