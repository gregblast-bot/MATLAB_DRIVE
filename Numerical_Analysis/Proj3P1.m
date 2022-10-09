clear all;
clc;

% Initialize symbolic functions for f(x) and f'(x)
syms f(x) x
syms fp(x) x

% Set functions (f(x) and fp(x)), number of iterations (n), and initial x
% value (x(1)).

% For Section 3.2 Problem 1
f(x) = (x^6)-x-1;
fp(x) = 6*(x^5)-1;

% These values can be changed, although my table can only handle n = 6 at
% the moment
n = 6;
x(1) = 1.0;

% For loop for Newton's Method with no error tolerance
for i = 1:n+1
    x(i+1) = x(i)-((f(x(i)))/(fp(x(i))));
end

% Calculate values of Xn - Xn-1
for j = 2:n+1
    d(j-1) = x(j)-x(j-1);
end

% Calculate alpha values
for k = 1:n+1
    a(k) = x(k)-f(x(k))/fp(x(k));
end

% Calculate alpha - Xn-1
for l = 2:n+1
    dd(l-1) = a(l)-x(l-1);
end

% Store values to be displayed in column vectors
n = [0;1;2;3;4;5;6];
Xn = [round(x(1),8);round(x(2),8);round(x(3),8);round(x(4),8);round(x(5),8);round(x(6),8);round(x(7),8)];
fXn = [round(f(x(1)),15);round(f(x(2)),15);round(f(x(3)),15);round(f(x(4)),15);round(f(x(5)),15);round(f(x(6)),15);round(f(x(7)),15)];
Xdiff1 = [0;round(d(1),15);round(d(2),15);round(d(3),15);round(d(4),15);round(d(5),15);round(d(6),15)];
Xdiff2 = [0;round(dd(1),15);round(dd(2),15);round(dd(3),15);round(dd(4),15);round(dd(5),15);round(dd(6),15)];


% Display a table of all values (similiar to Table 3.2 in the book)
table(n,Xn,fXn,Xdiff1,Xdiff2)