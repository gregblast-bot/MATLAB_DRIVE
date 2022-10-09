clc 
clear all

data = importdata('RayVille.dat');
s = sort(data);
x = 0;
i = 1;
check = exist('RayVille.dat');

for i = 1:length(data)
     x = x + data(i);
     i = i + 1;
     disp('Yo Momma');
end

disp(x);
disp(i);



