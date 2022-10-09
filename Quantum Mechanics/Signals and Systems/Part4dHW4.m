clc
clear all

N = 999;
k = 0 : N;

% Xk
% X = j./((k.*pi).*(1-cos(k.*(pi/2))));

% Yk and Yk at k = 1
Y =  (4.*(1-cos(k.*(pi/2))))./((k.^2).*(pi^2));
Y(1) = .25;

%Wk
% W = Y.*(1-((-1).^k));

%Zk
Z = Y.*(2.*cos(k.*(pi/2)));


p = 0;
for k = 1 : N
   p = p + (abs(Z(k))^2);
end

disp(p);