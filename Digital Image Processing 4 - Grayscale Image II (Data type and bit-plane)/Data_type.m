cmr = imread('C:\sound_mat\cameraman.tif');
cmr_d = double(cmr);

imshow(cmr_d);
imfinfo('C:\sound_mat\cameraman.tif')
size(cmr)%256   256
% ' imshow() has two function overloading ============================'

%%It takes image with type uint8 as it ranges between [0, 255],..
%%and takes image with type double as it ranges between [0, 1] '
%%in this case, every pixel with over 1 is considered saturated, so u get
%%all white image.

%%============================solutions=================================
%%alternative 1
% img_d = double(cmr);
% figure(2)
% imshow(img_d/255)

% alternative 2
img_im2d = im2double(cmr);
figure(2)
imshow(img_im2d);

%%================Extracting bit-plane from Grayscale image===============
img = double(cmr);
bp0 = mod(img,2);
bp1 = mod(floor(img/2),2); %% shifting the bit using floor(), which rounds up toward negative infinity
bp2 = mod(floor(img/4),2);
bp3 = mod(floor(img/8),2);
bp4 = mod(floor(img/16),2);
bp5 = mod(floor(img/32),2);
bp6 = mod(floor(img/64),2);
bp7 = mod(floor(img/128),2);
bp8 = mod(floor(img/256),2);

subplot(241);imshow(bp0);title('bit-plane 0 : LSB');
subplot(242);imshow(bp1);title('bit-plane 1');
subplot(243);imshow(bp2);title('bit-plane 2');
subplot(244);imshow(bp3);title('bit-plane 3');
subplot(245);imshow(bp4);title('bit-plane 4');
subplot(246);imshow(bp5);title('bit-plane 5');
subplot(247);imshow(bp6);title('bit-plane 6');
subplot(248);imshow(bp7);title('bit-plane 7 : MSB');
figure(3)
imshow(bp8);title('bit-plane 8 ');
impixelinfo
%% show index of 0, with RGB = 000. all black


%%=====================Merging all bit-planes==============================
img = double(cmr);
bp0 = mod(img,2);
bp1 = mod(floor(img/2),2);
bp2 = mod(floor(img/4),2);
bp3 = mod(floor(img/8),2);
bp4 = mod(floor(img/16),2);
bp5 = mod(floor(img/32),2);
bp6 = mod(floor(img/64),2);
bp7 = mod(floor(img/128),2);

bp_all = 2*(2*(2*(2*(2*(2*(2*bp7+bp6)+bp5)+bp4)+bp3)+bp2)+bp1)+bp0;

subplot(241);imshow(bp0);title('bit-plane 0 : LSB');
subplot(242);imshow(bp1);title('bit-plane 1');
subplot(243);imshow(bp2);title('bit-plane 2');
subplot(244);imshow(bp3);title('bit-plane 3');
subplot(245);imshow(bp4);title('bit-plane 4');
subplot(246);imshow(bp5);title('bit-plane 5');
subplot(247);imshow(bp6);title('bit-plane 6');
subplot(248);imshow(bp7);title('bit-plane 7 : MSB');

figure, imshow(uint8(bp_all));
title('Merging all bit-planes');