img = imread('C:\sound_mat\cameraman.tif');
imgd = im2double(img);
mean_filter = ones(3,3)/9;
img1 = filter2(mean_filter, imgd);

subplot(121);
imshow(img);
title('the orginal image');

subplot(122);
imshow(img1);
title('image with filter');
% ======================adding noisy image===============================
imgd_noise = imnoise(imgd,'salt & pepper',0.08);
img_f = filter2(mean_filter, imgd_noise);
figure('Name','Noisy images');
subplot(121);imshow(imgd_noise);
subplot(122);imshow(img_f);

% ================alternative using the medfilt2()=========================
cmr_noise = imnoise(img,'salt & pepper', 0.08);
cmr_medf = medfilt2(cmr_noise);
figure(3);
subplot(121);imshow(cmr_noise);
subplot(122);imshow(cmr_medf);