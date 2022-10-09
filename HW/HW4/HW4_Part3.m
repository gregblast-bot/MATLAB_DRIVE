% This function has two outputs into main
function [A,b] = HW4_Part3()

% Prompt the user to input text file
dataName = input('Enter the name of the text file for the linear equation: ', 's');

% Loop while the user entered file does not exist
while (exist(dataName, 'file') == 0)
    
    disp('This file does not exist.');
    dataName = input('Enter the name of the text file correctly: ', 's');
    
end

% Load file, get size of rows and columns using size function
% Declare variables A and b to be used for the linear equation
data = load(dataName);
[rows,cols] = size(data);
A = data(:,1:rows);
b = data(:,cols);

end