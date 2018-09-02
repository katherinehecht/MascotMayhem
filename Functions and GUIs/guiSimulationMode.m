function varargout = guiSimulationMode(varargin)
% GUISIMULATIONMODE MATLAB code for guiSimulationMode.fig
%      GUISIMULATIONMODE, by itself, creates a new GUISIMULATIONMODE or raises the existing
%      singleton*.
%
%      H = GUISIMULATIONMODE returns the handle to a new GUISIMULATIONMODE or the handle to
%      the existing singleton*.
%
%      GUISIMULATIONMODE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUISIMULATIONMODE.M with the given input arguments.
%
%      GUISIMULATIONMODE('Property','Value',...) creates a new GUISIMULATIONMODE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiSimulationMode_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiSimulationMode_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiSimulationMode

% Last Modified by GUIDE v2.5 25-Apr-2017 12:58:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiSimulationMode_OpeningFcn, ...
                   'gui_OutputFcn',  @guiSimulationMode_OutputFcn, ...
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


% --- Executes just before guiSimulationMode is made visible.
function guiSimulationMode_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiSimulationMode (see VARARGIN)

% Choose default command line output for guiSimulationMode
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiSimulationMode wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiSimulationMode_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in charSelectPop1.
function charSelectPop1_Callback(hObject, eventdata, handles)
% hObject    handle to charSelectPop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns charSelectPop1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from charSelectPop1


% --- Executes during object creation, after setting all properties.
function charSelectPop1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to charSelectPop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in charSelectPop2.
function charSelectPop2_Callback(hObject, eventdata, handles)
% hObject    handle to charSelectPop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns charSelectPop2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from charSelectPop2


% --- Executes during object creation, after setting all properties.
function charSelectPop2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to charSelectPop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in stratChoosePop1.
function stratChoosePop1_Callback(hObject, eventdata, handles)
% hObject    handle to stratChoosePop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns stratChoosePop1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from stratChoosePop1


% --- Executes during object creation, after setting all properties.
function stratChoosePop1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stratChoosePop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in stratChoosePop2.
function stratChoosePop2_Callback(hObject, eventdata, handles)
% hObject    handle to stratChoosePop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns stratChoosePop2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from stratChoosePop2


% --- Executes during object creation, after setting all properties.
function stratChoosePop2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stratChoosePop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numSimText_Callback(hObject, eventdata, handles)
% hObject    handle to numSimText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numSimText as text
%        str2double(get(hObject,'String')) returns contents of numSimText as a double


% --- Executes during object creation, after setting all properties.
function numSimText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numSimText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in GoPush.
function GoPush_Callback(hObject, eventdata, handles)
% hObject    handle to GoPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
startup;
dontrun = 0; % don't run variable
handles.ErrorMsgText.String = ' ';

% set player1 character
switch handles.charSelectPop1.Value
    case 1
        handles.ErrorMsgText.String = 'Please select character 1';
        dontrun = 1;
    case 2
        player1 = ans.purpleWeasel;
    case 3
        player1 = ans.duck;
    case 4
        player1 = ans.angryMob;
    case 5
        player1 = ans.zahmbie;
    case 6
        player1 = ans.gentleman;
    case 7
        player1 = ans.juggerknott;
    case 8
        player1 = ans.bear;
    case 9
        player1 = ans.lion;
    case 10
        player1 = ans.marsRover;
    case 11
        player1 = ans.drSeelinger;
end % switch statement

% set player2 character
switch handles.charSelectPop2.Value
    case 1
        handles.ErrorMsgText.String = 'Please select character 2';
        dontrun = 1;
    case 2
        player2 = ans.purpleWeasel;
    case 3
        player2 = ans.duck;
    case 4
        player2 = ans.angryMob;
    case 5
        player2 = ans.zahmbie;
    case 6
        player2 = ans.gentleman;
    case 7
        player2 = ans.juggerknott;
    case 8
        player2 = ans.bear;
    case 9
        player2 = ans.lion;
    case 10
        player2 = ans.marsRover;
    case 11
        player2 = ans.drSeelinger;
end % switch statement

% set strategy of player 1
switch handles.stratChoosePop1.Value
    case 1
        handles.ErrorMsgText.String = 'Please select strategy 1';
        dontrun = 1;
    case 2
        player1.strategy = 'coward';
    case 3
        player1.strategy = 'flee';
    case 4
        player1.strategy = 'passive';
    case 5
        player1.strategy = 'neutral';
    case 6
        player1.strategy = 'active';
    case 7
        player1.strategy = 'suicidal';
end % switch statement

% set strategy of player2
switch handles.stratChoosePop2.Value
    case 1
        handles.ErrorMsgText.String = 'Please select strategy 2';
        dontrun = 1;
    case 2
        player2.strategy = 'coward';
    case 3
        player2.strategy = 'flee';
    case 4
        player2.strategy = 'passive';
    case 5
        player2.strategy = 'neutral';
    case 6
        player2.strategy = 'active';
    case 7
        player2.strategy = 'suicidal';
end % switch statement

% establish win counters for both players
player1winCount = 0;
player2winCount = 0;

% run simulation numSimText times if dont run is false
if dontrun == 0
    % add waitbar utilizing the simulation text
    Nt = str2double(handles.numSimText.String);
    hwb = waitbar(0,'Battle Commencing', 'Name', 'Progress');
    for iSim = 1:str2double(handles.numSimText.String)
        [winner,handles] = battleF(handles,player1,player2);
        % increment win counters based on who won
        if winner == 1
            player1winCount = player1winCount + 1;
        else
            player2winCount = player2winCount + 1;
        end % if winner = 1;
        waitbar(iSim/Nt, hwb);
    end % or iSim = 1:str2double(handles.numSimText.String)
    close(hwb);
    
    % update player 1 win percentage string
    handles.player1winPctText.String = num2str(100*player1winCount/str2double(handles.numSimText.String));
    
    % update player 2 win percentage string
    handles.player2WinPctText.String = num2str(100*player2winCount/str2double(handles.numSimText.String));
end % dontrun = 0;


        


% --- Executes on button press in ExitButton.
function ExitButton_Callback(hObject, eventdata, handles)
% hObject    handle to ExitButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
