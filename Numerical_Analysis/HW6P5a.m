clc
clear all

f = @(x)sin(pi*x);
fd = @(x)pi*cos(pi*x);
a = 0;
b = 1;
n0 = 4;
integral = zeros(8,1);
sumend1 = (fd(a)+fd(b))/2;
sumend2 = (fd(a)+fd(b));
sumeven = 0;
sumodd = 0;
sum = 0;

for i = 1:8
    n = n0*2^(i-1);
    h = (b-a)/n;
    sumeven = sumeven + sumodd;
    sumodd = 0;
    for j = 1:2:n-1
        sum = sum + fd(a+j*h);
        sumodd = sumodd + fd(a+j*h);
    end
    integralT(i) = sqrt(1+(h*(sumend1+sum))^2)
    integralS(i) = sqrt(1+((h*(sumend2+4*sumodd+2*sumeven))/3)^2)
end