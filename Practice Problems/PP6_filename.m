function [filename] = PP6_filename()
    
    filename = input('Please input the name of the file, including the extension: ', 's');
    
    while exist(filename) == 0
        filename = input('Please input the correct name of the file, including the correct extension: ', 's');
    end
    
end