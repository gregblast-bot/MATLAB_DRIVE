function [selection] = Plotting(x,y)

%Plot the data from either rowdata.txt or colsdata.txt 
%Plot with black pentagons
plot(x,y,'kp'); 

%Prompt user to enter the title for the graph and label the x and y axes
mytitle = input('Enter a title for the plot: ', 's');
myx = input('Label the x axis: ', 's');
myy = input('Label the y axis: ', 's');

%Utilize user input to create the title and label the x and y axes
title(mytitle);
xlabel(myx);
ylabel(myy);

%Pause for 5 seconds
pause(5);

%Create a menu and prompt for fit type
selection = menu('How would you like to fit the data?', 'LinearFit', 'PolynomialFit', 'SemilogFit', 'LoglogFit');

end