function cubic_driver
%  cubic_driver(n) computes a cubic spline
%  interpolant of the runge function
%    
%     f(x) = 1/(1+25*x^2)
%
%  based on n linearly spaced 
%  points in the interval [-1,1] 

num_points = 5;
runge = @(x) 1./(1+ 25*x.^2);

x = linspace(-1,1,num_points);
y = runge(x);

[s0,s1,s2,s3] = cubic_spline(x',y');

plot_points = 1000;
xx = linspace(-1,1,plot_points);
yy = runge(xx);

plot(xx,yy,'g');
hold on;
plot_cubic_spline(x,s0,s1,s2,s3);
end

function [s0,s1,s2,s3]=cubic_spline(x,y)
% [s0,s1,s2,s3]=cubic_spline(x,y)
%
% computes the coefficents of a cubic spline 
% interpolant through the data points (x,y)
%
% The spline is defined as the piecewise cubic
% polynomial 
%
% S(x) = { Sk(x)    x(k) <= x <= x(k+1)
%      = { 0        otherwise
%
% The cubic polynomial Sk(x) is given by 
%
% Sk(x)  = sk0 + sk1*(x-x(k)) + sk2*(x-x(k))^2 + sk3*(x-x(k))^3
%
% The coefficents sk0, sk1, sk2, and sk3 for each of the 
% polynomials are returned in the vectors s0,s1,s2, and s3
% respectively.

if any(size(x) ~= size(y)) || size(x,2) ~= 1
    error('inputs x and y must be column vectors of equal length');
end

n = length(x);

h = x(2:n) - x(1:n-1);
d = (y(2:n) - y(1:n-1))./h;

lower = h(1:end-1);
main  = 2*(h(1:end-1) + h(2:end));
upper = h(2:end);

T = spdiags([lower main upper], [-1 0 1], n-2, n-2);
rhs = 6*(d(2:end)-d(1:end-1));

m = T\rhs;

% Use natural boundary conditions where second derivative
% is zero at the endpoints

m = [ 0; m; 0];
full(T)
disp(rhs)
disp(m)


s0 = y;
s1 = d - h.*(2*m(1:end-1) + m(2:end))/6;
s2 = m/2;
s3 =(m(2:end)-m(1:end-1))./(6*h);

disp(s0)
disp(s1)
disp(s2)
disp(s3)
end

function plot_cubic_spline(x,s0,s1,s2,s3)
% plot_cubic_spline(x,s0,s1,s2,s3)
%
% plots a cubic spline with break points x 
% and coefficents s0, s1, s2, s3

n = length(x);

inner_points = 100;

for i=1:n-1
    xx = linspace(x(i),x(i+1),inner_points);
    xi = repmat(x(i),1,inner_points);
    yy = s0(i) + s1(i)*(xx-xi) + ... 
         s2(i)*(xx-xi).^2 + s3(i)*(xx - xi).^3;
    plot(xx,yy,'b')
    plot(x(i),0,'r');
end

disp(yy)

end