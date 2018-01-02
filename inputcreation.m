%Open jpg image
image


%Check the size/pixelvalue of the image
sizew
sizeh

%Preprocessing
image = rgb2gray(image);
image = medfilt2(image);


%GLCMfeatures
GLCM2 = graycomatrix(image,'Offset',[2 0;0 2]);
stats = GLCM_Features4(GLCM2,0);


load input
pixelvalue = sizew*sizeh;
input(1)= pixelvalue;
% contrast = stats.contr;
% input(x+1)= contrast;
% correlation = stats.corrm;
% input(x+2)= correlation;
% homogeinity = stats.homop;
% input(x+3)= homogeinity;
% energy = stats.energ;
% input(x+4)= energy;
% dissimilarity = stats.dissi;
% input(x+5)= dissimilarity;
% sumvariance = stats.svarh;
% input(x+6)= sumvariance;
% sumaverage = stats.savgh;
% input(x+7)= sumaverage;
% sumentropy = stats.senth;
% input(x+8)= sumentropy;
% differencevariance = stats.dvarh;
% input(x+9)= differencevariance;
% inversedifference = stats.denth;
% input(x+10)=inversedifference;
% inversedifference = stats.homom;
% input(x+11)=inversedifference;
save input




