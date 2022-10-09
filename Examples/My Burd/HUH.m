clear all
clc
burd = imread('BURD.jpg');

imshow(burd);
imshow(burd(:,:,1));
subplot(3,1,1);
imshow(burd(:,:,1));
subplot(3,1,2);
imshow(burd(:,:,2));
subplot(3,1,2);
imshow(burd(:,:,3));
imshow(burd);
choice = menu('Pick something','yes','no');