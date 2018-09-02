function varargout = GameTool(varargin)
% GAMETOOL MATLAB code for GameTool.fig
%      GAMETOOL, by itself, creates a new GAMETOOL or raises the existing
%      singleton*.
%
%      H = GAMETOOL returns the handle to a new GAMETOOL or the handle to
%      the existing singleton*.
%
%      GAMETOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAMETOOL.M with the given input arguments.
%
%      GAMETOOL('Property','Value',...) creates a new GAMETOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GameTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GameTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GameTool

% Last Modified by GUIDE v2.5 22-Mar-2017 20:18:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GameTool_OpeningFcn, ...
                   'gui_OutputFcn',  @GameTool_OutputFcn, ...
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


% --- Executes just before GameTool is made visible.
function GameTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GameTool (see VARARGIN)

% Choose default command line output for GameTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GameTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% The startup function is called and states is passed to the GUI program.
% We save states in a file because otherwise the whole variable will
% disappear after GameTool_OpeningFcn runs.
clc

states = startup; % Initialize the 'states' structured variable using the
% startup function

save('statesData','states'); % Save states as statesData.mat

% Change the numbers on the statistics displays to their true values for
% the player
[states,handles] = updateGUI(states,handles);
giantMapDisplayF(handles);


% --- Outputs from this function are returned to the command line.
function varargout = GameTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in quitButton.
function quitButton_Callback(hObject, eventdata, handles)
% hObject    handle to quitButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close all; % Closes the GUI window (stops the program)

% --- Executes on button press in attackButton.
function attackButton_Callback(hObject, eventdata, handles)
% hObject    handle to attackButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load('statesData');

% If the player is in an encounter, it will execute the attack function.
if states.inEncounter
    [states,handles] = attack(states,handles);
    
    
