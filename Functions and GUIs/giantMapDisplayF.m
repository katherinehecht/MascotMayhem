function giantMapDisplayF(handles)

load('statesData');
%player.pos(1),states.player.pos(2);
board= 0;


if states.player.pos(1)<26 && states.player.pos(2)<26
background1 = imread('giantMap1.PNG');
board = 1;
end 

if states.player.pos(1)<26 && states.player.pos(2)>25
background1 = imread('giantMap2.PNG');
board = 2;
end 

if states.player.pos(1)>25 && states.player.pos(2)<26
background1 = imread('giantMap3.PNG');
board = 3;
end 

if states.player.pos(1)>25 && states.player.pos(2)>25
background1 = imread('giantMap4.PNG');
board= 4;

end 
backgroundp = characterImageProcess (background1);




%% Create axes

axis (handles.display,'xy');
axis (handles.display,'equal');
grid (handles.display,'off');
axis (handles.display,'off')
axis (handles.display,[0,25,0,25]);
hax = gca;



backImage = image(handles.display,'CData',backgroundp);

backImage.XData = [0,25];
backImage.YData = [0,25];

characterDisplayF(handles,0,0,states.player.pos(1),states.player.pos(2));

load('statesData');

Weaselx= states.purpleWeasel.pos(1);
Weasely = states.purpleWeasel.pos(2);
if OnGiantBoardF(board,Weaselx,Weasely)
characterDisplayF(handles,1,0,Weaselx,Weasely);
end

load('statesData');

duckx= states.duck.pos(1);
ducky = states.duck.pos(2);
if OnGiantBoardF(board,duckx,ducky)
characterDisplayF(handles,2,0,duckx,ducky);
end

load('statesData');

angryMobx= states.angryMob.pos(1);
angryMoby = states.angryMob.pos(2);
if OnGiantBoardF(board,angryMobx,angryMoby)
characterDisplayF(handles,3,0,angryMobx,angryMoby);
end

load('statesData');

zahmbiex= states.zahmbie.pos(1);
zahmbiey = states.zahmbie.pos(2);
if OnGiantBoardF(board,zahmbiex,zahmbiey)
characterDisplayF(handles,4,0,zahmbiex,zahmbiey);
end

load('statesData');

gentlemanx= states.gentleman.pos(1);
gentlemany = states.gentleman.pos(2);
if OnGiantBoardF(board,gentlemanx,gentlemany)
characterDisplayF(handles,5,0,gentlemanx,gentlemany);
end

load('statesData');

juggerknottx= states.juggerknott.pos(1);
juggerknotty = states.juggerknott.pos(2);
if OnGiantBoardF(board,juggerknottx,juggerknotty)
characterDisplayF(handles,6,0,juggerknottx,juggerknotty);
end

load('statesData');

bearx= states.bear.pos(1);
beary = states.bear.pos(2);
if OnGiantBoardF(board,bearx,beary)
characterDisplayF(handles,7,0,bearx,beary);
end

load('statesData');

lionx= states.lion.pos(1);
liony = states.lion.pos(2);
if OnGiantBoardF(board,lionx,liony)
characterDisplayF(handles,8,0,lionx,liony);
end

load('statesData');

marsRoverx= states.marsRover.pos(1);
marsRovery = states.marsRover.pos(2);
if OnGiantBoardF(board,marsRoverx,marsRovery)
characterDisplayF(handles,9,0,marsRoverx,marsRovery);
end

load('statesData');

drSeelingerRoverx= states.drSeelinger.pos(1);
drSeelingerRovery = states.drSeelinger.pos(2);
if OnGiantBoardF(board,drSeelingerRoverx,drSeelingerRovery)
characterDisplayF(handles,10,0,drSeelingerRoverx,drSeelingerRovery);
end
load('statesData');

bonus1x= states.bonus1.pos(1);
bonus1y = states.bonus1.pos(2);
if OnGiantBoardF(board,bonus1x,bonus1y)
characterDisplayF(handles,11,0,bonus1x,bonus1y);
end

load('statesData');

bonus2x= states.bonus2.pos(1);
bonus2y = states.bonus2.pos(2);
if OnGiantBoardF(board,bonus2x,bonus2y)
characterDisplayF(handles,11,0,bonus2x,bonus2y);
end

load('statesData');

bonus3x= states.bonus3.pos(1);
bonus3y = states.bonus3.pos(2);
if OnGiantBoardF(board,bonus3x,bonus3y)
characterDisplayF(handles,11,0,bonus3x,bonus3y);
end

load('statesData');

bonus4x= states.bonus4.pos(1);
bonus4y = states.bonus4.pos(2);
if OnGiantBoardF(board,bonus4x,bonus4y)
characterDisplayF(handles,11,0,bonus4x,bonus4y);
end


load('statesData');

bonus5x= states.bonus5.pos(1);
bonus5y = states.bonus5.pos(2);
if OnGiantBoardF(board,bonus5x,bonus5y)
characterDisplayF(handles,11,0,bonus5x,bonus5y);
end


load('statesData');

bonus6x= states.bonus6.pos(1);
bonus6y = states.bonus6.pos(2);
if OnGiantBoardF(board,bonus6x,bonus6y)
characterDisplayF(handles,11,0,bonus6x,bonus6y);
end
