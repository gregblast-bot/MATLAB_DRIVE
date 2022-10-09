% MJN
% 11/1/17
% This program colors the number line using Newton's method.  
% The color is chosen based on what root the method converges to with
% respect to the initial guess.

function NewtonConvergenceRegion

clear;
clc;

MaxIter = 65;
tol = 1E-6;


fh=@(x)(x-4.).*(x-3.).*(x+1).*(x+5); %function handle
fhp=@(x)4.*x.^3-3.*x.^2-50.*x+37.;   %function's derivative

NumPoints = 400; %number of points to plot (resolution)

NumNewtonRuns=148; %number of iterations to perform

c=1.25; %zoom-in factor
P=6;    %plotting parameter
q =0.32154906672940459822;
% Set g(x)= x -f(x)/f'(x)
% Then q satisfies: q = g(g(q))

alpha = q-P; %plotting parameters
beta = q+P;

%plot the exact function
figure;
fplot(fh,[alpha,beta]);
hold on;
plot(linspace(alpha,beta,100),zeros(1,100),'-k');
plot(q,fh(q),'*r');
pause;
hold off;

%start Newton iterations
for j=1:NumNewtonRuns
    tic;
    
    X = linspace(alpha,beta,NumPoints);
    
    initial = X;    
    
    for n=1:MaxIter
        
        tau = fh(X)./fhp(X);
        
        X = X-tau;
        
    end
    
    CI = find(abs(tau)<=tol);
    roots = X(CI);
    
    roots = round(roots./tol).*tol;
    if (j==1)
        Uroots = unique(roots)
    end
    
    if (length(Uroots) == 4)
        G = initial(CI(find(abs(roots-Uroots(1))<1E-6)));
        B = initial(CI(find(abs(roots-Uroots(2))<1E-6)));
        M = initial(CI(find(abs(roots-Uroots(3))<1E-6)));
        Y = initial(CI(find(abs(roots-Uroots(4))<1E-6)));
        
        plot(G,zeros(length(G)),'.g',B,zeros(length(B)),'.b',M,zeros(length(M)),'.m',Y,zeros(length(Y)),'.y');
        axis([alpha beta,-1 1]);
        drawnow;
    end
    
    if (j==1)
        pause;
    end
    
    beta = q+P/c^j;
    alpha = q-P/c^j;
    
    fprintf('interval length: %4.3e\n', 0.5*(beta-alpha))
    
    
end