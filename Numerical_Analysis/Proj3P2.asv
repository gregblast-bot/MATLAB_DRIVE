function main
clear all
clc

tangent
f = @ () tangent;
t = timeit(f);
disp("Time Taken To Calculate: ");
disp(t);
end

function tangent
% Initialize symbolic functions for f(x) and f'(x)
syms f(x) x
syms fp(x) x

% Set functions (f(x) and fp(x)), number of iterations (n), and initial x
% value (x(1)).

% For Section 3.2 Problem 2
% Uncomment new f(x) and comment out old f(x) to test

% x(1) = 2.0 is a good test value for this function
% f(x) = (x^3)-(x^2)-x-1; 

% x(1) = 1.0 is a good test value for the rest of these functions
% f(x) = x-1-0.3*cos(x);
% f(x) = cos(x)-(1/2)-sin(x);
% f(x) = x-exp(-x);
% f(x) = exp(-x)-sin(x);
% f(x) = (x^3)-2*x-2;
f(x) = (x^4)-x-1;

% Use diff function to make life easier
fp = diff(f);

tol = 10^-6;
n = 100;
v = linspace(-2,2,n);
plot(v,f(v));
title('Function Root');
xlabel('X'); 
ylabel('F(X)');
grid on;
x(1) = -1.0;

% For loop for Newton's Method with error tolerance
for i = 1:n
    x(i+1) = x(i)-((f(x(i)))/(fp(x(i))));
    % Tolerance added with decision statement
    % Display the root when tolerance is met and the respective iteration has happened
    if(abs(f(x(i+1))) < tol)
        disp("Calculated Root: ");
        disp(round(x(i+1),8));
        disp("Iteration Found: ");
        disp(i);
        break;
    end
end
end