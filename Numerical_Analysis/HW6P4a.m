clc
clear all

f = @(x)exp(-x^2);
a = 0;
b = 10;
n0 = 4;
integral = zeros(8,1);
sumend1 = (f(a)+f(b))/2;
sumend2 = (f(a)+f(b));
sumeven = 0;
sumodd = 0;
sum = 0;

for i = 1:8
    n = n0*2^(i-1);
    h = (b-a)/n;
    sumeven = sumeven + sumodd;
    sumodd = 0;
    for j = 1:2:n-1
        sum = sum + f(a+j*h);
        sumodd = sumodd + f(a+j*h);
    end
    integralT(i) = h*(sumend1+sum)
    integralS(i) = (h*(sumend2+4*sumodd+2*sumeven))/3
end