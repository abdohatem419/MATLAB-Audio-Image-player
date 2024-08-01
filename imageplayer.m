function varargout = imageplayer(varargin)
% IMAGEPLAYER MATLAB code for imageplayer.fig
%      IMAGEPLAYER, by itself, creates a new IMAGEPLAYER or raises the existing
%      singleton*.
%
%      H = IMAGEPLAYER returns the handle to a new IMAGEPLAYER or the handle to
%      the existing singleton*.
%
%      IMAGEPLAYER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEPLAYER.M with the given input arguments.
%
%      IMAGEPLAYER('Property','Value',...) creates a new IMAGEPLAYER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imageplayer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imageplayer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imageplayer

% Last Modified by GUIDE v2.5 05-Aug-2023 17:21:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imageplayer_OpeningFcn, ...
                   'gui_OutputFcn',  @imageplayer_OutputFcn, ...
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


% --- Executes just before imageplayer is made visible.
function imageplayer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imageplayer (see VARARGIN)

% Choose default command line output for imageplayer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imageplayer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imageplayer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in choose.
function choose_Callback(hObject, eventdata, handles)
% hObject    handle to choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.original_show);
cla;
axes(handles.encrypted_show);
cla;
axes(handles.gray_show);
cla;
[file_name,path_name]=uigetfile();
full_path=strcat(path_name,file_name);
global the_image
the_image=imread(full_path);


% --- Executes on button press in backhome.
function backhome_Callback(hObject, eventdata, handles)
% hObject    handle to backhome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
my_home;


% --- Executes on button press in originalbutton.
function originalbutton_Callback(hObject, eventdata, handles)
% hObject    handle to originalbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global the_image
axes(handles.original_show);
imshow(the_image);


% --- Executes on button press in encryptbutton.
function encryptbutton_Callback(hObject, eventdata, handles)
% hObject    handle to encryptbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global the_image
new_image=imnoise(the_image,'gaussian',1,2);
axes(handles.encrypted_show);
imshow(new_image);

% --- Executes on button press in graybutton.
function graybutton_Callback(hObject, eventdata, handles)
% hObject    handle to graybutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global the_image
new_new_image=rgb2gray(the_image);
axes(handles.gray_show);
imshow(new_new_image);
