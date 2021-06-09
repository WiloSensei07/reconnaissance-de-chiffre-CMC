function [imBW, imData] = imagePreprocessing(imdata, mrows, ncols)


%% Binarization
imgBW = imageBinarisation(imdata, 0.005); % Convert image to binary image, based on threshold

%% cropping Image
bw_crop = imageCropping(imgBW);
imdata = imageCropping(imdata);

%%  Resize image
imBW_crop = imageResize(bw_crop,mrows,ncols);
imBW_crop = imageBinarisation(imBW_crop, 0.001);

imData = imageResize(imdata,mrows,ncols);

%%
imBW = imBW_crop;

