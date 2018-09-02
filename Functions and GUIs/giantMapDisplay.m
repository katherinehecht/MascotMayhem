giantMapDisplayF.m

background = imread('giantMap1.PNG');

backgroundp = characterImageProcess (background);





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

