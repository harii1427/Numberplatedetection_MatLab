function varargout = VIEW_DETAILS(varargin)
% VIEW_DETAILS MATLAB code for VIEW_DETAILS.fig
%      VIEW_DETAILS, by itself, creates a new VIEW_DETAILS or raises the existing
%      singleton*.
%
%      H = VIEW_DETAILS returns the handle to a new VIEW_DETAILS or the handle to
%      the existing singleton*.
%
%      VIEW_DETAILS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIEW_DETAILS.M with the given input arguments.
%
%      VIEW_DETAILS('Property','Value',...) creates a new VIEW_DETAILS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VIEW_DETAILS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VIEW_DETAILS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VIEW_DETAILS

% Last Modified by GUIDE v2.5 19-Oct-2013 14:32:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VIEW_DETAILS_OpeningFcn, ...
                   'gui_OutputFcn',  @VIEW_DETAILS_OutputFcn, ...
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


% --- Executes just before VIEW_DETAILS is made visible.
function VIEW_DETAILS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VIEW_DETAILS (see VARARGIN)

% Choose default command line output for VIEW_DETAILS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes VIEW_DETAILS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = VIEW_DETAILS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

global user;
data = regexp(user , '#', 'split');
set(handles.text8,'string',data{1});
set(handles.text9,'string',data{2});
set(handles.text10,'string',data{3});
set(handles.text11,'string',data{4});
set(handles.text12,'string',data{5});
set(handles.text13,'string',data{6});
set(handles.text14,'string',data{7});
pic1=imread (['photos\',data{8}]);
imshow(pic1,'Parent',handles.axes1);
