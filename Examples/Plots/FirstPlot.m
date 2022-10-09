clear all
clc

x = [1:15];
y = [0:2:28];


mytitle = input('Give me dat title ', 's');
myx = input('Give me dat x axis ', 's');
myy = input('Give me dat y axis ', 's');

colormemine = input('Give me a color (b,r,g,k)', 's');
if colormemine ~= 'b' && colormemine ~= 'r' && colormemine ~= 'g' && colormemine ~= 'k';
    colormemine = 'b';
end

symbol = menu('Pick your symbol','o','*','p','s');

switch(symbol)
    case 1
        symbol = 'o';
    case 2
        symbol = '*';
    case 3
        symbol = 'p';
    otherwise
        symbol = 's';
end

% subplot(2,2,1);
plot(x,y,symbol);
title(mytitle);
xlabel(myx);
ylabel(myy);
gtext('what is going on');

% subplot(2,2,2);
% plot(x,y,'gp',x,y,'r:');
% title('You Rule Gregor');
% xlabel('Feelin Good');
% ylabel('Stay Frosty');
% gtext('What is going on');
% 
% subplot(2,2,3);
% plot(x,y,'ks',x,y,'c');
% title('You Rule Gregor');
% xlabel('Feelin Good');
% ylabel('Stay Frosty');
% gtext('What is going on');
% 
% subplot(2,2,4);
% plot(x,y,'mo',x,y);
% title('You Rule Gregor');
% xlabel('Feelin Good');
% ylabel('Stay Frosty');
% gtext('What is going on');

data = rand(10000,1);
hist(data,10);