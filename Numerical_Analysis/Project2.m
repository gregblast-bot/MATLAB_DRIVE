% Gregory Wagonblast    
% Math 1070
% Neilan
% 28OCT2021

function calculateSpline

clear;
clc;

fh = @(x)exp(x.^2);%1./(1+25.*x.^2);

% Increasing nodes/points will increase fit.
n = 5; % Declare number of nodes.
m = 100; % Declare number of grid points for plotting.

% Declare vector x of length n with equally spaced interpolation points.
x = linspace(-1,1,n);

% Evaluate function fh at points in vector x. Store in vector y.
y = fh(x);

% Declare vector X of length m with equally spaced points used for plotting.
X = linspace(-1,1,m);

% Evaluate function fh at points in vector X. Store in vector OG.
OG = fh(X);

% Plot OG to check and compare function shape.
plot(X,OG,'o--g');
hold on;

% Check to compare to mySplineFunction.
s = spline(x,y);
fnplt(s);
hold on;

% Call the function mySplineFunction to obtain the plot of the spline at
% the points stored in the vector X.
mySplineFunction(x,y,X);

end

function Y = mySplineFunction(x,y,X)

% Using the values of x and y, determine the coefficients M_i (4.64). This
% involves solving a triangular system.

% Set up tridiagonal matrix A (which depends on the values in x).
% A is an (n−2)x(n−2) matrix, where n=length(x)=length(y).

m = length(X);
n = length(x);

x1 = (1/6).*(x(2:n-1)-x(1:n-2));
x2 = (1/3).*(x(3:n)-x(1:n-2));
x3 = (1/6).*(x(3:n)-x(2:n-1));
x1 = x1';
x2 = x2';
x3 = x3';

A = spdiags([x1 x2 x3],-1:1,n-2,n-2);
% Set up right−hand side vector b if size (n−2) (which depends on the 
% values of both x and y).

top1 = y(3:n)-y(2:n-1);
bot1 = x(3:n)-x(2:n-1);
top2 = y(2:n-1)-y(1:n-2);
bot2 = x(2:n-1)-x(1:n-2);

b = (top1./bot1) - (top2./bot2);

% Solve for the second derivatives of the spline. Add in zeros in first
% and last entries (since natural spline). I am assuming that b is a row
% vector in the command below (the apostrophe means transpose).

M = [0;A\b';0];

% Check my values.
full(A)
disp(b)
disp(M')

% With the coefficients calculate the values of the cubic spline. 
% Store these values in the vector Y.

s0 = y;
s1 = ((y(2:n) - y(1:n-1))./(x(2:n)-x(1:n-1)))-(x(2:n)-x(1:n-1)).*(2*M(1:n-1) + M(2:n))/6;
s2 = M/2;
s3 =(M(2:n)-M(1:n-1))./(6*(x(2:n)-x(1:n-1)));

% Fix to column vectors.
s0 = s0';
s1 = diag(s1);
s3 = s3(:,1);

% Check s values.
disp(s0);
disp(s1);
disp(s2);
disp(s3);

for i=1:m % Loop over points for plotting.
    for j=1:n-1
        if((X(i) >= x(j)) && (X(i) < x(j+1))) % Check bounds
              Xj = linspace(x(j),x(j+1),m);
              % (4.63) with shifted indices, bad implementation
              %Y = ((1/6).*(((x(j+1)-X).^3).*M(j) + ((X-x(j)).^3).*M(j+1))./(6.*(x(j+1)-x(j)))) + (((x(j+1)-X)).*y(j) + ((X-x(j))).*y(j+1))./((x(j+1)-x(j))) - ((1/6).*((x(j+1)-x(j).*((x(j+1)-X)).*M(j) + ((X-x(j))).*M(j+1))));
              Y = s0(j) + s1(j)*(Xj-x(j)) + s2(j)*(Xj-x(j)).^2 + s3(j)*(Xj-x(j)).^3;
              % Plot the resulting function.
              plot(Xj,Y,'k--o');
        end
    end
end 

% (1) Find index j such that X(i) is in the interval [x (j−1),x j).
% (2) Use equation (4.63) in text to find value of spline. Store value in Y(i).

end



