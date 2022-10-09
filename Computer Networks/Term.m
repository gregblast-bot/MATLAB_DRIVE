clear all
start = 01;
end = 96;
T = zeros(end-start + 1,3);
start loop)
for j = start:end
start = 01;
end = 96;
String = num2str(j);
P = imread([‘P’ String ‘.JPG’]);
%P = imread(‘P93.jpg’);
%P = imrotate(P,−90);
%imshow(P)
%cut image to the right size
%P = P(20:631,:,:);
%imshow(P);
%create color histogram
imhist(P(:,:,2))
%increase contrast
P_contrast = decorrstretch(P, ‘Tol’, 0.01);
imshow(P_contrast);
% 1)create threshold
% Convert RGB image to chosen color space
I = rgb2hsv(P);
% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.115;
channel1Max = 0.436;
% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.526;
channel2Max = 1.000;
% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.627;
channel3Max = 1.000;
% Create mask based on chosen histogram thresholds
BW = (I(:,:,1) >= channel1Min) & (I(:,:,1) <= channel1Max) & ...
(I(:,:,2) >= channel2Min) & (I(:,:,2) <= channel2Max) & ...
(I(:,:,3) >= channel3Min) & (I(:,:,3) <= channel3Max);
% Initialize output masked image based on input image.
maskedRGBImage = P;
% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;
imshow(BW)
% 2) count plants
imshow(BW)
Test = bwareaopen(BW,5);
Test = imfill(Test, ’holes’);
B = bwboundaries(Test);
imshow(Test)
hold on
visboundaries(B)
cc = bwconncomp(Test);
graindata = regionprops(cc,’basic’);
number of plants = cc.NumObjects;
% convert image to matrix
figure(2);
Histi = reshape(P(:,:,2),[],1);
Histi1 = im2double(Histi) *255;
hist(Histi1,100);
title(‘green-value’);
% 3) create binary image and calculate ground cover
% Convert RGB image to chosen color space
RGB = im2double(P);
imshow(RGB)
form=makecform(‘srgb2lab’,‘AdaptedWhitePoint’,whitepoint(‘D65’));
I = applycform(RGB,cform);
% Define thresholds for channel 1 based on histogram settings
channel1Min = 12.502;
channel1Max = 100.000;
% Define thresholds for channel 2 based on histogram settings
channel2Min = −10.414;
channel2Max = 8.329;
% Define thresholds for channel 3 based on histogram settings
channel3Min = −8.447;
channel3Max = 67.004;
% Create mask based on chosen histogram thresholds
BW_1 = (I(:,:,1) >= channel1Min) & (I(:,:,1) <= channel1Max) & ...
(I(:,:,2) >= channel2Min) & (I(:,:,2) <= channel2Max) & ...
(I(:,:,3) >= channel3Min) & (I(:,:,3) <= channel3Max);
% Initialize output masked image based on input image.
maskedRGBImage = RGB;
% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW_1,[1 1 3])) = 0;
imshow(BW_1)
%3.1) count green pixels
numtotal = nnz(P)
numgreenpixel = nnz(BW_1)
Green_percent = (numgreenpixel/numtotal) *100
T(j-start + 1,1) = number of plants;
T(j-start + 1,2) = numgreenpixel;
T(j-start + 1,3) = Green_percent;
clear(‘-regexp’,’[^T] *’);
% end (end of loop)