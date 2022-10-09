% Gregory Wagonblast, Team 2
clear all
clc

M = input('Enter equation text filename with extension: ', 's');

while exist(M) == 0
    
    disp('This file does not exist.');
    M = input('Enter the equation text filename with extension: ', 's');
    
end

L = load('Eq1.txt');
% L1 = load('eq_test.txt');
% L2 = load('eq_test2.txt');
% L3 = load('eq_dependent.txt');

[rows,cols] = size(L);
A = L(:,1:rows);
b = L(:,cols);

disp('A is ');
disp(A);
disp('b is ');
disp(b);

x = (A^-1)*b;
disp(x);