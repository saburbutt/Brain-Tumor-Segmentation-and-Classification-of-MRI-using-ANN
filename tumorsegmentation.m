function varargout = tumorsegmentation(varargin)
% TUMORSEGMENTATION MATLAB code for tumorsegmentation.fig
%      TUMORSEGMENTATION, by itself, creates a new TUMORSEGMENTATION or raises the existing
%      singleton*.
%
%      H = TUMORSEGMENTATION returns the handle to a new TUMORSEGMENTATION or the handle to
%      the existing singleton*.
%
%      TUMORSEGMENTATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUMORSEGMENTATION.M with the given input arguments.
%
%      TUMORSEGMENTATION('Property','Value',...) creates a new TUMORSEGMENTATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tumorsegmentation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tumorsegmentation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tumorsegmentation

% Last Modified by GUIDE v2.5 21-Apr-2017 15:24:48

% [V,info]=ReadData3D;
% imshow(V(:,:,12),[]);
% clc;
% clearStr = 'clear all';
% evalin('base',clearStr);
% delete(handles.clearallbutton);



% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @tumorsegmentation_OpeningFcn, ...
    'gui_OutputFcn',  @tumorsegmentation_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before tumorsegmentation is made visible.
function tumorsegmentation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tumorsegmentation (see VARARGIN)

% Choose default command line output for tumorsegmentation
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tumorsegmentation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tumorsegmentation_OutputFcn(hObject, eventdata, handles)
% Get default command line output from handles structure
varargout{1} = handles.output;


% ----------------------Open File from Folder--------------------------
function OpenFile_ClickedCallback(hObject, eventdata, handles)
[filename pathname]=uigetfile({'*.jpg';'*.bmp';'*.png'},'File Selector');
global image;
image= strcat(pathname,filename);
axes(handles.axes1);
imshow(image);
fileinfo=imfinfo(image);
filesize=fileinfo.FileSize(1,1);
sizew=fileinfo.Width(1,1);
sizeh=fileinfo.Height(1,1);
pixelval=sizew*sizeh;
set(handles.urlstring,'string',image);
set(handles.Filename,'string',filename);
set(handles.sizestring,'string',filesize);
set(handles.imagewidth,'string',sizew);
set(handles.imageheight,'string',sizeh);
set(handles.pixelvalue,'string',pixelval);


% --------------------------------------------------------------------
function dcmviewer_Callback(hObject, eventdata, handles)
% [V,info]=ReadData3D; %Remember the V being reterned is a 3D volume
% set(handles.urlstring,'string',info.Filename);
% set(handles.Filename,'string',info.Filename);
% set(handles.imagewidth,'string',info.Dimensions);
% %Taking slice number from user
% x=17;
% %subplot(221+x);
%  imshow(V(:,:,x),[]);
% %montage(V(:,:,:,x),map);
% % title('Image' );
% %montage(V,map);
image=dcmconvert;
axes(handles.axes1);
imshow(image,[]);


% --- Executes on button press in NoiseRemoval.
function NoiseRemoval_Callback(hObject, eventdata, handles)
% The example uses a 3-by-3 neighborhood. 
% Notice that medfilt2 does a better job of removing noise, with less blurring of edges of the picture.
image =getimage(handles.axes2);
Kmedian = medfilt2(image);
axes(handles.axes2);
imshow(Kmedian(:,:,:),[]);


% --- Executes on button press in colortogrey.
function colortogrey_Callback(hObject, eventdata, handles)
image =getimage(handles.axes1);
imagegray=rgb2gray(image);
%imshow(imagegray(:,:,:),[]);
axes(handles.axes2);
imshow(imagegray(:,:,:),[]);


function urlstring_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of urlstring as text
%        str2double(get(hObject,'String')) returns contents of urlstring as a double


% --- Executes during object creation, after setting all properties.
function urlstring_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Filename_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function Filename_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sizestring_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of sizestring as text
%        str2double(get(hObject,'String')) returns contents of sizestring as a double


