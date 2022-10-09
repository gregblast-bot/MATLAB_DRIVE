clear all
clc

s1 = 'We in Team 2, Celia Davis, Kaizen Rodrigues and Gregory Wagonblast';
s2 = ' certify that we have completed this assignment in an honest manner.';
s = strcat(s1,s2);
A = importdata("RayVille.dat");
L = length(A);
x = 0;
n = 1;
while n <= L
    x = x + A(n);
    n = n + 1;
end
m = x/L;
y = ['The mean of the data is ', num2str(m), '.'];
disp(s);
disp(y);