clear all 
clc

data = load('colsdata.dat');
[rows,cols] = size(data);

if cols + 1 == rows
    data = data';
    [rows, cols] = size(data);
    
elseif rows + 1 ==  cols
        data = data;
        
else
    disp('Your A matrix is not square');
    rows = 1;
    cols = 1;
    data = 1;
end
    
A = data(1:rows,1:rows);
b = data(1:rows,cols);    

x = A^-1 * b

disp(det(A));
