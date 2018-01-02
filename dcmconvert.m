
function [image8]=dcmconvert


[filename, pathname] = uigetfile('.dcm', 'Open DICOM Image');% Open only DICOM image

if isequal(filename, 0) || isequal(pathname, 0)   
    disp('Image input canceled.');  
else
[X,MAP]=dicomread(fullfile(pathname, filename));
image8 = uint8(255 * mat2gray(X));
% input = menu('Choose a Format','bmp','jpg','tiff','gif','png');
% if(input==1)
% imwrite(image8,'.bmp', 'bmp');% Save Image as bmp format
% elseif(input==2)
% imwrite(image8,'myfile.jpg', 'jpg');% Save Image as Jpeg format
% elseif(input==3)
% imwrite(image8,'myfile.tiff', 'tiff');% Save Image as tiff format
% elseif(input==4)
% imwrite(image8,'myfile.gif', 'gif');% Save Image as gif format
% elseif(input==5)
% imwrite(image8,'myfile.png', 'png');% Save Image as png format
% else
%     disp('Unknown image format name.');
% end; 

% imshow(image8, []);
end;
  