function [] = PP6_matrixsum(fileload)
    
    [rows,cols] = size(fileload);
    sum1 = zeros(1,cols);
    
    for i = 1:rows
        for j = 1:cols
            sum1(j) = sum1(j) + fileload(i,j);
        end
    end
   
    disp(sum1);
end