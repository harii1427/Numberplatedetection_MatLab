function varargout = Number_Plate_Recognition(varargin)
% NUMBER_PLATE_RECOGNITION MATLAB code for Number_Plate_Recognition.fig
%      NUMBER_PLATE_RECOGNITION, by itself, creates a new NUMBER_PLATE_RECOGNITION or raises the existing
%      singleton*.
%
%      H = NUMBER_PLATE_RECOGNITION returns the handle to a new NUMBER_PLATE_RECOGNITION or the handle to
%      the existing singleton*.
%
%      NUMBER_PLATE_RECOGNITION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NUMBER_PLATE_RECOGNITION.M with the given input arguments.
%
%      NUMBER_PLATE_RECOGNITION('Property','Value',...) creates a new NUMBER_PLATE_RECOGNITION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Number_Plate_Recognition_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Number_Plate_Recognition_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Number_Plate_Recognition

% Last Modified by GUIDE v2.5 07-Mar-2014 13:58:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Number_Plate_Recognition_OpeningFcn, ...
                   'gui_OutputFcn',  @Number_Plate_Recognition_OutputFcn, ...
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


% --- Executes just before Number_Plate_Recognition is made visible.
function Number_Plate_Recognition_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Number_Plate_Recognition (see VARARGIN)

% Choose default command line output for Number_Plate_Recognition
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Number_Plate_Recognition wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Number_Plate_Recognition_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in BTNBROWSE.
function BTNBROWSE_Callback(hObject, eventdata, handles)
% hObject    handle to BTNBROWSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fname;
[fn pn] = uigetfile('*.*','Select Image File');
complete = strcat(pn,fn);
img = imread(complete);
fname = complete;
%imshow(img,'Parent',handles.axes2);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global fname;
I = imread (fname);
 imshow(I,'Parent',handles.axes1);
    title(handles.axes1,'Input Image');
% Extract Y component (Convert an Image to Gray)
Igray = rgb2gray(I);
[rows cols] = size(Igray);
%% Dilate and Erode Image in order to remove noise
Idilate = Igray;
for i = 1:rows
for j = 2:cols-1
temp = max(Igray(i,j-1), Igray(i,j));
Idilate(i,j) = max(temp, Igray(i,j+1));
end
end
I = Idilate;
 imshow(I,'Parent',handles.axes2);
    title(handles.axes2,'Gray Image');
imshow(Idilate,'Parent',handles.axes3);
    title(handles.axes3,'Dilated Image');
difference = 0;
sum = 0;
total_sum = 0;
difference = uint32(difference);
%% PROCESS EDGES IN HORIZONTAL DIRECTION
disp('Processing Edges Horizontally...');
max_horz = 0;
maximum = 0;
for i = 2:cols
sum = 0;
for j = 2:rows
if(I(j, i) > I(j-1, i))
difference = uint32(I(j, i) - I(j-1, i));
else
difference = uint32(I(j-1, i) - I(j, i));
end
if(difference > 20)
sum = sum + difference;
end
end
horz1(i) = sum;
% Find Peak Value
if(sum > maximum)
max_horz = i;
maximum = sum;
end
total_sum = total_sum + sum;
end
average = total_sum / cols;
figure(5);
% Plot the Histogram for analysis
subplot(3,1,1);
plot (horz1);
title('Horizontal Edge Processing Histogram');
xlabel('Column Number ->');
ylabel('Difference ->');
%% Smoothen the Horizontal Histogram by applying Low Pass Filter
disp('Passing Horizontal Histogram through Low Pass Filter...');
sum = 0;
horz = horz1;
for i = 21:(cols-21)
sum = 0;
for j = (i-20):(i+20)
sum = sum + horz1(j);
end
horz(i) = sum / 41;
end
subplot(3,1,2);
plot (horz);
title('Histogram after passing through Low Pass Filter');
xlabel('Column Number ->');
ylabel('Difference ->');
%% Filter out Horizontal Histogram Values by applying Dynamic Threshold
disp('Filter out Horizontal Histogram...');
for i = 1:cols
if(horz(i) < average)
horz(i) = 0;
for j = 1:rows
I(j, i) = 0;
end
end
end
subplot(3,1,3);
plot (horz);
title('Histogram after Filtering');
xlabel('Column Number ->');
ylabel('Difference ->');
%% PROCESS EDGES IN VERTICAL DIRECTION
difference = 0;
total_sum = 0;
difference = uint32(difference);
disp('Processing Edges Vertically...');
maximum = 0;
max_vert = 0;
for i = 2:rows
sum = 0;
for j = 2:cols %cols
if(I(i, j) > I(i, j-1))
difference = uint32(I(i, j) - I(i, j-1));
end
if(I(i, j) <= I(i, j-1))
difference = uint32(I(i, j-1) - I(i, j));
end
if(difference > 20)
sum = sum + difference;
end
end
vert1(i) = sum;
%% Find Peak in Vertical Histogram
if(sum > maximum)
max_vert = i;
maximum = sum;
end
total_sum = total_sum + sum;
end
average = total_sum / rows;
figure(6)
subplot(3,1,1);
plot (vert1);
title('Vertical Edge Processing Histogram');
xlabel('Row Number ->');
ylabel('Difference ->');
%% Smoothen the Vertical Histogram by applying Low Pass Filter
disp('Passing Vertical Histogram through Low Pass Filter...');
sum = 0;
vert = vert1;
for i = 21:(rows-21)
sum = 0;
for j = (i-20):(i+20)
sum = sum + vert1(j);
end
vert(i) = sum / 41;
end
subplot(3,1,2);
plot (vert);
title('Histogram after passing through Low Pass Filter');
xlabel('Row Number ->');
ylabel('Difference ->');
%% Filter out Vertical Histogram Values by applying Dynamic Threshold
disp('Filter out Vertical Histogram...');
for i = 1:rows
if(vert(i) < average)
vert(i) = 0;
for j = 1:cols
I(i, j) = 0;
end
end
end
subplot(3,1,3);
plot (vert);
title('Histogram after Filtering');
xlabel('Row Number ->');
ylabel('Difference ->');
imshow(I,'Parent',handles.axes4);
    title(handles.axes4,'Segement Image');

