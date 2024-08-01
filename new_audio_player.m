function varargout = new_audio_player(varargin)
% NEW_AUDIO_PLAYER MATLAB code for new_audio_player.fig
%      NEW_AUDIO_PLAYER, by itself, creates a new NEW_AUDIO_PLAYER or raises the existing
%      singleton*.
%
%      H = NEW_AUDIO_PLAYER returns the handle to a new NEW_AUDIO_PLAYER or the handle to
%      the existing singleton*.
%
%      NEW_AUDIO_PLAYER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW_AUDIO_PLAYER.M with the given input arguments.
%
%      NEW_AUDIO_PLAYER('Property','Value',...) creates a new NEW_AUDIO_PLAYER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before new_audio_player_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to new_audio_player_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help new_audio_player

% Last Modified by GUIDE v2.5 06-Aug-2023 12:55:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @new_audio_player_OpeningFcn, ...
                   'gui_OutputFcn',  @new_audio_player_OutputFcn, ...
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
currentsong=' ';
function your_radio_off(handles)
set(handles.original_radio,'value',0);
set(handles.encrypt_radio,'value',0);

function your_pop_off(handles)
set(handles.original_menu,'enable','off');
set(handles.encrypt_menu,'enable','off');

% --- Executes just before new_audio_player is made visible.
function new_audio_player_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to new_audio_player (see VARARGIN)

% Choose default command line output for new_audio_player
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes new_audio_player wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = new_audio_player_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in choose_your_audio.
function choose_your_audio_Callback(hObject, eventdata, handles)
% hObject    handle to choose_your_audio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[audio_file,audio_path]=uigetfile();
full_audio=strcat(audio_path,audio_file);
[y fs]=audioread(full_audio);
stop_current_song();
currentsong=audio_file;
global k
k=audioplayer(y,fs);
global e
new_y=y(:,1)+y(:,2);
n=rand(length(y),1);
new_y=new_y+50*n;
e=audioplayer(new_y,fs);
% --- Executes on button press in back_button.
function back_button_Callback(hObject, eventdata, handles)
% hObject    handle to back_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
my_home;

% --- Executes on button press in original_radio.
function original_radio_Callback(hObject, eventdata, handles)
% hObject    handle to original_radio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of original_radio
your_radio_off(handles);
your_pop_off(handles);
set(handles.original_radio,'value',1);
set(handles.original_menu,'enable','on');

% --- Executes on button press in encrypt_radio.
function encrypt_radio_Callback(hObject, eventdata, handles)
% hObject    handle to encrypt_radio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of encrypt_radio
your_radio_off(handles);
your_pop_off(handles);
set(handles.encrypt_radio,'value',1);
set(handles.encrypt_menu,'enable','on');

% --- Executes on selection change in original_menu.
function original_menu_Callback(hObject, eventdata, handles)
% hObject    handle to original_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns original_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from original_menu
global k
h=get(hObject,'Value');
switch h
    case 2
        play(k);
   
    case 3
        pause(k);
       
    case 4
        resume(k);
        
    case 5
        stop(k);
        
end


% --- Executes during object creation, after setting all properties.
function original_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to original_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in encrypt_menu.
function encrypt_menu_Callback(hObject, eventdata, handles)
% hObject    handle to encrypt_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns encrypt_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from encrypt_menu

global e
hh=get(hObject,'Value');
switch hh
    case 2
        play(e);
    case 3
        pause(e);
    case 4
        resume(e);
    case 5
        stop(e);
end

% --- Executes during object creation, after setting all properties.

function encrypt_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to encrypt_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function stop_current_song()
    global k e currentsong
    
    if ~isempty(currentsong)
        stop(k);
        stop(e);
        
        currentSong = '';
    end
