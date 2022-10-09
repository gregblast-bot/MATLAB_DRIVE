function fun4(img)

choice=menu('What would you like to do?','brighten','darken');
newimg=img;
if choice==1
    [r,c]=size(img);
    for i=1:r
        for j=1:c
            if img(i,j)==0
                newimg(i,j)=1;
            end
        end
    end
    subplot(1,2,1)
    imshow(img)
    title('original image')
    subplot(1,2,2)
    imshow(img*3)
    title('modified image')
else
    subplot(1,2,1)
    imshow(img)
    title('original image')
    subplot(1,2,2)
    imshow(img*.5)
    title('modified image')
end