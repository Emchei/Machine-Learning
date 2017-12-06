obj = VideoReader('traffic.avi');
get(obj)

implay('traffic.avi');
DarkCar = rgb2gray(read(obj,71));
darkCarValue = 50;
noDarkCar = imextendedmax(DarkCar,darkCarValue);
figure(2) 
subplot(121);imshow(DarkCar);
subplot(122);imshow(noDarkCar);

sedisk = strel('disk',2); %Create morphological structuring element (STREL)
noSmallStructures = imopen(noDarkCar, sedisk); %imopen = Morphologically open image.
figure('Name', 'after the structuring element');
imshow(noSmallStructures)
