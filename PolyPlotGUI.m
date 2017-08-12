function varargout = PolyPlotGUI(varargin)

%Author: Ishiguro Yoshihiro, Boku Ayaka

% POLYPLOTGUI MATLAB code for PolyPlotGUI.fig
%      POLYPLOTGUI, by itself, creates a new POLYPLOTGUI or raises the existing
%      singleton*.
%
%      H = POLYPLOTGUI returns the handle to a new POLYPLOTGUI or the handle to
%      the existing singleton*.
%
%      POLYPLOTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POLYPLOTGUI.M with the given input arguments.
%
%      POLYPLOTGUI('Property','Value',...) creates a new POLYPLOTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PolyPlotGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PolyPlotGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PolyPlotGUI

% Last Modified by GUIDE v2.5 22-Jun-2017 16:50:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PolyPlotGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @PolyPlotGUI_OutputFcn, ...
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


% --- Executes just before PolyPlotGUI is made visible.
function PolyPlotGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PolyPlotGUI (see VARARGIN)

% Choose default command line output for PolyPlotGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
load('result.mat');
axes(handles.axes1);
% UIWAIT makes PolyPlotGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

for i=1:100;
    display_input(Xval(i,:));
    set(handles.text_Yval,'String',num2str(Yval(i)));
    set(handles.text_Ypred,'String',num2str(Ypred(i)));
pause(2);
end
%global img;
%axes(handles.axes1);
%imshow(img);

% --- Outputs from this function are returned to the command line.
function varargout = PolyPlotGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
