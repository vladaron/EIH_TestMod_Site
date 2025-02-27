function varargout = AUDITORY_interface(varargin)
% AUDITORY_INTERFACE MATLAB code for AUDITORY_interface.fig
%      AUDITORY_INTERFACE, by itself, creates a new AUDITORY_INTERFACE or raises the existing
%      singleton*.
%
%      H = AUDITORY_INTERFACE returns the handle to a new AUDITORY_INTERFACE or the handle to
%      the existing singleton*.
%
%      AUDITORY_INTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUDITORY_INTERFACE.M with the given input arguments.
%
%      AUDITORY_INTERFACE('Property','Value',...) creates a new AUDITORY_INTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AUDITORY_interface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AUDITORY_interface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AUDITORY_interface

% Last Modified by GUIDE v2.5 25-Nov-2022 14:22:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AUDITORY_interface_OpeningFcn, ...
                   'gui_OutputFcn',  @AUDITORY_interface_OutputFcn, ...
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


% --- Executes just before AUDITORY_interface is made visible.
function AUDITORY_interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AUDITORY_interface (see VARARGIN)

% Choose default command line output for AUDITORY_interface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AUDITORY_interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AUDITORY_interface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in init_btn.
function init_btn_Callback(hObject, eventdata, handles)
% hObject    handle to init_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.start_btn,'Enable','On');

%initialize sound
% Always init to 2 channels, for the sake of simplicity:
data.nrchannels = 2;
% Perform basic initialization of the sound driver:
InitializePsychSound;
device=[];
suggestedLatencySecs=[];
data.pahandle=PsychPortAudio('Open', device, [], 1, [], data.nrchannels, [], suggestedLatencySecs);
s=PsychPortAudio('GetStatus',data.pahandle);
data.sampling_rate=s.SampleRate;

%path
a=uigetdir(pwd);
data.output_folder=a;

set(handles.init_btn,'UserData',data);



function comport_edit_Callback(hObject, eventdata, handles)
% hObject    handle to comport_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comport_edit as text
%        str2double(get(hObject,'String')) returns contents of comport_edit as a double


% --- Executes during object creation, after setting all properties.
function comport_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comport_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function baudrate_edit_Callback(hObject, eventdata, handles)
% hObject    handle to baudrate_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of baudrate_edit as text
%        str2double(get(hObject,'String')) returns contents of baudrate_edit as a double


% --- Executes during object creation, after setting all properties.
function baudrate_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to baudrate_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% hObject    handle to intensity_rate_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of intensity_rate_edit as text
%        str2double(get(hObject,'String')) returns contents of intensity_rate_edit as a double


% --- Executes during object creation, after setting all properties.
function intensity_rate_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to intensity_rate_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_output_edit_Callback(hObject, eventdata, handles)
% hObject    handle to max_output_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_output_edit as text
%        str2double(get(hObject,'String')) returns contents of max_output_edit as a double


% --- Executes during object creation, after setting all properties.
function max_output_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_output_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min_force_edit_Callback(hObject, eventdata, handles)
% hObject    handle to min_force_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min_force_edit as text
%        str2double(get(hObject,'String')) returns contents of min_force_edit as a double


% --- Executes during object creation, after setting all properties.
function min_force_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min_force_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function count_rate_edit_Callback(hObject, eventdata, handles)
% hObject    handle to count_rate_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of count_rate_edit as text
%        str2double(get(hObject,'String')) returns contents of count_rate_edit as a double


% --- Executes during object creation, after setting all properties.
function count_rate_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to count_rate_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start_btn.
function start_btn_Callback(hObject, eventdata, handles)
% hObject    handle to start_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global KEY_IS_PRESSED
%KEY_IS_PRESSED = 0;
%gcf;
%set(gcf,'KeyPressFcn',@myKeyPressFcn);

set(handles.start_btn,'Enable','off');
data=get(handles.init_btn,'UserData');

data.intensity_rate=str2num(get(handles.intensity_rate_edit,'String'));
data.max_voltage=str2num(get(handles.max_output_edit,'String'));
data.vibration_frequency=str2num(get(handles.vibration_edit,'String'));


%bufferdata
stimulus_duration=100/data.intensity_rate
tpx=1:stimulus_duration*data.sampling_rate;
tpx=(tpx-1)/data.sampling_rate;
tpy=sin(2*pi()*data.vibration_frequency*tpx);
tpy=tpy*data.max_voltage;
tpy2=tpx/stimulus_duration;
tpy3=tpy.*tpy2;

plot(handles.axes4,tpx,tpy3);
hold(handles.axes4,'on');
aaa=scatter(handles.axes4,tpx(1),0,'r');
hold(handles.axes4,'off');

bufferdata=[tpy3;tpy3];
PsychPortAudio('DeleteBuffer'); 
PsychPortAudio('FillBuffer',data.pahandle,bufferdata);

%countdown
set(handles.force_txt,'String','3');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','2');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','1');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','START');
drawnow;

PsychPortAudio('Start',data.pahandle,[],0,1);

t1=GetSecs();
while KbCheck==0
      t2=GetSecs();
      set(aaa,'XData',GetSecs()-t1);
      drawnow;
end

%save(filename,'data');
set(handles.start_btn,'Enable','on');
WaitSecs(1);
PsychPortAudio('Stop',data.pahandle);

data.threshold_time=t2-t1;
[a,b]=min(abs(tpx-data.threshold_time));
data.threshold=tpy2(b)

set(handles.force_txt,'String',num2str(data.threshold));

set(handles.init_btn,'UserData',data);

site_str=get(handles.site_popup,'String');
site_str=site_str{get(handles.site_popup,'Value')};
filename=[data.output_folder filesep 'ALGO ' site_str ' ' datestr(now,'yymmdd_HH_MM_SS')];
save(filename,'data');



function myKeyPressFcn(hObject, event)
global KEY_IS_PRESSED
KEY_IS_PRESSED  = 1;
disp('key is pressed')


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in site_popup.
function site_popup_Callback(hObject, eventdata, handles)
% hObject    handle to site_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns site_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from site_popup


% --- Executes during object creation, after setting all properties.
function site_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to site_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vibration_edit_Callback(hObject, eventdata, handles)
% hObject    handle to vibration_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vibration_edit as text
%        str2double(get(hObject,'String')) returns contents of vibration_edit as a double


% --- Executes during object creation, after setting all properties.
function vibration_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vibration_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
