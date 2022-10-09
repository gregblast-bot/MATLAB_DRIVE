%Celia Davis, Gregory Wagonblast, Kaizen Rodriguez
%Team 02

clear all
clc
%Integrity Statement
disp('We in Team 02 (Kaizen, Celia, and Gregory) certify that we have completed this assignment in an honest manner.');
%Loads File
fileName = functionOne();
file = load(fileName);

%Menu for user choice w/ switch statement
choice = menu('Which statistical operation do you want?', 'Mean', 'Standard Deviation', 'Variance', 'Minimum', 'Maximum');
switch choice
    case 1
        chosenOP = mean(file);
        choice = 'Mean';
    case 2
        chosenOP = std(file);
        choice = 'Standard Deviation';
    case 3
        chosenOP = var(file);
        choice = 'Variance';
    case 4
        chosenOP = min(file);
        choice = 'Minimum';
    otherwise
        chosenOP = max(file);
        choice = 'Maximum';
end

%Calls Function Two
functionTwo(chosenOP, choice);
%Calls Function THree
functionThree(file);

%Asks user if they want to run the program again by calling main if yes and
%displaying "----PROGRAM END----" if no.
restartChoice = menu('Would you like to run the program again?', 'Yes', 'No');
switch restartChoice
    case 1
        main()
    otherwise
    disp('----PROGRAM END----');
end