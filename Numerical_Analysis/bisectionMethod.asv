% M. Neilan
% 10/18/21
% Math 1070
% This function performs the bisection method for a function (handle) fh
% starting at initial interval [a,b]

function bisectionMethod

clear;
clc;

% fh=@(x)x.^2-5.*x; %function (handle)
% fh=@(x)(x.^3)-(x.^2)-x-1;
% fh=@(x)1+(0.3*cos(x))-x;
fh=@(x)cos(x)-(1/2)-sin(x);

a = 1; %initial left endpoint
b = 6;  %initial right endpoint


% tol = 1E-9; %tolerance in test for convergence
tol = 0.0001;
MaxIter = ceil(log((b-a)/tol)/log(2)); %maximum number of bisection method iterations

FA =fh(a); FB = fh(b);

if FA*FB>0
    error('Initial endpoints a and b satisfy f(a)*f(b)>0\n');
end

if FA==0
    fprintf('f has a root at %9.8e\n', a);
    return;
end

if FB==0
    fprintf('f has a root at %9.8e\n', b);
    return;
end

flag=0;

for k=1:MaxIter
    
    c = 0.5*(a+b); %calculate midpoint
    
    if (b-c)<tol    %check for convergence
        flag = 1;
        break;
    end
    
    FC = fh(c);     %evaluate f at midpoint and update interval
    
    if FC*FA<=0
        b = c;
        %FB = FC;
    else
        a = c;
        FA = FC;
    end
    
end

if (flag == 1)
    fprintf('Approximate root of f: %9.8e\n', c);
    fprintf('Found in %d iterations\n', k);
    fprintf('f(r) = %9.8e\n', fh(c));
    
else
    fprintf('Bisection method failed to converge after %d iterations\n', k);
end


