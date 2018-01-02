function [finalImage,erodedBW] =skullstripping(grayImage)


% format long g;
% format compact;
fontSize = 20;

% Check that user has the Image Processing Toolbox installed.
hasIPT = license('test', 'image_toolbox');
if ~hasIPT
	% User does not have the toolbox installed.
	message = sprintf('Sorry, but you do not seem to have the Image Processing Toolbox.\nDo you want to try to continue anyway?');
	reply = questdlg(message, 'Toolbox missing', 'Yes', 'No', 'Yes');
	if strcmpi(reply, 'No')
		% User said No, so exit.
		return;
	end
end






% Get the dimensions of the image.
% numberOfColorBands should be = 1.
% [rows, columns, numberOfColorBands] = size(grayImage);
% if numberOfColorBands > 1
% 	It's not really gray scale like we expected - it's color.
% 	Convert it to gray scale by taking only the green channel.
% 	grayImage = grayImage(:, :, 2); % Take green channel.
% end



% Let's compute and display the histogram.
[pixelCount, grayLevels] = imhist(grayImage);
bar(grayLevels, pixelCount);
% grid on;
% title('Histogram of original image', 'FontSize', fontSize);
xlim([0 grayLevels(end)]); % Scale x axis manually.

% Crop image to get rid of light box surrounding the image
grayImage = grayImage(3:end-3, 4:end-4);
% Threshold to create a binary image
binaryImage = grayImage > 20;
% Get rid of small specks of noise
%Binary Image
binaryImage = bwareaopen(binaryImage, 10); %Check



% Seal off the bottom of the head - make the last row white.
%Cleaned Binary Image
binaryImage(end,:) = true;
% Fill the image
binaryImage = imfill(binaryImage, 'holes');


% Erode away 15 layers of pixels.
%ErodedBinary Image
se = strel('disk', 15, 0);
binaryImage = imerode(binaryImage, se);


% Mask the gray image
finalImage = grayImage; % Initialize.
finalImage(~binaryImage) = 0;

% IM=imdilate(finalImage,strel(NHOOD));
% figure,imshow(IM);
se = strel('line',9,70);
erodedBW = imerode(finalImage,se);
%imshow(erodedBW);

% se1 = strel('arbitrary',nhood);
% dilatedI = imdilate(finalImage,se1);
% figure,imshow(dilatedI);