% --- Executes during object creation, after setting all properties.
function sizestring_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function imageheight_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of imageheight as text
%        str2double(get(hObject,'String')) returns contents of imageheight as a double


% --- Executes during object creation, after setting all properties.
function imageheight_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function imagewidth_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of imagewidth as text
%        str2double(get(hObject,'String')) returns contents of imagewidth as a double


% --- Executes during object creation, after setting all properties.
function imagewidth_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
msgbox('Kindly use the grey scale function before the noise removal function.''For DICOM viewer function to work you need to install ReadData3d plugin from matlab repository');



% --------------------------------------------------------------------
function webcamimage_Callback(hObject, eventdata, handles)
%We need to install image adapter for it to work.I currently dont have one
%The purpose of this function is to use webcam to aquire a mri image and be able to perform functions on that
% x= videoinput('winvideo',1);
%     image= getsnapshot(x);
%     fname='Image 1';
%     imwrite(image,fname,'jpg');


% --- Executes on button press in Normalization.
function Normalization_Callback(hObject, eventdata, handles)
image =getimage(handles.axes2);
minpixintensity= min(min(image));
maxpixintensity=max(max(image));
%msgbox(sprintf('minpixintensity = %2.3g \n maxpixintensity = %2.3g',minpixintensity,maxpixintensity),'Pixel Intensity ');
y = (255 .* ((double(image)-minpixintensity)) ./ (maxpixintensity-minpixintensity));
axes(handles.axes2);
imshow(y);


% --- Executes on button press in EdgeDetection.
function EdgeDetection_Callback(hObject, eventdata, handles)
image =getimage(handles.axes2);
BW1 = edge(image,'sobel');
BW2 = edge(image,'canny');
figure;
imshowpair(BW1,BW2,'montage')
title('Sobel Filter                                   Canny Filter');
se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);
BWsdil = imdilate(BW1, [se90 se0]);
BWsdil2 = imdilate(BW2, [se90 se0]);
figure, imshowpair(BWsdil,BWsdil2,'montage'), title('dilated gradient mask');
BWdfill = imfill(BWsdil, 'holes');
BWdfill2 = imfill(BWsdil2, 'holes');
figure, imshowpair(BWdfill,BWdfill2,'montage'),title('binary image with filled holes');

BWnobord1 = imclearborder(BWdfill, 4);
BWnobord2 = imclearborder(BWdfill2, 4);
figure, imshowpair(BWnobord1,BWnobord2,'montage'), title('cleared border image');

seD = strel('diamond',1);
BWfinal = imerode(BWnobord1,seD);
BWfinal = imerode(BWfinal,seD);
BWfinal1 = imerode(BWnobord2,seD);
BWfinal1 = imerode(BWfinal1,seD);
figure, imshowpair(BWfinal,BWfinal1,'montage'), title('segmented image');

BWoutline = bwperim(BWfinal);
Segout = image;
Segout(BWoutline) = 255;
BWoutline1 = bwperim(BWfinal1);
Segout1 = image;
Segout1(BWoutline1) = 255;
figure, imshowpair(Segout,Segout1,'montage'), title('outlined original image');


% --------------------------------------------------------------------
function HistogramView_Callback(hObject, eventdata, handles)
image =getimage(handles.axes1);
imhist(image);
title('Image Histogram');


% --------------------------------------------------------------------
function ResetImage_Callback(hObject, eventdata, handles)
%nullifify size and name and url string after reset
cla reset;



% --- Executes on button press in HistogramEquilization.
function HistogramEquilization_Callback(hObject, eventdata, handles)
image =getimage(handles.axes2);
histeq(image);
title('Histogram after equilization');


% --------------------------------------------------------------------
function MeshPlot_Callback(hObject, eventdata, handles)
image =getimage(handles.axes2);
mesh(image);
title('Mesh Plot of an image');


