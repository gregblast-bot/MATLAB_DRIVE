function [filename] = PP5_filename()
    
    filename = input('Please input the correct file name with the correct extension', 's');
    
    while exist(filename) == 0
        filename = input('Please input the correct file name with the correct extension', 's');
    end
    
end