%% Find Probable candidates for Number Plate
j = 1;
for i = 2:cols-2
if(horz(i) ~= 0 && horz(i-1) == 0 && horz(i+1) == 0)
column(j) = i;
column(j+1) = i;
j = j + 2;
elseif((horz(i) ~= 0 && horz(i-1) == 0) || (horz(i) ~= 0 && horz(i+1) == 0))
column(j) = i;
j = j+1;
end
end
j = 1;
for i = 2:rows-2
if(vert(i) ~= 0 && vert(i-1) == 0 && vert(i+1) == 0)
row(j) = i;
row(j+1) = i;
j = j + 2;
elseif((vert(i) ~= 0 && vert(i-1) == 0) || (vert(i) ~= 0 && vert(i+1) == 0))
row(j) = i;
j = j+1;
end
end
[temp column_size] = size (column);
if(mod(column_size, 2))
column(column_size+1) = cols;
end
[temp row_size] = size (row);
if(mod(row_size, 2))
row(row_size+1) = rows;
end
%% Region of Interest Extraction
%Check each probable candidate
for i = 1:2:row_size
for j = 1:2:column_size
% If it is not the most probable region remove it from image
if(~((max_horz >= column(j) && max_horz <= column(j+1)) && (max_vert >=row(i) && max_vert <= row(i+1))))
%This loop is only for displaying proper output to User
for m = row(i):row(i+1)
for n = column(j):column(j+1)
I(m, n) = 0;
end
end
end
end
end
imshow(I,'Parent',handles.axes5);
title(handles.axes5,'Extraction');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fname;
f=imread(fname); % Reading the number plate image.
imshow(f,'Parent',handles.axes1);
    title(handles.axes1,'Input Image');
f=imresize(f,[400 NaN]); % Resizing the image keeping aspect ratio same.
g=rgb2gray(f); % Converting the RGB (color) image to gray (intensity).
imshow(g,'Parent',handles.axes2);
    title(handles.axes2,'Gray Image');
g=medfilt2(g,[3 3]); % Median filtering to remove noise.
imshow(g,'Parent',handles.axes3);
    title(handles.axes3,'Filtered Image');
se=strel('disk',1); % Structural element (disk of radius 1) for morphological processing.
gi=imdilate(g,se); % Dilating the gray image with the structural element.

ge=imerode(g,se); % Eroding the gray image with structural element.

gdiff=imsubtract(gi,ge); % Morphological Gradient for edges enhancement.
gdiff=mat2gray(gdiff); % Converting the class to double.
gdiff=conv2(gdiff,[1 1;1 1]); % Convolution of the double image for brightening the edges.
gdiff=imadjust(gdiff,[0.5 0.7],[0 1],0.1); % Intensity scaling between the range 0 to 1.
B=logical(gdiff); % Conversion of the class from double to binary. 
% Eliminating the possible horizontal lines from the output image of regiongrow
% that could be edges of license plate.
er=imerode(B,strel('line',50,0));
out1=imsubtract(B,er);
% Filling all the regions of the image.
F=imfill(out1,'holes');
imshow(F,'Parent',handles.axes4);
    title(handles.axes4,'Fill Image');
