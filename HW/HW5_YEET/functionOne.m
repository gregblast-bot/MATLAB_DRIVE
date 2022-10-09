function [fileName] = functionOne()

fileName = input('Enter the file name: ', 's');
%Error check for user file name input
while exist(fileName)==0
    disp('File Name does not exist.');
    fileName= input ('Enter the file name: ', 's');
end
