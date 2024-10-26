function varargout = ADD_DETAILS(varargin)
% ADD_DETAILS MATLAB code for ADD_DETAILS.fig
%      ADD_DETAILS, by itself, creates a new ADD_DETAILS or raises the existing
%      singleton*.
%
%      H = ADD_DETAILS returns the handle to a new ADD_DETAILS or the handle to
%      the existing singleton*.
%
%      ADD_DETAILS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADD_DETAILS.M with the given input arguments.
%
%      ADD_DETAILS('Property','Value',...) creates a new ADD_DETAILS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ADD_DETAILS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ADD_DETAILS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ADD_DETAILS

% Last Modified by GUIDE v2.5 19-Oct-2013 11:44:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ADD_DETAILS_OpeningFcn, ...
                   'gui_OutputFcn',  @ADD_DETAILS_OutputFcn, ...
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


% --- Executes just before ADD_DETAILS is made visible.
function ADD_DETAILS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ADD_DETAILS (see VARARGIN)

% Choose default command line output for ADD_DETAILS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ADD_DETAILS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ADD_DETAILS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function pname_Callback(hObject, eventdata, handles)
% hObject    handle to pname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pname as text
%        str2double(get(hObject,'String')) returns contents of pname as a double


% --- Executes during object creation, after setting all properties.
function pname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in page.
function page_Callback(hObject, eventdata, handles)
% hObject    handle to page (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns page contents as cell array
%        contents{get(hObject,'Value')} returns selected item from page


% --- Executes during object creation, after setting all properties.
function page_CreateFcn(hObject, eventdata, handles)
% hObject    handle to page (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pqual.
function pqual_Callback(hObject, eventdata, handles)
% hObject    handle to pqual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pqual contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pqual


% --- Executes during object creation, after setting all properties.
function pqual_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pqual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pdest.
function pdest_Callback(hObject, eventdata, handles)
% hObject    handle to pdest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pdest contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pdest


% --- Executes during object creation, after setting all properties.
function pdest_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pdest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pcontact_Callback(hObject, eventdata, handles)
% hObject    handle to pcontact (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pcontact as text
%        str2double(get(hObject,'String')) returns contents of pcontact as a double


% --- Executes during object creation, after setting all properties.
function pcontact_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pcontact (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function paddress_Callback(hObject, eventdata, handles)
% hObject    handle to paddress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of paddress as text
%        str2double(get(hObject,'String')) returns contents of paddress as a double


% --- Executes during object creation, after setting all properties.
function paddress_CreateFcn(hObject, eventdata, handles)
% hObject    handle to paddress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global photopath;
global photoname;
[fn pn] = uigetfile('*.*','Select Image File');
complete = strcat(pn,fn);
photopath = complete;
photoname = fn;
pic1=imread (complete);
imshow(pic1,'Parent',handles.axes1);
title(handles.axes1,'Photo');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gender;
global photopath;
global photoname;
global earprint ;
name =  get(handles.pname,'String');
ageid = get(handles.page, 'value');
age = ageid + 17;
Qualification={'B.SC','B.COM','BCA','BBA','BE','MCA','M.SC','ME','M.TECH','MBA'}; 
M = get(handles.pqual, 'value');
qual=char(Qualification(M));
dest = {'PROGRAMMER','TEAM LEADER','PROJECT MANAGER','ASS.PRO MANAGER','TRAINEE','TRAINER'};
M = get(handles.pdest, 'value');
design=char(dest(M));
contactno=  get(handles.pcontact,'String');
address =  get(handles.paddress,'String');
copyfile(photopath,['photos\']);
Details = [name,'#',num2str(age),'#',qual,'#',design,'#',gender,'#',contactno,'#',address,'#',photoname,'#','@'];
fid = fopen('db','a');
fprintf(fid,Details);
fclose(fid);
msgbox('Added Successfully');
fid = fopen('db');
tline = fgets(fid);
temp = '';
while ischar(tline)
    temp =  [temp,' ',tline,' '];
    tline = fgets(fid);
end
fclose(fid);


% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
global gender;
if(hObject == handles.pmale)
    gender = 'Male';
else
     gender = 'Female';
    
end
