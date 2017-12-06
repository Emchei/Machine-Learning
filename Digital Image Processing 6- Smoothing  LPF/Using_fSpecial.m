img = imread('C:\sound_mat\cameraman.tif');
H = fspecial('motion', 20,45);
MotionBlur = imfilter(img,H,'replicate');
imshow(MotionBlur);
% % ====================using disk================================
radius = 1;
rad_1 = fspecial('disk', radius);
imf_1 = imfilter(img,rad_1,'replicate');

radius = 10;

rad_10 = fspecial('disk', radius);
imf_10 = imfilter(img,rad_10,'replicate');
subplot(131);imshow(img);title('original');
subplot(132);imshow(imf_1);title('disk: radius=1');
subplot(133);imshow(imf_10);title('disk: radius=10');