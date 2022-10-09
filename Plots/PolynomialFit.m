function [abserror,errloc] = PolynomialFit(x,y)  

%Prompt for the order of the polynomial, loop if order entered is less than
%two or greater than ten
order = input('Enter the order of the polynomial between 2 and 10: ');

while (order < 2) || (order > 10)
    order = input('Enter the order of the polynomial between 2 and 10: ');
end

%Use polyval instead of a linear equation and plot
coeff = polyfit(x,y,order);  
my_x = min(x):0.1:max(x);
my_y = polyval(coeff,my_x);
plot(x, y, 'kp', my_x, my_y, 'g');
title('Polynomial Fit');
 
%Initialize abserror as zero and rows and columns as the size of y
abserror = 0;
[rows,cols] = size(y);

%Utilize nested for loops in order to loop through and find the absolute
%error and it's location
for i = 1:rows
    for j = 1:cols
        if abs(y(i,j)-polyval(coeff, x(i,j))) > abserror
            abserror = abs(y(i,j)-polyval(coeff, x(i,j)));
            errloc = x(i,j);
        end
    end
end

%Use built in functions and calculate R^2, use text for displaying R^2
ybar = mean(y);
SStot = sum((y - ybar).^2);
SSreg = sum((polyval(coeff, x(i,j)) - ybar).^2);
SSres = sum((y - polyval(coeff, x(i,j))).^2);
R2 = 1 - SSres/SStot;
R = corrcoef(x,y);
Rsq = R(1,2).^2;
disp(Rsq);
text(0,2,num2str(Rsq));

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