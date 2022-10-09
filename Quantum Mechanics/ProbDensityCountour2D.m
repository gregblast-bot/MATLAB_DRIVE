% Gregory Wagonblast
clear all
clc

% Assume a = 1
x = 0:0.1:1;
y = 0:0.1:1;
[X,Y] = meshgrid(x,y);
Z1 = 2*sin(pi*X).*sin(2*pi*Y);
Z2 = 2*sin(2*pi*X).*sin(pi*Y);
Zt = (1/sqrt(2))*(Z1-Z2);
Z = (Zt.^2)
contour(X,Y,Z,'ShowText','on')
%surf(Z)
title("Probability Density 2D");
xlabel("x");
ylabel("y");
zlabel("z");
