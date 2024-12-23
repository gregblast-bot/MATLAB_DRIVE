clear all
clc
X0 = 2;                                                                     % Initial Parameter X0 Initialized.
X1 = -4;                                                                    % Initial Parameter X1 Initialized.
AlphaN = -40/3572;                                                          % Solved Parameter AlphaN Initialized.
BetaN = 5445/3572;                                                          % Solved Parameter BetaN Initialized.
n = 0;                                                                      % Initialize Our Counter n To Zero.
i = 1;                                                                      % Initialize The Iterate For The Display

while (n ~= 35)                                                             % Iterate Through The First 35 Values.
    Xnum = ((AlphaN*(100.^(n+1)))+(BetaN*(6.^(n+1)))+(5.^(n+1)));           % Set Up Formula For The Numerator Of X.
    Xdem = ((AlphaN*(100.^n))+(BetaN*(6.^n))+(5.^n));                       % Set Up Formula For The Denominator Of X.
    Xn = Xnum./Xdem;                                                        %%% Find The Final Value Of Xn, The . Is For Element 
                                                                            %%% Wise Operations. Omitting it works as well. %%%
    % Display Variables And Increment
    D = [i Xn]; 
    disp(D);
    n = n + 1;
    i = i + 1;
end
