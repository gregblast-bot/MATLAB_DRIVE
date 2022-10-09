%Greg Wagonblast, Team 2
clear all
clc

%Load the data text file
dataload = load('data.txt');

%Declare the size of the rows and columns
[rows,cols] = size(dataload);

%Find x and y 
x = dataload(1:rows,1);
y = dataload(1:rows,2);

%Call on function Poly
Poly(x,y);
      

