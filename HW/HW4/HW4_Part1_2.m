% This function has six outputs into main
function [getsum, getmax, maxid, getmin, minid, sorty] = HW4_Part1_2()

% Prompt the user to input data file
I = input('Enter the name of the movie data file.', 's');

% Loop while the user entered file does not exist
while exist(I) == 0
    
    disp('This file does not exist.');
    I = input('Enter the correct name of the data file: ', 's');
    
end

% Take advantage of built in functions to find sum, max, min, size and sort
M = load(I);
getsum = sum(M);
getmax = max(M);
getmin = min(M);
sorty = sort(M);
[row,col] = size(M);

% Find the index of a specific element by taking advantage of for loops
for j = 1:col
    for i = 1:row
        if M(i,j) == max(M)
            maxid = i;
        end
        if M(i,j) == min(M)
            minid = i;
        end
    end
end

end
