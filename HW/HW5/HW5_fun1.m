function [I] = HW5_fun1()

I = input('Please enter the name of the data file with the proper extension: ', 's');

while exist(I) == 0
    
    disp('Not the right file name, try again.');
    I = input('Please enter the name of the data file with the proper extension: ', 's');
    
end

end