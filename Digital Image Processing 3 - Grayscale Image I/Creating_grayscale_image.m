disp('Creating grayscale image')
height = 240;
width = 320;

white = uint8(255*ones(height,width));
black = uint8(zeros(height,width));
figure;
subplot(121);
imshow(white);

subplot(122);
imshow(black);