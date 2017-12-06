hawk = imread('C:\sound_mat\hawk.png');
img_noise = imnoise(hawk, 'speckle',0.2);

% ==============seperating each channels.==============================
red = medfilt2(img_noise( :, :, 1),[3 3]);
green = medfilt2(img_noise( :, :, 2),[3 3]);
blue = medfilt2(img_noise( :, :, 3),[3 3]);

%%concatenate after the filtering each channel
K = cat(3,red,green,blue);

figure
subplot(121);imshow(img_noise);
subplot(122);imshow(K);