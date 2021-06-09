function handles = PatternRecognition(action,handles)

if nargin < 1
    action = 'initialize';
    handles = [];
end

%%
switch lower(action)
    case 'initialize'
        init()
        OptDigit
    case 'captureimage' %Images Capture
        nom_bmp = 'bmpImage\number.bmp';
        imageAcquisition;
        imdata = imread(nom_bmp);
        imdata = 255-imdata(:,:,1);
        handles.imdata = imdata;
        handles.xy = x1;
        
    case 'imagepreprocessing' % Image Preprocessing
        [imBW, imData] = imagePreprocessing(handles.imdata, 16, 16);
        handles.imData = imData;
        handles.imBW = imBW;
        
    case 'featureextraction' % Image Feature Extraction
        handles.features = imageFeaturesExtraction(handles.imBW);
        
    case 'imagerecognize' % Image Recognition
        handles.alphabet = 0:9;    
        HMMmodel = [pwd '\MatFile\HMMmodel.mat'];
        handles.probabilities = OptDigitsRecognition(handles.imData,handles.features,HMMmodel); 
        
        [~, ind_maxi] = max(handles.probabilities);
        handles.ind_maxi = ind_maxi - 1;
end

%%
