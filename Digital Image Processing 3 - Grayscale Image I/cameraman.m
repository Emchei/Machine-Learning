cmr = imread('C:\sound_mat\cameraman.tif');
info = imfinfo('C:\sound_mat\cameraman.tif')

disp('converting to indexed image');
[ind, map] = gray2ind(cmr,16);
figure(1)
imshow(ind,map);
size(map);%shows that map has 16 RGB when its element from the workspace
%%It's 16 rows of RGB and each row corresponds to the index stored ... 
%% in the indexed image ind which has the same dimension (256×256), ...
%%as the input.
ind(125,50) %%shows the corresponding index the pixel has i.e 1

ind(128,128) % the index of the pixel is 9,which means RGB value of 9th row of the map.
%%map : [0.600000000000000,0.600000000000000,0.600000000000000]


[ind, map] = gray2ind(cmr,64);
figure(2)
imshow(ind,map);
colormap jet
colormap

disp('size of the colormap in jet(256)===================================');
[ind, map] = gray2ind(cmr,256);
figure(3)
imshow(ind,jet(256));
title('jet map 256')
size(colormap)