% If the player is in the open world
else
    
    seelingerBump = false; % If this remains false, then the player
    % has not bumped into Dr. Seelinger before he has become
    % available. If the player has done this, however, then the
    % console will not say that the player is not on top of an
    % encounter.
    
    deadEncBump = false; % Dead encounter bump; if this remains false, then
    % the player has not attempted to enter an encounter which he has
    % already killed. 
    
    % For loop checks to see if the player is on top of an encounter square
    for i=1:16
        if states.player.pos == states.positions{i}
            states.inEncounter = true; % Signals that the player has
            % entered the encounter
            
            states.inBonus = false;
            % Sets the default to "not in bonus"
            
            % currentEncounter is a variable that holds the information
            % about the encounter that the player is attacking. It is
            % easier to tell other functions which encounter's health,
            % defense, etc. must change if we store that encounter in this
            % variable.
            switch i
                case 1
                    states.currentEncounter = states.purpleWeasel;
                    if states.currentEncounter.health <= 0
                        states.inEncounter = false;
                        deadEncBump = true;
                        console('You have already finished this encounter.',handles);
                    else
                        states.currentEncounter.name = 'Purple Weasel';
                        console('You have encountered the Purple Weasel!',handles);
                    end
                case 2
                    states.currentEncounter = states.duck;
                    if states.currentEncounter.health <= 0
                        states.inEncounter = false;
                        deadEncBump = true;
                        console('You have already finished this encounter.',handles);
                    else
                        states.currentEncounter.name = 'Duck';
                        console('You have encountered the Duck!',handles);
                    end
                case 3
                    states.currentEncounter = states.angryMob;
                    if states.currentEncounter.health <= 0
                        states.inEncounter = false;
                        deadEncBump = true;
                        console('You have already finished this encounter.',handles);
                    else
                        states.currentEncounter.name = 'Angry Mob';
                        console('You have encountered the Angry Mob!',handles);
                    end
                case 4
                    states.currentEncounter = states.zahmbie;
                    if states.currentEncounter.health <= 0
                        states.inEncounter = false;
                        deadEncBump = true;
                        console('You have already finished this encounter.',handles);
                    else
                        states.currentEncounter.name = 'Zahmbie';
                        console('You have encountered the Zahmbie!',handles);
                    end
                case 5
                    states.currentEncounter = states.gentleman;
                    if states.currentEncounter.health <= 0
                        states.inEncounter = false;
                        deadEncBump = true;
                        console('You have already finished this encounter.',handles);
                    else
                        states.currentEncounter.name = 'Gentleman';
                        console('You have encountered the Gentleman!',handles);
                    end
                case 6
                    states.currentEncounter = states.juggerknott;
                    if states.currentEncounter.health <= 0
                        states.inEncounter = false;
                        deadEncBump = true;
                        console('You have already finished this encounter.',handles);
                    else
                        states.currentEncounter.name = 'Juggerknott';
                        console('You have encountered the Juggerknott!',handles);
                    end
                case 7
                    states.currentEncounter = states.bear;
                    if states.currentEncounter.health <= 0
                        states.inEncounter = false;
                        deadEncBump = true;
                        console('You have already finished this encounter.',handles);
                    else
                        states.currentEncounter.name = 'Bear';
                        console('You have encountered the Bear!',handles);
                    end
                case 8
                    states.currentEncounter = states.lion;
                    if states.currentEncounter.health <= 0
                        states.inEncounter = false;
                        deadEncBump = true;
                        console('You have already finished this encounter.',handles);
                    else
                        states.currentEncounter.name = 'Lion';
                        console('You have encountered the Lion!',handles);
                    end
                case 9
                    states.currentEncounter = states.marsRover;
                    if states.currentEncounter.health <= 0
                        states.inEncounter = false;
                        deadEncBump = true;
                        console('You have already finished this encounter.',handles);
                    else
                        states.currentEncounter.name = 'Mars Rover';
                        console('You have encountered the Mars Rover!',handles);
                    end
                case 10
                    % You can only encounter Dr. Seelinger if the Mars
                    % Rover has been defeated.
                    if states.marsRover.health <= 0
                        states.currentEncounter = states.drSeelinger;
                        states.currentEncounter.name = 'Dr. Seelinger';
                        console('You have encountered Dr. Seelinger!',handles);
                        pause(1);
                        console('"You have destroyed my creation..."',handles);
                        pause(1);
                        console('"...and now I will destroy you!"',handles);
                        pause(1);
                        console('"There can only be one protagonist in this story!"',handles);
                    
                    else
                        console('You bump into Dr. Seelinger...',handles);
                        pause(1);
                        console('"Watch where you''re going, punk!"',handles);
                        pause(1);
                        console('"Do you even know who I am?"',handles);
                        pause(1);
                        console('"Do you even understand my level of prestige?"',handles);
                        pause(1);
                        console('"Get out of my face before I demolish you."',handles);
                        pause(2);
                        console('...',handles);
                        pause(1);
                        console('You will have to come back later.',handles);
                        
                        seelingerBump = true; % If this is true, then the console
                        % does not display that you are not on top of an
                        % encounter.
                        states.inEncounter = false;
                        
                    end
                case 11
                    [states, handles] = bonus1(states, handles);
                    states.inEncounter = false;
                    states.inBonus = true;
                case 12
                    [states, handles] = bonus1(states, handles);
                    states.inEncounter = false;
                    states.inBonus = true;
                case 13
                    [states, handles] = bonus1(states, handles);
                    states.inEncounter= false;
                    states.inBonus = true;
                case 14
                    [states, handles] = bonus1(states, handles);
                    states.inEncounter = false;
                    states.inBonus = true;
                case 15
                    [states, handles] = bonus1(states, handles);
                    states.inEncounter = false;
                    states.inBonus = true;
                case 16
                    [states, handles] = bonus1(states, handles);
                    states.inEncounter = false;
                    states.inBonus = true;
            end
            
            % If you have successfully entered an encounter
            if states.inEncounter
                
                handles.nameTxt.String = states.currentEncounter.name;
                handles.encHealthTxt.String = [num2str(states.currentEncounter.health),...
                    '/',num2str(states.currentEncounter.maxHealth)];
                
                % Determine who moves first
                if states.player.speed > states.currentEncounter.speed
                    states.playerTurn = 1; % Player goes first
                    states.encounterTurn = 0;
                elseif states.player.speed < states.currentEncounter.speed
                    states.playerTurn = 0; % Player goes second
                    states.encounterTurn = 1;
                else
                    states.playerTurn = randi(2) - 1;
                    states.encounterTurn = 1-states.playerTurn;
                end
                
                % Display who moves first. If the player moves second, then
                % the enemy plays its turn.
                if states.playerTurn == 1
                    console('You have first move!',handles);
                else
                    console('Your opponent has first move!',handles);
                    [states,handles] = playerMoveG(states,handles);
                    states.encounterTurn = states.encounterTurn + 1;
                
                end
                encounterBoardF(handles); 
            end
            
        end
    end
    
    % If the player is still not considered to be in an encounter after the
    % for loop runs, then he will not enter any encounter and the console
    % relays this information.
    if ~states.inEncounter && ~seelingerBump && ~states.inBonus && ~deadEncBump
        handles = console('You are not on top of an encounter',handles);
    end
    states.inBonus = false;
