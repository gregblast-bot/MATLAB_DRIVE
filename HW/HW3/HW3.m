% Team 02
% Celia Davis
% Kaizen Edwin Rodriguez
% Gregory Wagonblast

clear all
clc

% PART 2a
disp('We in Team 02, (Celia, Kaizen, and Gregory), certify that we have completed this assignment in an honest manner.')
disp('  ');

% PART 2b
data = importdata('RayVille.dat');

% PART 2c
L = length(data);
x = 0;
n = 1;
while n <= L
    x = x + data(n);
    n = n + 1;
end
mean = x/L;
disp(['The mean of the data is ', num2str(mean), '.'])

% PART 2d
k = 1;
i = 2;
count=1;
maximum = 1;
while(count<length(data))
    
    if(data(k)<=data(i))
        data(maximum)=data(i);
    end
    
    k = k+1;
    i = i+1;
    count=count+1;
end
disp(['The max of the data is: ', num2str(data(maximum))])

k = 1;
i = 2;
count=1;
minimum = 1;
while(count<length(data))
    
    if(data(k)>data(i))
        data(minimum)=data(i);
    end
    
    k = k+1;
    i = i+1;
    count=count+1;
    
end
disp(['The min of the data is: ', num2str(data(minimum))])

% PART 2e
sortedData= sort(data);
dataMiddle = length(sortedData);
t=(dataMiddle+1)/2;
if(mod(dataMiddle,2)==0)
%   Median for number groups with an even length
    dataMedian = (data(floor(t))+data(ceil(t)))/2;
    else
%   Median for number groups with an odd length      
    dataMedian = (data(floor(t))+data(ceil(t)))/2;
end
disp(['The median of the data is: ', num2str(dataMedian)])
disp('   ');

disp(['Correct Variance: ', num2str(var(data))]);


% PART 2f
count=1;
top=1;
while(count<=length(data))
    
    parenthesis=(data(count)-mean)^2;
    top = top + parenthesis;
    count=count+1;

end 
variance=top/(length(data)-1);
disp(['The variance of the data is: ', num2str(variance)]);
disp('   ');

% PART 3

A=[5 -1 1];
B=[8 4 2];
C=[-2;-9;-3];

ansa=A*C;
ansb=A-B;
ansc=3*A;
ansd=A.*B;
anse=B.^A;
ansf=B*C;

Part3_ans={ansa ansb ansc;ansd anse ansf};

disp(['The result of a is ' num2str(Part3_ans{1,1})])
disp(['The result of b is ' num2str(Part3_ans{1,2})])
disp(['The result of c is ' num2str(Part3_ans{1,3})])
disp(['The result of d is ' num2str(Part3_ans{2,1})])
disp(['The result of e is ' num2str(Part3_ans{2,2})])
disp(['The result of f is ' num2str(Part3_ans{2,3})])