% Thinning the image to ensure character isolation.
H=bwmorph(F,'thin',1);
H=imerode(H,strel('line',3,90));
imshow(H,'Parent',handles.axes5);
    title(handles.axes5,'Erode Image');
% Selecting all the regions that are of pixel area more than 100.
final=bwareaopen(H,100);
% final=bwlabel(final); % Uncomment to make compitable with the previous versions of MATLAB®
% Two properties 'BoundingBox' and binary 'Image' corresponding to these
% Bounding boxes are acquired.
Iprops=regionprops(final,'BoundingBox','Image');
% Selecting all the bounding boxes in matrix of order numberofboxesX4;
NR=cat(1,Iprops.BoundingBox);
% Calling of controlling function.
r=controlling(NR); % Function 'controlling' outputs the array of indices of boxes required for extraction of characters.
if ~isempty(r) % If succesfully indices of desired boxes are achieved.
    I={Iprops.Image}; % Cell array of 'Image' (one of the properties of regionprops)
    noPlate=[]; % Initializing the variable of number plate string.
    for v=1:length(r)
        N=I{1,r(v)}; % Extracting the binary image corresponding to the indices in 'r'.
       if(v==1)
           imshow(N,'Parent',handles.axes6);
       elseif(v==2)   
           imshow(N,'Parent',handles.axes8);
            elseif(v==3)   
           imshow(N,'Parent',handles.axes9);
            elseif(v==4)   
           imshow(N,'Parent',handles.axes10);
            elseif(v==5)   
           imshow(N,'Parent',handles.axes11);
            elseif(v==6)   
           imshow(N,'Parent',handles.axes12);
       end
        letter=readLetter(N); % Reading the letter corresponding the binary image 'N'.
        while letter=='O' || letter=='0' % Since it wouldn't be easy to distinguish
            if v<=3                      % between '0' and 'O' during the extraction of character
                letter='O';              % in binary image. Using the characteristic of plates in Karachi
            else                         % that starting three characters are alphabets, this code will
                letter='0';              % easily decide whether it is '0' or 'O'. The condition for 'if'
            end                          % just need to be changed if the code is to be implemented with some other
            break;                       % cities plates. The condition should be changed accordingly.
        end
        noPlate=[noPlate letter]; % Appending every subsequent character in noPlate variable.
    end
    
    set(handles.res,'string',noPlate);
    
%     fileID = fopen('C:\myfile.txt','w');
% fprintf(fileID,noPlate)
% fclose(fileID); 
    
    fid = fopen('db');
tline = fgets(fid);
temp = '';
while ischar(tline)
    temp =  [temp,' ',tline,' '];
    tline = fgets(fid);
end
fclose(fid);
pieces = regexp(temp , '@', 'split');
global user;
n = true;
for i= 1: length(pieces) - 1
   details = pieces{i};
   data = regexp(details , '#', 'split');
   length(data)
   n1 = data{6};
   
   
   m1 = noPlate;
   
  if(strcmp(n1,m1))
       user = details;
       n = false;
   else
      
   end    
   
end
if(n)
   msgbox ('Car Number doesnt match with Database..') ;
else
    VIEW_DETAILS
end

    

%     fid = fopen('noPlate.txt', 'wt'); % This portion of code writes the number plate
%     fprintf(fid,'%s\n',noPlate);      % to the text file, if executed a notepad file with the
%     fclose(fid);                      % name noPlate.txt will be open with the number plate written.
%     winopen('noPlate.txt')
%     
% %     Uncomment the portion of code below if Database is  to be organized. Since my
% %     project requires database so I have written this code. DB is the .mat
% %     file containing the array of structure of all entries of database.
% %     load DB
% %     for x=1:length(DB)
% %         recordplate=getfield(DB,{1,x},'PlateNumber');
% %         if strcmp(noPlate,recordplate)
% %             disp(DB(x));
% %             disp('*-*-*-*-*-*-*');
% %         end
% %     end
    
else % If fail to extract the indexes in 'r' this line of error will be displayed.
    fprintf('Unable to extract the characters from the number plate.\n');
    fprintf('The characters on the number plate might not be clear or touching with each other or boundries.\n');
end



function res_Callback(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of res as text
%        str2double(get(hObject,'String')) returns contents of res as a double


% --- Executes during object creation, after setting all properties.
function res_CreateFcn(hObject, eventdata, handles)
% hObject    handle to res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
