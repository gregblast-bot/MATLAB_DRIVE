clear all 
clc

PP5_header();
[filename] = PP5_filename();
[fileload] = PP5_fileload(filename);

[rows,cols] = size(fileload);

col1 = fileload(1:rows, 1);
col2 = fileload(1:rows, 2);
col3 = fileload(1:rows, 3);
col4 = fileload(1:rows, 4);

subplot(2,2,1);
plot(col1,col2,'bs',col1,col2);
title('Column 1 vs. Column 2');
xlabel('time (min)');
ylabel('chicken wings (chicken)');

subplot(2,2,2);
plot(col1,col3,'g^',col1,col3);
title('Column 1 vs. Column 3');
xlabel('time (min)');
ylabel('mountain dew (oz)');

subplot(2,2,3);
plot(col1,col4,'m.',col1,col4);
title('Column 1 vs. Column 4');
xlabel('time (min)');
ylabel('blue cheese dressing (gm)');

subplot(2,2,4);
imshow('wings.jpg');
text(2,3,'yummy wings');