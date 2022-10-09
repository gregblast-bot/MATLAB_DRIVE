% Team 2, Celia Davis, Kaizen Rodrigues and Gregory Wagonblast
clear all
clc

% Write declaration of integrity and concatenate using strcat
s1 = 'We in Team 2, Celia Davis, Kaizen Rodrigues and Gregory Wagonblast';
s2 = ' certify that we have completed this assignment in an honest manner.';
s = strcat(s1,s2);

% Put your values into main
[getsum, getmax, maxid, getmin, minid, sorty] = HW4_Part1_2();

% Display proper output using num2str in order to display your values as
% strings
disp(['The sum of all 100 movie revenues is ', num2str(getsum), '.']);
disp(['The max revenue is ', num2str(getmax), ', corresponding to movie ', num2str(maxid), '.'])
disp(['The min revenue is ', num2str(getmin), ', corresponding to movie ', num2str(minid), '.']);
disp('The sorted revenues are: ');
disp(sorty);

% Put your declared variables into main
[A,b] = HW4_Part3();

disp('The values, after solving the system of equations, are: ');

% Put your declared variable into main and display
% This is the result of the linear equation
[x] = HW4_Part4(A,b);
disp(x);