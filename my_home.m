function varargout = my_home(varargin)
% MY_HOME MATLAB code for my_home.fig
%      MY_HOME, by itself, creates a new MY_HOME or raises the existing
%      singleton*.
%
%      H = MY_HOME returns the handle to a new MY_HOME or the handle to
%      the existing singleton*.
%
%      MY_HOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MY_HOME.M with the given input arguments.
%
%      MY_HOME('Property','Value',...) creates a new MY_HOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before my_home_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to my_home_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help my_home

% Last Modified by GUIDE v2.5 06-Aug-2023 12:41:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @my_home_OpeningFcn, ...
                   'gui_OutputFcn',  @my_home_OutputFcn, ...
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


% --- Executes just before my_home is made visible.
function my_home_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to my_home (see VARARGIN)

% Choose default command line output for my_home
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes my_home wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = my_home_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in image_edit.
function image_edit_Callback(hObject, eventdata, handles)
% hObject    handle to image_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imageplayer;

% --- Executes on button press in audio_edit.
function audio_edit_Callback(hObject, eventdata, handles)
% hObject    handle to audio_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
new_audio_player;