encounterBoardF.m

axis (handles.display,'xy');
axis (handles.display,'equal');
grid (handles.display,'off');
axis (handles.display,'off')
axis (handles.display,[0,14,0,14]);
hax = gca;


load('statesData');
%player.pos(1),states.player.pos(2);
board= 0;


if states.player.pos(1)<26 && states.player.pos(2)<26
background1 = imread('Capture.PNG');
board = 1;
end 

if states.player.pos(1)<26 && states.player.pos(2)>25
background1 = imread('SAND.PNG');
board = 2;
end 

if states.player.pos(1)>25 && states.player.pos(2)<26
background1 = imread('SNOW.png');
board = 3;
end 

if states.player.pos(1)>25 && states.player.pos(2)>25
background1 = imread('SNOW.png');
board= 4;

end 
backgroundp = characterImageProcess (background1);

backImage = image('CData',backgroundp);

backImage.XData = [0,14];
backImage.YData = [0,14];
