%Celia Davis, Gregory Wagonblast, Kaizen Rodriguez
%Team 02

%While I is equal to true, run the program
I = true;
while(I == true)

%Call function Header
Header();

%Prompt user to input name file name
filename = input('Enter the name of the file: ', 's');

%Continually prompt until the correct file is entered
while exist(filename) == 0
    filename = input('Enter the correct name of the file: ', 's');
end

%Load the file data and find the size of the rows and columns
filedata = load(filename);
[rows,cols] = size(filedata);

%Check whether the matrix is 2-dimensional or not
if (isequal([rows,cols],[rows,2]) || isequal([rows,cols],[2,cols]))
    disp('Your matrix is 2-dimensional.');
else
    disp('Your matrix is not 2-dimensional.');
end

%Declare x and y variables based off the type of 2-dimensional matrix 
if isequal([rows,cols],[rows,2])
    x = filedata(1:rows,1);
    y = filedata(1:rows,2);
elseif isequal([rows,cols],[2,cols])
    x = filedata(1,1:cols);
    y = filedata(2,1:cols);
end

%Call function Plotting, take x and y from main to Plotting and bring the user selection to main
%from Plotting
[selection] = Plotting(x,y);

%Switch case depending on the user's menu selection
switch selection
    case 1
        %Call function LinearFit, take x and y from main to the function
        %and bring abserror and errloc to main
        [abserror,errloc] = LinearFit(x,y);
        disp(['The largest absolute error is ', num2str(abserror), ' and the x location is ', num2str(errloc)]);
    case 2
        %Call function PolynomialFit, take x and y from main to the function
        %and bring abserror and errloc to main
        [abserror,errloc] = PolynomialFit(x,y);
        disp(['The largest absolute error is ', num2str(abserror), ' and the x location is ', num2str(errloc)]);
    case 3
        %Call function SemilogFit and take x and y from main to the function
        SemilogFit(x,y);
    otherwise
        %Call function Loglogfit and take x and y from main to the function
        LoglogFit(x,y);
end

%Prompt user to restart the program
I = menu('Would you like to enter a new set of data? ', 'Yes', 'No');
end

%Signify the end of the program
disp('End of Program.');