end

if states.player.movesRemaining < 1
    if states.inEncounter
        states.playerTurn = states.playerTurn + 1;
        console('Your turn has ended.',handles);
        pause(0.5);
        [states,handles] = playerMoveG(states,handles);
    end
end

[states,handles] = updateGUI(states,handles);

save('statesData','states');
if states.inEncounter~=0

    encounterBoardF(handles);
characterDisplayFG(handles,0,0,states.player.encounterPos(1),states.player.encounterPos(2));

if strcmp(states.currentEncounter.name,'Purple Weasel')

characterDisplayFG(handles,1,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Duck')

characterDisplayFG(handles,2,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Angry Mob')

characterDisplayFG(handles,3,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Zahmbie')

characterDisplayFG(handles,4,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Gentleman')

characterDisplayFG(handles,5,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Juggerknott')

characterDisplayFG(handles,6,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Bear')

characterDisplayFG(handles,7,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Lion')

characterDisplayFG(handles,8,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Mars Rover')

characterDisplayFG(handles,9,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Dr. Seelinger')

characterDisplayFG(handles,10,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
end

% --- Executes on button press in dUpButton.
function dUpButton_Callback(hObject, eventdata, handles)
% hObject    handle to dUpButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load('statesData');
[states,handles] = dUp(states,handles);

if states.player.movesRemaining < 1
    states.playerTurn = states.playerTurn + 1;
    console('Your turn has ended.',handles);
    if states.inEncounter
        if states.player.health + states.player.healRate <= states.player.maxHealth
            states.player.health = states.player.health + states.player.healRate;
        else
            states.player.health = states.player.maxHealth;
        end
    end
    pause(0.5);
    [states,handles] = playerMoveG(states,handles);
    
end


states.player.defense = states.player.baseDefense;

[states,handles] = updateGUI(states,handles);
save('statesData','states');
if states.inEncounter~=0

    encounterBoardF(handles);
characterDisplayFG(handles,0,0,states.player.encounterPos(1),states.player.encounterPos(2));

if strcmp(states.currentEncounter.name,'Purple Weasel')

characterDisplayFG(handles,1,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Duck')

characterDisplayFG(handles,2,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Angry Mob')

characterDisplayFG(handles,3,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Zahmbie')

characterDisplayFG(handles,4,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Gentleman')

characterDisplayFG(handles,5,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Juggerknott')

characterDisplayFG(handles,6,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Bear')

characterDisplayFG(handles,7,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Lion')

characterDisplayFG(handles,8,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Mars Rover')

characterDisplayFG(handles,9,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Dr. Seelinger')

characterDisplayFG(handles,10,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
end

% --- Executes on button press in upButton.
function upButton_Callback(hObject, eventdata, handles)
% hObject    handle to upButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% We load states, move the player up, and then save states.
load('statesData');
[states,handles] = moveUp(states,handles);
[states,handles] = updateGUI(states,handles);

if states.player.movesRemaining < 1 && states.inEncounter
    states.playerTurn = states.playerTurn + 1;
    console('Your turn has ended.',handles);
    pause(0.5);
    [states,handles] = playerMoveG(states,handles);
    
end

% animations here

[states,handles] = updateGUI(states,handles);

save('statesData','states');
if states.inEncounter==0
giantMapDisplayF(handles);
else 
    encounterBoardF(handles);
characterDisplayFG(handles,0,0,states.player.encounterPos(1),states.player.encounterPos(2));

if strcmp(states.currentEncounter.name,'Purple Weasel')

characterDisplayFG(handles,1,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Duck')

characterDisplayFG(handles,2,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Angry Mob')

characterDisplayFG(handles,3,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Zahmbie')

characterDisplayFG(handles,4,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Gentleman')

characterDisplayFG(handles,5,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Juggerknott')

characterDisplayFG(handles,6,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Bear')

characterDisplayFG(handles,7,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Lion')

characterDisplayFG(handles,8,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Mars Rover')

characterDisplayFG(handles,9,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Dr. Seelinger')

characterDisplayFG(handles,10,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
end
% --- Executes on button press in rightButton.
function rightButton_Callback(hObject, eventdata, handles)
% hObject    handle to rightButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% We load states, move the player to the right, and then save states.
load('statesData');
[states,handles] = moveRight(states,handles);
[states,handles] = updateGUI(states,handles);

if states.player.movesRemaining < 1 && states.inEncounter
    states.playerTurn = states.playerTurn + 1;
    console('Your turn has ended.',handles);
    pause(0.5);
    [states,handles] = playerMoveG(states,handles);
    
end

[states,handles] = updateGUI(states,handles);

save('statesData','states');
if states.inEncounter==0
giantMapDisplayF(handles);else 
    encounterBoardF(handles);
characterDisplayFG(handles,0,0,states.player.encounterPos(1),states.player.encounterPos(2));

if strcmp(states.currentEncounter.name,'Purple Weasel')

characterDisplayFG(handles,1,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Duck')

characterDisplayFG(handles,2,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Angry Mob')

characterDisplayFG(handles,3,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Zahmbie')

characterDisplayFG(handles,4,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Gentleman')

characterDisplayFG(handles,5,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Juggerknott')

characterDisplayFG(handles,6,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Bear')

characterDisplayFG(handles,7,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Lion')

characterDisplayFG(handles,8,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Mars Rover')

characterDisplayFG(handles,9,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Dr. Seelinger')

characterDisplayFG(handles,10,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
end

% --- Executes on button press in downButton.
function downButton_Callback(hObject, eventdata, handles)
% hObject    handle to downButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% We load states, move the player down, and then save states.
load('statesData');
[states,handles] = moveDown(states,handles);
[states,handles] = updateGUI(states,handles);

if states.player.movesRemaining < 1 && states.inEncounter
    states.playerTurn = states.playerTurn + 1;
    console('Your turn has ended.',handles);
    pause(0.5);
    [states,handles] = playerMoveG(states,handles);
    
end

[states,handles] = updateGUI(states,handles);

save('statesData','states');
if states.inEncounter==0
giantMapDisplayF(handles);
else 
    encounterBoardF(handles);
characterDisplayFG(handles,0,0,states.player.encounterPos(1),states.player.encounterPos(2));

if strcmp(states.currentEncounter.name,'Purple Weasel')

characterDisplayFG(handles,1,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Duck')

characterDisplayFG(handles,2,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Angry Mob')

characterDisplayFG(handles,3,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Zahmbie')

characterDisplayFG(handles,4,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Gentleman')

characterDisplayFG(handles,5,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Juggerknott')

characterDisplayFG(handles,6,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Bear')

characterDisplayFG(handles,7,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Lion')

characterDisplayFG(handles,8,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Mars Rover')

characterDisplayFG(handles,9,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Dr. Seelinger')

characterDisplayFG(handles,10,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
end

% --- Executes on button press in leftButton.
function leftButton_Callback(hObject, eventdata, handles)
% hObject    handle to leftButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% We load states, move the player to the left, and then save states.
load('statesData');
[states,handles] = moveLeft(states,handles);
[states,handles] = updateGUI(states,handles);

if states.player.movesRemaining < 1 && states.inEncounter
    states.playerTurn = states.playerTurn + 1;
    console('Your turn has ended.',handles);
    pause(0.5);
    [states,handles] = playerMoveG(states,handles);
end

[states,handles] = updateGUI(states,handles);

save('statesData','states');
if states.inEncounter==0
giantMapDisplayF(handles);
else 
    encounterBoardF(handles);
characterDisplayFG(handles,0,0,states.player.encounterPos(1),states.player.encounterPos(2));

if strcmp(states.currentEncounter.name,'Purple Weasel')

characterDisplayFG(handles,1,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Duck')

characterDisplayFG(handles,2,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Angry Mob')

characterDisplayFG(handles,3,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Zahmbie')

characterDisplayFG(handles,4,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Gentleman')

characterDisplayFG(handles,5,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Juggerknott')

characterDisplayFG(handles,6,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Bear')

characterDisplayFG(handles,7,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Lion')

characterDisplayFG(handles,8,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
if strcmp(states.currentEncounter.name,'Mars Rover')

characterDisplayFG(handles,9,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end

if strcmp(states.currentEncounter.name,'Dr. Seelinger')

characterDisplayFG(handles,10,0,states.currentEncounter.encounterPos(1), states.currentEncounter.encounterPos(2));
end
end