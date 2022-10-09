%sum(sum(A)) without the use of sum
clear all
clc

A = [1:10;1:10;1:10];
[rows,cols] = size(A);
summie = 0;
colssum = zeros(1, cols);
rowssum = zeros(rows, 1);

for i = 1:rows
    for j = 1:cols
        summie = summie + A(i,j);
        
        %Now just sum(A)
        colssum(j) = colssum(j) + A(i,j);
        
        %Now sum rows
        rowssum(i) = rowssum(i) + A(i,j);
        
    end
end

disp(rowssum);
disp(colssum);
disp('break1');
disp(sum(A));
disp('break2');
disp(summie);
disp('break3');
disp(sum(sum(A)));