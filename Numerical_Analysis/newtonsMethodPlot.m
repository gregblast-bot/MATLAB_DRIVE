function newtonsMethodPlot 

%M. Neilan
%10/25/21

clf;
clc;

%B=5; %parameter in function definition


a =-1; %bounds used for plotting
b = 0;

%c = 15;
z = 50;
fh=@(x)x+(exp(-z.*x.^2).*cos(x));
fhp=@(x)exp(-z.*x.^2).*(exp(z.*x.^2)-2.*z.*x.*cos(x)-sin(x));

% fh=@(x)(x-4.).*(x-3.).*(x+1).*(x+5);
% fhp=@(x)4.*x.^3-3.*x.^2-50.*x+37.;
%fh=@(x)x+exp(-c.*x.^2).*cos(x);
%fhp=@(x)1+exp(-c.*x.^2).*(-sin(x)-2.*c.*x*cos(x));

% fh = @(x)x.^5-2.*x.^2+1;
% fhp =@(x)5.*x.^4-4.*x;
%fh=@(x)x.^3-x.^2-x-1;
%fhp=@(x)3.*x.^2-2.*x-1;
%fh = @(x) x-1-0.3*cos(x);
%fhp = @(x)1+0.3*sin(x);
%fh = @(x)cos(x)-0.5-sin(x);
%fhp = @(x)-sin(x)-cos(x);

% fh = @(x)atan(x);
% fhp =@(x)1./(1+x.^2);
% a =-2;
% b = 2;
% %xk = 0.5;
% xk = 1.39174520027073+1E-4; %=initialguess

xk = -1;
%xk= 0.32154906672942;
%xk=2.; %initial guess

tol = 1E-8;
MaxIter = 50;   %maximum number of iterations

%plot settings
A = a-0.1;
B = b+0.1;
X = A:0.01:B;
F = fh(X);
C = min(F)-0.1;
D = max(F)+0.1;

%determine whether there is a root in (a,b)
% if (fh(a)*fh(b)>0)
%     fprintf('Error: f(a)f(b)>0.\nAborting program\n');
%     return
% end

fhk = fh(xk);
fhpk = fhp(xk);

%plot function with initial guess;
plot(X,F,'LineWidth',1.5);

axis([A,B,C,D]);
hold on
plot(X,zeros(size(X)),'-k'); %plot x-axis

fkplot = plot(xk,fhk,'+k','MarkerSize',10);

fktext = text(xk,fhk,'\uparrow f(x_k)',...
    'VerticalAlignment','Top',...
    'FontSize',16);

xkplot = plot(xk,0,'+k','MarkerSize',10);
xktext = text(xk,0,'\downarrow x_k',...
    'VerticalAlignment','Bottom',...
    'FontSize',16);

pause;

for i=1:MaxIter
    
    %plot tangent line;
    Y = fhpk.*(X-xk)+fhk.*ones(1,length(X));
    tangent = plot(X,Y);
    pause;
    
    %delete points on graph
    delete(xkplot);
    delete(xktext);
    delete(fkplot);
    delete(fktext);
    
    xknew = xk-fhk/fhpk; %update iteration
    
    if abs(xknew-xk)<tol %check for convergence
        break;
    else
        xk = xknew;      %accept updated iterate
        fhk = fh(xk);    %calculate function at new value
        fhpk = fhp(xk);  %calculate derivative at new value
    end
    
    
    %graph new xk
    xkplot = plot(xk,0,'+k','MarkerSize',10);
    xktext = text(xk,0,'\downarrow x_k',...
        'VerticalAlignment','Bottom',...
        'FontSize',16);
    
    pause;  
    
    %graph point (xk,fh(xk))
    fkplot = plot(xk,fhk,'+k','MarkerSize',10);
    fktext = text(xk,fhk,'\uparrow f(x_k)',...
        'VerticalAlignment','Top',...
        'FontSize',16);
    
    pause;
    
    %delete tangent line
    delete(tangent);
end

if (i<MaxIter)
    fprintf('Approximate root: %7.6f\n', xknew);
    fprintf('Number of iterations: %d\n', i);
    fprintf('f(xk) = %5.4e\n', fh(xknew));
else
    fprintf('Failed to find a root after %d iterations\n', i);
end


