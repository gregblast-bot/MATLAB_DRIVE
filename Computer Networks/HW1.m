clear 
clc

x = 120;
p = 0.1;
n = 0 : 120;
q = 0.9;
t = 10:0.1:1000;
Pn = 0;

% for n = 10 : 120
%    Pn = (((factorial(x))./(factorial((x-n)).*factorial(n))) .* (p.^n) .* (q.^(x-n)));
% end
% 
% plot(t, Pn)
% grid on

y = binopdf(n, x, p);

figure
bar(n,y,1,'w')
xlabel('Observation')
ylabel('Probability')