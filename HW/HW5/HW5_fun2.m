function [] = HW5_fun2(choice, calculation)

if choice == false
    disp('Try again.');
else
    disp(['The ', choice, ' of the data is ', num2str(calculation)]);
end
end