% --- Executes on button press in Regionofinterest.
function Regionofinterest_Callback(hObject, eventdata, handles)
% hObject    handle to Regionofinterest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image =getimage(handles.axes2);
ROI(image, 2);


% --- Executes on button press in Skullstripping.
function Skullstripping_Callback(hObject, eventdata, handles)
image = getimage(handles.axes2);
[skullstrippedimage,eroded]=skullstripping(image);
axes(handles.axes2);
imshow(eroded,[]); 


   
   
   
   
   
   
   

% --- Executes on button press in TumorExtraction.
function TumorExtraction_Callback(hObject, eventdata, handles)
image = getimage(handles.axes1);
image2 = getimage(handles.axes2);
%The problem with this is that it does not take preprocessed image.
% [output3]=tumorextraction(image,image2);
% axes(handles.axes2);
% imshow(output3(:,:,:),[]);


%level = graythresh(image2);
%gray = gray>80;
segmentedimage = im2bw(image2,.6);
segmentedimage = bwareaopen(segmentedimage,80);
% [m, n, ~] = size(image);


%im2bw(image);
%maskedImage = segmentedimage(:,:,0) .* image(:,:,0);
%img = image > 10;
%maskedImage = uint8(img) .* image;
%maskedImage(~mask)=0;
axes(handles.axes2)
imshow(segmentedimage(:,:,:),[]);
%colormap('default');
%imagesc(image.*segmentedimage);
%colormap(autumn(3));


if sum(segmentedimage)==0
  h=msgbox('The MRI report is Normal');    
  
else
  h= msgbox('The MRI report contains Tumor') ;
end

























function contrasttextbox_Callback(hObject, eventdata, handles)
% hObject    handle to contrasttextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of contrasttextbox as text
%        str2double(get(hObject,'String')) returns contents of contrasttextbox as a double


% --- Executes during object creation, after setting all properties.
function contrasttextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to contrasttextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function correlationtextbox_Callback(hObject, eventdata, handles)
% hObject    handle to correlationtextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of correlationtextbox as text
%        str2double(get(hObject,'String')) returns contents of correlationtextbox as a double


% --- Executes during object creation, after setting all properties.
function correlationtextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to correlationtextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function homogeinitytextbox_Callback(hObject, eventdata, handles)
% hObject    handle to homogeinitytextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of homogeinitytextbox as text
%        str2double(get(hObject,'String')) returns contents of homogeinitytextbox as a double


% --- Executes during object creation, after setting all properties.
function homogeinitytextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to homogeinitytextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function energytextbox_Callback(hObject, eventdata, handles)
% hObject    handle to energytextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of energytextbox as text
%        str2double(get(hObject,'String')) returns contents of energytextbox as a double


% --- Executes during object creation, after setting all properties.
function energytextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to energytextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dissimilaritytextbox_Callback(hObject, eventdata, handles)
% hObject    handle to dissimilaritytextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dissimilaritytextbox as text
%        str2double(get(hObject,'String')) returns contents of dissimilaritytextbox as a double


% --- Executes during object creation, after setting all properties.
function dissimilaritytextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dissimilaritytextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sumofaveragetextbox_Callback(hObject, eventdata, handles)
% hObject    handle to sumofaveragetextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sumofaveragetextbox as text
%        str2double(get(hObject,'String')) returns contents of sumofaveragetextbox as a double


% --- Executes during object creation, after setting all properties.
function sumofaveragetextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sumofaveragetextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sumofvariancetextbox_Callback(hObject, eventdata, handles)
% hObject    handle to sumofvariancetextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sumofvariancetextbox as text
%        str2double(get(hObject,'String')) returns contents of sumofvariancetextbox as a double


% --- Executes during object creation, after setting all properties.
function sumofvariancetextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sumofvariancetextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sumentropytextbox_Callback(hObject, eventdata, handles)
% hObject    handle to sumentropytextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sumentropytextbox as text
%        str2double(get(hObject,'String')) returns contents of sumentropytextbox as a double


