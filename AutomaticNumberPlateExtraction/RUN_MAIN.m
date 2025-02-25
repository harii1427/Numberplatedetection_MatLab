function varargout = RUN_MAIN(varargin)
% RUN_MAIN MATLAB code for RUN_MAIN.fig
%      RUN_MAIN, by itself, creates a new RUN_MAIN or raises the existing
%      singleton*.
%
%      H = RUN_MAIN returns the handle to a new RUN_MAIN or the handle to
%      the existing singleton*.
%
%      RUN_MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RUN_MAIN.M with the given input arguments.
%
%      RUN_MAIN('Property','Value',...) creates a new RUN_MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RUN_MAIN_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RUN_MAIN_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RUN_MAIN

% Last Modified by GUIDE v2.5 16-Feb-2017 13:57:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RUN_MAIN_OpeningFcn, ...
                   'gui_OutputFcn',  @RUN_MAIN_OutputFcn, ...
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


% --- Executes just before RUN_MAIN is made visible.
function RUN_MAIN_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RUN_MAIN (see VARARGIN)

% Choose default command line output for RUN_MAIN
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RUN_MAIN wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RUN_MAIN_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ADD_DETAILS

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Number_Plate_Recognition


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
WEBCAM_CAPTURE
