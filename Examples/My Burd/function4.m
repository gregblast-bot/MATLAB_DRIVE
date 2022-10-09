function [] = function4()

[I] = function3(in);
    
choice = menu('Pick something','Lighter','Darker');

[rows, cols] = size(I);

if choice == 1
    for i = 1 : rows
        for j = 1:cols
            I(i,j) = I ((i - 50, (j - 50))
        end
end
    
elseif choice == 2
    for i = 1 : rows
        for j = 1:cols
            I(i,j) = I ((i + 50, (j + 50))
        end
    end

end