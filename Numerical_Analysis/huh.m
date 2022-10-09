syms f(x) x
f(x) = x^2-4;
g = diff(f);
x(1)=1 ;%initial point
for i=1:1000 %it should be stopped when tolerance is reached
        x(i+1) = x(i) - f(x(i))/g(x(i));
        if( abs(f(x(i+1)))<0.001)   % tolerance
            disp(double(x(i+1)));
            break;
       end
end