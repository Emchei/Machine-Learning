img =imread('C:\sound_mat\Hawkes_Bay_NZ.jpg');
figure(1)
imhist(img);

% The Histogram Equalization algorithm enhances the contrast of images by
% ...
% transforming the values in an intensity image so that the histogram of
% the output image is approximately flat.

figure(2);
img_eq = histeq(img); imshow(img_eq);

% after the histogram equalization
figure(3), imhist(histeq(img));

% ===========Enhancing contrast using imadjust()===========================
% from the 1st imhist reading 100/255 = 0.4 and 220/256 = 0.86
img_adj = imadjust(img, [0.4,0.86],[0.0,1.0]);
figure(4), imshow(img_adj);
figure(5);
hold on;
imhist(img);
imhist(img_adj);
hold off;
