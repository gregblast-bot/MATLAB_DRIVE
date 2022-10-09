% Gregory Wagonblast    

clear all
clc

t = 0:0.1:4*pi;
x = t;
y = 2.*((sin(pi.*x).^2).*exp(-2.*t)+(sin(2.*pi.*x).^2).*exp(-2.*t));
curve = animatedline('Color','c');
set(gca,'XLim',[0 2.5],'YLim',[-1 2]);
grid on;

for i = 1:length(t)
        addpoints(curve,x(i),y(i));
        drawnow
end

% Plot original function
hold on;
title("Probability Density");
xlabel("X");
ylabel("|PSI|^2");
plot(x,y,'b')
grid on