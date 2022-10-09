% Gregory Wagonblast, Team 2
clear all
clc

data = load('RayVille.dat');
x = input('Input a number between 1 and 99 please: ');

while (x < 1) || (x > 99) 
    x = input('Input a number between 1 and 99 please: ');
end

disp(['Here are the results: ', num2str(x)]);

[rows, cols] = size(data);

n = 0;

for i = 1:rows
    for j = 1:cols
        if x == data(i,j)
            n = n + 1;
        end
    end
end


disp([num2str(x), ' appears ', num2str(n), ' times.']);
