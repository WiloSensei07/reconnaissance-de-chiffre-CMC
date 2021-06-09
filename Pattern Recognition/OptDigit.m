function varargout = OptDigit(varargin)
% OPTDIGIT M-file for OptDigit.fig
%      OPTDIGIT, by itself, creates a new OPTDIGIT or raises the existing
%      singleton*.
%
%      H = OPTDIGIT returns the handle to a new OPTDIGIT or the handle to
%      the existing singleton*.
%
%      OPTDIGIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPTDIGIT.M with the given input arguments.
%
%      OPTDIGIT('Property','Value',...) creates a new OPTDIGIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OptDigit_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OptDigit_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OptDigit

% Last Modified by GUIDE v2.5 19-Sep-2016 17:06:37

%%
clc;
delete *.asv
warning off
init();

%% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OptDigit_OpeningFcn, ...
                   'gui_OutputFcn',  @OptDigit_OutputFcn, ...
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


%% --- Executes just before OptDigit is made visible.
function OptDigit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OptDigit (see VARARGIN)

%%
set(handles.PreProcessing,'enable','off')
set(handles.FeatureExtraction,'enable','off')
set(handles.Recognize,'enable','off')
set(handles.Result,'enable','off')

% Choose default command line output for OptDigit
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OptDigit wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = OptDigit_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ImagesCapture.
function ImagesCapture_Callback(hObject, eventdata, handles)
% hObject    handle to ImagesCapture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% handles.pos = get(handles.axes1,'position');

cla(handles.axes1);
axes(handles.axes1);
handles = PatternRecognition('captureimage',handles);

if (length(handles.xy(1,:))~=1)
    set(handles.PreProcessing,'enable','on')
end

guidata(hObject, handles);

% --- Executes on button press in ClearAxe.
function ClearAxe_Callback(hObject, eventdata, handles)
% hObject    handle to ClearAxe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1)


% --- Executes on button press in PreProcessing.
function PreProcessing_Callback(hObject, eventdata, handles)
% hObject    handle to PreProcessing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles = PatternRecognition('imagepreprocessing',handles);

cla(handles.axes2);
axes(handles.axes2);
imageShow(handles.imBW);

set(handles.FeatureExtraction,'enable','on')
guidata(hObject, handles);


% --- Executes on button press in FeatureExtraction.
function FeatureExtraction_Callback(hObject, eventdata, handles)
% hObject    handle to FeatureExtraction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles = PatternRecognition('featureextraction',handles);

set(handles.Observation, 'string', num2str(handles.features ));

set(handles.Recognize,'enable','on')
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function Observation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Observation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Recognize.
function Recognize_Callback(hObject, eventdata, handles)
% hObject    handle to Recognize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Image Recognition
handles = PatternRecognition('imagerecognize',handles);
set(handles.Result, 'string', num2str(handles.ind_maxi));

cla(handles.axes3);
axes(handles.axes3);
stem(handles.alphabet,handles.probabilities,'w','LineWidth',2); % probabilities
title('Probability','FontSize',10,'color',[1 1 1],'FontWeight','bol')
set(handles.axes3,'ycolor',[1 1 1],'xcolor',[1 1 1],'color',[0 0 0])
set(handles.axes3,'xtick',0:1:9)

set(handles.PreProcessing,'enable','off')
set(handles.FeatureExtraction,'enable','off')
set(handles.Recognize,'enable','off')
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
