%Your name here
%Math 1070
%Neilan
%date
function calculateSplinetemplate

clear;
clc;

fh=@(x)1./(1+25.*x.^2);

n=5; %declare number of nodes
m=100; %declare number of grid points for plotting.

%Declare vector x of length n with equally spaced interpolation points. 
%See linspace command
x = 

%Evaluate function fh at points in vector x. Store in vector y.
y = fh(x);

%Declare vector X of length m with equally spaced points used for plotting
%See linspace command
X = 

%call the function mySplineFunction to obtain the values of the spline at the points stored in the vector X 
Y = mySplineFunction(x,y,X);

%plot the resulting function
plot(X,Y);

end


function Y = mySplineFunction(x,y,X)

%Using the values of x and y, determine the coefficients M_i (see (4.64) in text).  This 
%involves solving a triangular system.  You may use Matlab's backslash operator, which is very efficient for such linear systems

% Set up tridiagonal matrix A (which depends on the values in x).  A is an (n-2)x(n-2) matrix, where n = length(x)=length(y)

% Set up right-hand side vector b if size (n-2) (which depends on the values of both x and y)

% Solve for the second derivatives of the spline.  Add in zeros in first
% and last entries (since natural spline). I am assuming that b is a row
% vector in the command below (the apostrophe means transpose)
M = [0;A\b';0];

%With the coefficients calculate the values of the cubic spline.  Store these values in the variable Y.
for i=1:m %loop over points for plotting
    
    %(1) find index j such that X(i) is in the interval [x_(j-1),x_j).
    %(2) Use equation (4.63) in text to find value of spline. Store value
    %in Y(i)


end

