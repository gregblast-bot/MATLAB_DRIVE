clear all
clc

%x = 0:1:10;
% y = 2*x+3;
% noise = rand(1,11)/5;
% y = y + noise;
% 
% x = [0 1 2 3 4 5 6 7];
% y = [-3 11 38 218 594 161 4 438 6];
x = 1:10;
y = 2.2*x.^(5.5);
%plot(x, y, 'r*');
loglog(x, y,'r*');

semilogy(y);
ln_y = log(y);
ln_x = log(x);
coeff = polyfit(ln_x, ln_y, 2);
newx = min(x):.1:max(x);
newx = log(newx);
new_y = polyval(coeff,newx);
new_y = exp(new_y);
eqn = coeff;
eqn(2) = exp(coeff(2));
plot(x, y, 'r*', newx, new_y);
%gtext(['y = ', num2str(eqn(2)), 'e^{', num2str(eqn(1)), '}'])
