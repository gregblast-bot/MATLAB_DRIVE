function [] = Header()

clear all
clc

%Display Integrity Statement, concatonate strings
s1 = 'We in Team 2, Celia Davis, Kaizen Rodrigues and Gregory Wagonblast';
s2 = ' certify that we have completed this assignment in an honest manner.';
s = strcat(s1,s2);
disp(s);

end