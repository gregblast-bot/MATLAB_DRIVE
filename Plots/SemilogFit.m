function [] = SemilogFit(x,y)

%Initialize f and set the size of y equal to rows and cols
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
coeff = polyfit(x_filtered, y_ln, 1);
new_y = polyval(coeff, x_filtered);
new_y = exp(new_y);
plot(x_filtered , y_filtered, 'mx', x_filtered, new_y);
title('Semilog Fit')

end