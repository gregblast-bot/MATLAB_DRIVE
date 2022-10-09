% Team 2, Celia Davis, Kaizen Rodrigues and Gregory Wagonblast

A = true;
while(A == true)

s1 = 'We in Team 2, Celia Davis, Kaizen Rodrigues and Gregory Wagonblast';
s2 = ' certify that we have completed this assignment in an honest manner.';
s = strcat(s1,s2);
disp(s);

[I] = HW5_fun1();
L = load(I);

M = menu('Pick a function.', 'Mean', 'Standard Deviation', 'Variance', 'Minimum', 'Maximum');

switch(M)
    
    case 1
        calculation = mean(L);
        choice = 'Mean';
        
    case 2
        calculation = std(L);
        coice = 'Standard Deviation';
        
    case 3
        calculation = var(L);
        choice = 'Variance';
            
    case 4           
        calculation = min(L);
        choice = 'Minimum';
                
    case 5
        calculation = max(L);
        choice = 'Maximum';
        
    otherwise
        calculation = false;
        choice = false;
                    
end

HW5_fun2(choice, calculation);

A = menu('Would you like to run the program again? ', 'Yes', 'No');

end

disp('End of program');