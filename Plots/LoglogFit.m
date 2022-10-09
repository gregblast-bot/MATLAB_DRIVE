function [] = LoglogFit(x,y)  
    
%Initialize f and set the size of y to rows and cols
f = 1;    
[rows, cols] = size(y);

%Iterate through rows and columns, if rows or columns is even and if the
%element at y(i,j) is greater than zero, filter x and y values so that no
%value in the matrices are zero
for i = 1:rows
    for j = 1:cols
        if mod(rows,0)
            if y(i,j) > 0
                y_filtered(1,f) = y(i,j);
                x_filtered(1,f) = x(i,j);
                f = f + 1;
            end
        elseif mod(cols,0)
            if y(i,j) > 0
                y_filtered(f,1) = y(i,j);
                x_filtered(f,1) = x(i,j);
                f = f + 1;
            end
        end
    end
end

%Use logarithmic and exponential functions to make the fit
y_ln = log(y_filtered);
x_ln = log(x_filtered);
coeff = polyfit(y_ln, x_ln, 1);
new_y = polyval(x_ln, coeff);
new_y = exp(new_y);
plot(x_filtered , y_filtered, 'c*', x_filtered , y_filtered);
title('Loglog Fit')
end
