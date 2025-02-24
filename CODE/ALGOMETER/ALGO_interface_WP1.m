function varargout = ALGO_interface(varargin)
% ALGO_INTERFACE MATLAB code for ALGO_interface.fig
%      ALGO_INTERFACE, by itself, creates a new ALGO_INTERFACE or raises the existing
%      singleton*.
%
%      H = ALGO_INTERFACE returns the handle to a new ALGO_INTERFACE or the handle to
%      the existing singleton*.
%
%      ALGO_INTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ALGO_INTERFACE.M with the given input arguments.
%
%      ALGO_INTERFACE('Property','Value',...) creates a new ALGO_INTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ALGO_interface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ALGO_interface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ALGO_interface

% Last Modified by GUIDE v2.5 25-Nov-2022 12:16:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ALGO_interface_OpeningFcn, ...
                   'gui_OutputFcn',  @ALGO_interface_OutputFcn, ...
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


% --- Executes just before ALGO_interface is made visible.
function ALGO_interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ALGO_interface (see VARARGIN)

% Choose default command line output for ALGO_interface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ALGO_interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ALGO_interface_OutputFcn(hObject, eventdata, handles) 
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
comport=get(handles.comport_edit,'String');
baudrate=str2num(get(handles.baudrate_edit,'String'));
ALG=Initialize_Algometer(comport,baudrate);
data.ALG=ALG;
data.force_rate=str2num(get(handles.force_rate_edit,'String'));
data.min_force=str2num(get(handles.min_force_edit,'String'));
data.max_force=str2num(get(handles.max_force_edit,'String'));
data.count_rate=str2num(get(handles.count_rate_edit,'String'));


%path
a=uigetdir(pwd);
data.output_folder=a;

%figure
total_count=(data.max_force*(data.count_rate/data.force_rate))+1;
tpx=1:total_count;
tpx=(tpx-1)/data.count_rate;
tpy=tpx*data.force_rate;
tpy2=zeros(size(tpy))+5;

data.total_count=total_count;
data.tpx=tpx;
data.tpy_force=tpy;
data.tpy_rate=tpy2;

data.force_wave1=plot(handles.axes_force,tpx,tpy,'b');
hold(handles.axes_force,'on');
data.force_wave2=plot(handles.axes_force,tpx,tpy*0,'r');
hold(handles.axes_force,'off');

data.rate_wave1=plot(handles.axes_rate,tpx,tpy2,'b');
hold(handles.axes_rate,'on'); 
data.rate_wave2=plot(handles.axes_rate,tpx,tpy2*0,'r');
hold(handles.axes_rate,'off');

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



function force_rate_edit_Callback(hObject, eventdata, handles)
% hObject    handle to force_rate_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of force_rate_edit as text
%        str2double(get(hObject,'String')) returns contents of force_rate_edit as a double


% --- Executes during object creation, after setting all properties.
function force_rate_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to force_rate_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_force_edit_Callback(hObject, eventdata, handles)
% hObject    handle to max_force_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_force_edit as text
%        str2double(get(hObject,'String')) returns contents of max_force_edit as a double


% --- Executes during object creation, after setting all properties.
function max_force_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_force_edit (see GCBO)
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

%countdown
set(handles.force_txt,'String','30');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','29');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','28');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','27');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','26');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','25');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','24');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','23');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','22');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','21');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','19');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','18');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','17');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','16');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','15');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','14');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','13');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','12');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','11');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','10');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','9');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','8');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','7');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','6');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','5');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','4');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','3');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','2');
drawnow;
WaitSecs(1)
set(handles.force_txt,'String','1');
drawnow;
WaitSecs(1)


junk=Read_Algometer(data.ALG);
tpx=1:6;
tpx=(tpx-1)/data.count_rate;
all_read=[];
all_coeffs=[];
while KbCheck==0
      drawnow
      %disp('looping...')
      read=Read_Algometer(data.ALG);
      all_read=horzcat(all_read,read);
      if isempty(read);
      else
          set(handles.force_txt,'String',num2str(all_read(end)));
          %set(data.force_wave1,'XData',data.tpx(1:length(all_read)));
          %set(data.force_wave1,'YData',data.tpy_force(1:length(all_read)));
          set(data.force_wave2,'XData',data.tpx(1:length(all_read)));
          set(data.force_wave2,'YData',all_read);
          if length(all_read)>5
              tp=all_read(end-5:end);
              coefs=polyfit(tpx,tp,1);
              set(handles.rate_txt,'String',num2str(coefs(1)));
              all_coeffs=[all_coeffs coefs(1)];
              set(data.rate_wave2,'XData',data.tpx(1:length(all_coeffs)));
              set(data.rate_wave2,'YData',all_coeffs);
          end;   
      end;
      drawnow;
end
data.all_read=all_read;
data.force_threshold=data.all_read(end);
set(handles.init_btn,'UserData',data);
site_str=get(handles.site_popup,'String');
site_str=site_str{get(handles.site_popup,'Value')};
filename=[data.output_folder filesep 'ALGO ' site_str ' ' datestr(now,'yymmdd_HH_MM_SS')];
save(filename,'data');
set(handles.start_btn,'Enable','on');



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
