img = imread('C:\sound_mat\Einstein.jpg');
imshow(img);

size(img)
%%this reveals that there is 845×915 with 3 channel which indicates RGB.

img(400,400,:)%%shows the values of rgb at these coordinates.
%-------------------------------------------------------------------------
%converting from truecolor RGB to real-grayscale using rgb2gray()...
% which eliminates the hue and saturation information while retaining the
% luminance.

gray = rgb2gray(img);
imshow(gray);
disp('after grayscale-------------------------------------')
size(gray)
disp('further confirmation-------------------------------------')
gray(400,400,:)

disp('use the standard NTSC conversion formula used calculating the effective luminance of a pixel')
disp('manual gray')

rgb = imread('C:\sound_mat\Einstein.jpg');
gray_manual = 0.2989 * rgb(:,:,1) + 0.5870 * rgb(:,:,2) + 0.1140 * rgb(:,:,3);
figure(2)
imshow(gray_manual);

