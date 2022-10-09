x=1:.5:10
y=2.2.*x.^3.1

%plot(x,y,'r*')
%semilogy(x,y,'r*')
loglog(x,y,'r*')

lnx=log(x);
lny=log(y);
figure
plot(lnx,lny,'gs')
hol iff
coeff=polyfit(lnx,lny,1);
newx=linspace(min(lnx),max*lnx),300);
newy=polyval(coeff,newx);
plot(newx,newy)
hold off

stdx=exp(newx);
stdy=exp(newy);
figure
plot(x,y,'r*',stdx,stdy)