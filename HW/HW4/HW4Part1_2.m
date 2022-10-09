clear all
clc

%function [summie, max_val, max_loc, min_val, min_loc, sorts] = part1_2(getsum);

I = input('Enter the name of the file.');

while (exist(I, 'file')==0)
    
    disp('This file does not exist.');
    I = input('Enter the correct name of the data file: ');
    
end

E = isfile("Movies.dat");
A = load(I);
getsum = sum(A);
getmin = min(A);
getmax = max(A);
sorty = sort(A);

index1 = find(getmax);
index2 = find(getmin);

disp(index1);
disp(index2);

%end
