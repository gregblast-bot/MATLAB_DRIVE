function [] = functionThree(file)

sortedFile = sort(file);
%Asks user for input titles.
plotTitle = input('Enter the plot title: ', 's');
xTitle = input('Enter the x-axis title: ', 's');
yTitle = input('Enter the y-axis title: ', 's');

%Displays plotted data
subplot(1,3,1)
plot(sortedFile,'yo')
title(plotTitle);
xlabel(xTitle);
ylabel(yTitle);
%Displays the YouTube Picture
subplot(1,3,2)
myimg = imread('Pic.jpg');
imshow(myimg);
%Displays the Histogram
subplot(1,3,3)
hist(file,10)
title('Histogram of Data');
userName = input('What is your name? ', 's');
gtext(userName);

        