function NewtonFractal

clear;
clc;
clf;


MaxIter = 100;
tol = 1E-6;

fh=@(z)z.^5-1;
fhp=@(z)5.*z.^4;

NumPoints = 500;

beta = 2;

j=1;

while (beta>0.005)
    
    tic;
    
    grid = linspace(-beta,beta,NumPoints);
    [X,Y] = meshgrid(grid,grid);
    Z = X+i.*Y;
    
    initial = Z;
    
    for n=1:MaxIter
        
        tau = fh(Z)./fhp(Z);        
        Z = Z-tau;
        
    end
        
    CI = find(abs(tau)<=tol);
    roots = Z(CI);
    indices = CI;
    
    roots = round(roots./tol).*tol;
    Uroots = unique(roots);
    
    
    G = find(abs(roots-Uroots(1))<1E-6);
    B = find(abs(roots-Uroots(2))<1E-6);
    M = find(abs(roots-Uroots(3))<1E-6);
    Y = find(abs(roots-Uroots(4))<1E-6);
    R = find(abs(roots-Uroots(5))<1E-6);
    

    
    GR = real(initial(indices(G)))./beta+i*imag(initial(indices(G)))./beta;
    BR = real(initial(indices(B)))./beta+i*imag(initial(indices(B)))./beta;
    MR = real(initial(indices(M)))./beta+i*imag(initial(indices(M)))./beta;
    YR = real(initial(indices(Y)))./beta+i*imag(initial(indices(Y)))./beta;
    RR = real(initial(indices(R)))./beta+i*imag(initial(indices(R)))./beta;
    %KK = real(initial(indices(K)))./beta+i*imag(initial(indices(K)))./beta;
  %  CC = real(initial(indices(C)))./beta+i*imag(initial(indices(C)))./beta;
    
  
  
%    size(GR)
%    GR
 %   GR = smooth(GR);

    plot(GR,'.g');
%    plot(GR,'.g','MarkerSize',1.5);
    hold on;
   plot(BR,'.b');
   plot(MR,'.m');
   plot(YR,'.y');
   plot(RR,'.r');
%     plot(BR,'.b','MarkerSize',1.5);
%     plot(MR,'.m','MarkerSize',1.5);
%     plot(YR,'.y','MarkerSize',1.5);
%     plot(RR,'.r','MarkerSize',1.5);
%   plot(KK,'.k','MarkerSize',1.5);
   % plot(CC,'.c','MarkerSize',1.5);
    ax = gca;
    ax.XTick = [-1 1];
    ax.YTick = [-1 1];
    ax.XTickLabel = {num2str(-beta),num2str(beta)};
    ax.YTickLabel = {num2str(-beta),num2str(beta)};
    
    drawnow;
    hold off;
    
    
    beta = beta/1.15;
    
    
    toc
    
    if j==1 
        pause;
        j=2;
    end
end

