
choice = 1;
while choice == true
PP6_header();
[filename] = PP6_filename();
[fileload] = PP6_fileload(filename);
PP6_matrixsum(fileload)
sum2 = sum(fileload);
disp(sum2);
sum3 = sum(sum2);
disp(sum3);
choice = input('Go Again, y or n', 's');
if choice == 'y'
    choice = 1;
else
    choice = false;
end
end