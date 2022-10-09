%%% This program constructs an nxn Hilbert matrix, calculates its smallest
%%% eigenvalue and solves a linear system of equations.
%%% M. Neilan
%%% 9/3/18

function Example1070 %note: no inputs or outputs

clc;    %clears command window
clear;  %clears variables

n=5;    %declare variable n.  Note that, due to the semicolon
        %the value of n will not be diplayed in the command window.

A = getHilbertMatrix(n); %call getHilbertMatrix subroutine

disp(A); %diplay the values of matrix A to the command window

emin = min(eig(A)); %calculate minimum eigenvalue

fprintf('Minimum eigenvalue of A: %5.4e\n', emin);

b = ones(n,1); %declare column vector of size n with all values 1

x = A\b;    %solve system 


fprintf('Residual: %5.4e\n', norm(A*x-b));


end %end of function Example 1070


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% function constructs the nxn Hilbert matrix 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function A = getHilbertMatrix(n) %delcare function with input n and output A

A = zeros(n,n); %declare n by n matrix with all entries zero;

% (1) direct way to construct Hilbert matrix
for i=1:n   %start a for loop with starting value 1 and ending value n
    for j=1:n
        A(i,j) = 1./(i+j-1.); %specify (i,j) entry of A       
    end
end

% (2) use vector operations to construct matrix
% for i=1:n   %start a for loop with starting value 1 and ending value n
%    A(i,1:n) = 1./(i+(1:n)-1.);
% end

% (3) use kronecker product to construct matrix
%T = kron(1:n,ones(n,1));
%A = 1./(T+T'-ones(n,n));

% (4) Use Matlab's built-in function 'hilb'
%A = hilb(n);

end %end of function getHilbertMatrix