% --- Executes during object creation, after setting all properties.
function sumentropytextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sumentropytextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function differencevariancetextbox_Callback(hObject, eventdata, handles)
% hObject    handle to differencevariancetextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of differencevariancetextbox as text
%        str2double(get(hObject,'String')) returns contents of differencevariancetextbox as a double


% --- Executes during object creation, after setting all properties.
function differencevariancetextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to differencevariancetextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function differenceentropytextbox_Callback(hObject, eventdata, handles)
% hObject    handle to differenceentropytextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of differenceentropytextbox as text
%        str2double(get(hObject,'String')) returns contents of differenceentropytextbox as a double


% --- Executes during object creation, after setting all properties.
function differenceentropytextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to differenceentropytextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inversedifferencetextbox_Callback(hObject, eventdata, handles)
% hObject    handle to inversedifferencetextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inversedifferencetextbox as text
%        str2double(get(hObject,'String')) returns contents of inversedifferencetextbox as a double


% --- Executes during object creation, after setting all properties.
function inversedifferencetextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inversedifferencetextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maximumprobabilitytextbox_Callback(hObject, eventdata, handles)
% hObject    handle to maximumprobabilitytextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maximumprobabilitytextbox as text
%        str2double(get(hObject,'String')) returns contents of maximumprobabilitytextbox as a double



% --- Executes during object creation, after setting all properties.
function maximumprobabilitytextbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maximumprobabilitytextbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in GLCMfeatures.
function GLCMfeatures_Callback(hObject, eventdata, handles)
image = getimage(handles.axes1);
image = rgb2gray(image);
image = medfilt2(image);
%GLCM features will be added here.
 GLCM2 = graycomatrix(image,'Offset',[2 0;0 2]);
 stats = GLCM_Features4(GLCM2,0);
 set(handles.contrasttextbox, 'String', num2str(stats.contr));
 set(handles.correlationtextbox, 'String', num2str(stats.corrm));
 set(handles.homogeinitytextbox, 'String', num2str(stats.homop));
 set(handles.energytextbox, 'String', num2str(stats.energ));
 set(handles.dissimilaritytextbox, 'String', num2str(stats.dissi));
 set(handles.sumofaveragetextbox, 'String', num2str(stats.savgh));
 set(handles.sumofvariancetextbox, 'String', num2str(stats.svarh));
 set(handles.sumentropytextbox, 'String', num2str(stats.senth));
 set(handles.differencevariancetextbox, 'String', num2str(stats.dvarh));
 set(handles.differenceentropytextbox, 'String', num2str(stats.denth));
 set(handles.inversedifferencetextbox, 'String', num2str(stats.homom));
 set(handles.maximumprobabilitytextbox, 'String', num2str(stats.maxpr));


% --- Executes on button press in TrainImage.
function TrainImage_Callback(hObject, eventdata, handles)
% Gradient descent backpropagation
%     
%     image = getimage(handles.axes1);
%     sizew = get(handles.imagewidth,'String');
%     sizeh = get(handles.imageheight,'String');
%     sizew = str2num(sizew);
%     sizeh = str2num(sizeh);
%   
    
    
    
    
target = getimage(handles.axes2);
input = [-1 -1 2 2; 0 5 0 5];
target =[-1 -1 1 1];
net = feedforwardnet(3,'traingdm');
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.max_fail=6;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;
[net,trainingfile] = train(net,input,target,'useParallel','yes');
plot(input,target,'o');

%Saving image size/pixel value







% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function pixelvalue_Callback(hObject, eventdata, handles)
% hObject    handle to pixelvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pixelvalue as text
%        str2double(get(hObject,'String')) returns contents of pixelvalue as a double


% --- Executes during object creation, after setting all properties.
function pixelvalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pixelvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
