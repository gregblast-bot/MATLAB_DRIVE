clear all;
clc;

n = 1.0;

for x = -1.0 : 0.5 : n
    Qx = 1 + x + ((2*exp(1)-5).*(x.^2)) + ((3-exp(1)).*(x.^3));
    Fx = exp(x);

    T = [x Qx Fx];
    disp(T);
end