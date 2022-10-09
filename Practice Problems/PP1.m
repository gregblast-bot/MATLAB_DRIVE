disp('ready begin');
a=13
k=2;
while k <= a
    
if(k > 10)
kk=k+2;
disp(kk)

elseif(k < 6 & k >= 4)
kk=k*2;
disp(kk)

elseif(k==10 | k==12)
kk=k;
disp(kk)

elseif(k < 9 & k >= 4)
kk = k^2;
disp(kk)

else
kk=23;
disp(kk)

end

k=k+2;

end
disp('all done')