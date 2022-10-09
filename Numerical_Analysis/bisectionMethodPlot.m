%MJN
%pictorial description of bisection method
%10/25/21

function bisectionMethodPlot

clf;
clc;

%fh = @(x)x.^5-2.*x.^2+1;
%fh = @(x)x.^3-x.^2-x-1;
%fh = @(x)x-1-0.3.*cos(x);
fh = @(x)cos(x)-0.5-sin(x);

a =0; %starting interval [a,b]
b = 4;

A = a-0.1; %parameters defining plotting window
B = b+0.1;


tol = 1E-4; %convergence tolerance 
MaxIter = 100; %maximum number of iterations

X = A:0.01:B; %parameters used for plotting
F = fh(X);
C = min(F)-0.1;
D = max(F)+0.1;

if (fh(a)*fh(b)>0)
    fprintf('Error: f(a)f(b)>0.\nAborting program\n');
    return
end

%plot function with initial a and b;
plot(X,F,'LineWidth',1.5);
axis([A,B,C,D]);

hold on
plot(X,zeros(size(X)),'-k'); %plot x-axis

plot(a,fh(a),'+k','MarkerSize',10);

text(a,fh(a),'\leftarrow a',...
    'HorizontalAlignment','left',...
    'FontSize',16)

plot(b,fh(b),'+k','MarkerSize',10);

text(b,fh(b),'\uparrow b',...
    'VerticalAlignment','Top',...
    'FontSize',16);



for i=1:MaxIter %start bisection iteration
    
    pause;
    c = 0.5*(a+b);
    
    if (b-c<=tol) %found an approximate solution
        break;
    end
    
    plot(c,fh(c),'+k','MarkerSize',10);
    
    text(c,fh(c),'\uparrow c',...
        'VerticalAlignment','Top',...
        'FontSize',16)
    
    pause;
      %update endpoints
    if (fh(b)*fh(c)<=0)
        a=c;
    else
        b=c;
    end
    
  
    
    %clear plot
    clf;
    %plot function with initial a and b;
    plot(X,F,'LineWidth',1.5);
    
    axis([A,B,C,D]);
    
    hold on
    plot(X,zeros(size(X)),'-k'); %plot x-axis
    
    plot(a,fh(a),'+k','MarkerSize',10);
    
    text(a,fh(a),'\leftarrow a',...
        'HorizontalAlignment','left',...
        'FontSize',16)
    
    plot(b,fh(b),'+k','MarkerSize',10);
    
    text(b,fh(b),'\uparrow b',...
        'VerticalAlignment','Top',...
        'FontSize',16);
    
end

if (i==MaxIter)
    fprintf('Failed to find approximate root of f.  Sorry\n');
    
else
    fprintf('Approximate root of f is %10.9f\n', c);
    fprintf('Number of iterations: %d\n', i);
    fprintf('f(c) = %4.3e\n', fh(c));
end



