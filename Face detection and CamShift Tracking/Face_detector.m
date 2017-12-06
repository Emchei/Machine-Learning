% Read a video frame and run the detector.
videoFileReader = vision.VideoFileReader('C:\sound_mat\verona.wmv');
videoFrame      = step(videoFileReader);

% Create a cascade detector object.
faceDetector = vision.CascadeObjectDetector();
bbox = step(faceDetector, videoFrame);

% Draw the returned bounding box around the detected face.
videoOut = insertObjectAnnotation(videoFrame,'rectangle',bbox,'Face');
figure, imshow(videoOut), title('Detected face');

% Get the skin tone information by extracting the Hue 
% from the video frame and
% convert to the HSV color space.
[hueChannel,~,~] = rgb2hsv(videoFrame);

% Display the Hue Channel data 
% and draw the bounding box around the face.
figure, imshow(hueChannel), title('Hue channel data');
rectangle('Position',bbox(1,:),'LineWidth',2,'EdgeColor',[1 1 0])

% Detect the nose within the face region. The nose provides a more accurate
% measure of the skin tone because it does not contain any background
% pixels.

noseDetector = vision.CascadeObjectDetector('Nose', 'UseROI',true);
% Use Regoin of initerest.Set this property(UseROI) to true to detect ...
% objects within a rectangular region of interest within the input image.
noseBBox = step(noseDetector,videoFrame,bbox(1,:));
