function [abserror,errloc] = LinearFit(x,y)
    
%Use polyfit to find the coefficients of
coeff = polyfit(x,y,1);

%Use built in functions to easily find these values
sx = sum(x);
n = length(x);
sxx = sum(x.^2);
sxy = sum(x.*y);
sy = sum(y);

%Create a linear equation and plot, use text for displayed equation
A = [sx,n;sxx,sx];
b = [sy;sxy];
eqn = (A^-1)*b;
my_y = eqn(1) * x + eqn(2);
plot(x, y, 'kp', x, my_y, 'r');
title('Linear Fit');
thing = (['y = ', num2str(eqn(2)), 'e^{', num2str(eqn(1)), '}']);
text(4,0,thing);

%Initialize abserror as zero and rows and columns as the size of y
abserror = 0;
[rows,cols] = size(y);

%Utilize nested for loops in order to loop through and find the absolute
%error and it's location
for i = 1:rows
    for j = 1:cols
        if (abs(y(i,j)-my_y(i,j)) > abserror)
            abserror = abs(y(i,j)-my_y(i,j));
            errloc = x(i,j);
        end
    end
end

%Use built in functions and calculate R^2, use text for displaying R^2
ybar = mean(y);
SStot = sum((y - ybar).^2);
SSreg = sum((my_y - ybar).^2);
SSres = sum((y - my_y).^2);
R2 = 1 - SSres/SStot;
R = corrcoef(x,y);
Rsq = R(1,2).^2;
stuff = (['R^2 = ', num2str(Rsq)]);
text(7,0,stuff);

%Prompt for a response
disp('Would you like to find the estimated y for any given x?');
response = input('Please enter Y for yes or N for no: ', 's');

%Compare strings of response and desired variables. Continue to loop if
%anything different is received
while strcmp(response ,'n') == 0 && strcmp(response ,'y') == 0 
    response = input('Please enter y for yes or n for no: ' , 's');
end

%Compare string of response and 'y', gather desired x variable , calculate and output y variable 
if strcmp(response ,'y') == 1 
    x_input = input('Please provide x value: ');
    y_output = x_input*coeff(1) + coeff(2);
    disp(['The estimate of y for x = ', num2str(x_input), ' is: ', num2str(y_output)]);
end

end