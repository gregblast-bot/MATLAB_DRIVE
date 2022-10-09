clear all
clc
x = [0:10];
y = [-10 -6 8 38 90 170 284 438 638 890 1200]

plot(x,y,'r*');
sx = sum(x);
n = length(x);
sxx = sum(x.^2);
sxy = sum(x.*y);
sy = sum(y);


my_x = 0:0.1:10;
coeff = polyfit(x,y,3);
my_y2 = polyval(coeff,my_x);
plot(x, y, 'r*', my_x, my_y2);