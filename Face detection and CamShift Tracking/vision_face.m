% Create a cascade detector object
faceDetector = vision.CascadeObjectDetector();

%Read a video frame and run the detector.
videoFileReader = vision.VideoFileReader('visionface.avi');
videoFrame = step(videoFileReader);
bbox = step(faceDetector,videoFrame);

% Draw the returned bounding box around the detected face.
videoOut = insertObjectAnnotation(videoFrame,'rectangle',bbox,'Face');
figure, imshow(videoOut), title('Detected face');

% Get the skin tone information by extracting the Hue from the video frame
% converted to the HSV color space.
[hueChannel,~,~] = rgb2hsv(videoFrame);

% Display the Hue Channel data and draw the bounding box around the face.
figure, imshow(hueChannel), title('Hue channel data');
rectangle('Position',bbox(1,:),'LineWidth',2,'EdgeColor',[1 1 0])