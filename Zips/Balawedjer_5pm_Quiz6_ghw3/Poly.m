function [] = Poly(x,y)

%Find coefficients and use polyval to find y
coeff = polyfit(x,y,3);
new_y = polyval(coeff, x);

%Make plot and title name
plot(x,y,'r*',x,new_y);
title('Plotting RULEZ');

%Initialize zero and loop
user = 0;
while user >=0 && user <= 100000 
%Prompt user for a number create a new x for a smoother fit line
user = input('Please display a number', 's');
new_x = min(x):0.1:max(x);

%Find coefficients and use polyval to find new y
newcoeff = polyfit(user,y,3);
newnew_y = polyval(newcoeff, user);

%Use figure to display another plot
figure
plot(user,y,'kb',new_x,newnew_y);
title('Please Work');
end
end

