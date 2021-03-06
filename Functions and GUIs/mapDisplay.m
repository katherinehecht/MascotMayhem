%function mapDisplayF(handles)


RIGHT = 12;
RIGHTTRUE = 1;

LEFT = 12;
LEFTTRUE = 1;
FRONT = 12;
FRONTTRUE = 1;

BACK = 12;
BACKTRUE = 1;

fighter1 = imread('Fighter-F-01.png');
background = imread('Capture.PNG');

backgroundp = characterImageProcess (background);
fighter1back1 = fighter1(1:32,1:24,:);
fighter1back1p = characterImageProcess (fighter1back1);



fighter1back2 = fighter1(1:32,25:48,:);
fighter1back2p = characterImageProcess (fighter1back2);

fighter1back3 = fighter1(1:32,49:72,:);
fighter1back3p = characterImageProcess (fighter1back3);

fighter1right1 = fighter1(33:64,1:24,:);
fighter1right1p = characterImageProcess (fighter1right1);

fighter1right2 = fighter1(33:64,25:48,:);
fighter1right2p = characterImageProcess (fighter1right2);

fighter1right3 = fighter1(33:64,49:72,:);
fighter1right3p = characterImageProcess (fighter1right3);

fighter1front1 = fighter1(65:96,1:24,:);
fighter1front1p = characterImageProcess (fighter1front1);

fighter1front2 = fighter1(65:96,25:48,:);
fighter1front2p = characterImageProcess (fighter1front2);

fighter1front3 = fighter1(65:96,49:72,:);
fighter1front3p = characterImageProcess (fighter1front3);

fighter1left1 = fighter1(97:128,1:24,:);
fighter1left1p = characterImageProcess (fighter1left1);

fighter1left2 = fighter1(97:128,25:48,:);
fighter1left2p = characterImageProcess (fighter1left2);

fighter1left3 = fighter1(97:128,49:72,:);
fighter1left3p = characterImageProcess (fighter1left3);





%% Create axes
axis xy;
axis equal;
grid off;
axis off
axis ([0,14,0,14]);
hax = gca;

% hPimage = i10mage('CData',fighter1right1p);
% hPimage.Parent = hax;


xLL = 1;
yLL = 12;
[ny,nx,nz] = size(fighter1right1p);
characterWidth =1;
characterHeight = characterWidth *(ny/nx);

xUR = xLL + characterWidth;
yUR = yLL + characterHeight;

backImage = image('CData',backgroundp);
 
backImage.XData = [0,14];
backImage.YData = [0,14];
if RIGHTTRUE == 1
    for iCnt = 1:RIGHT
        
        
        if rem(iCnt,4) ==1
            hPimage = image('CData',fighter1right1p);
        end
        
        if rem(iCnt,4) ==2 || rem(iCnt,4) ==0
            hPimage = image('CData',fighter1right2p);
        end
        if rem(iCnt,4) ==3
            hPimage = image('CData',fighter1right3p);
        end
        
        
        
        hPimage.XData = [xLL+(iCnt/2),xUR+(iCnt/2)];
        hPimage.YData = [yLL,yUR];
        pause(1/4);
        
%         if iCnt~=RIGHT
            set(hPimage,'Visible','off');
            
            
%         end

    end
end
xLL = xLL+(iCnt/2);
            xUR= xUR+(iCnt/2);
if FRONTTRUE == 1
    for iCnt = 1:FRONT
        
        
        if rem(iCnt,4) ==1
            hPimage = image('CData',fighter1front1p);
        end
        
        if rem(iCnt,4) ==2 || rem(iCnt,4) ==0
            hPimage = image('CData',fighter1front2p);
        end
        if rem(iCnt,4) ==3
            hPimage = image('CData',fighter1front3p);
        end
        
        
        
        hPimage.XData = [xLL,xUR];
        hPimage.YData = [yLL-(iCnt/2),yUR-(iCnt/2)];
        pause(1/4);
        
%         if iCnt~=FRONT
            set(hPimage,'Visible','off');

            
%         end
    end
end
yLL  = yLL-(iCnt/2);
            yUR = yUR-(iCnt/2);
if LEFTTRUE == 1
    for iCnt = 1:LEFT
        
        
        if rem(iCnt,4) ==1
            hPimage = image('CData',fighter1left1p);
        end
        
        if rem(iCnt,4) ==2 || rem(iCnt,4) ==0
            hPimage = image('CData',fighter1left2p);
        end
        if rem(iCnt,4) ==3
            hPimage = image('CData',fighter1left3p);
        end
        
        
        
        hPimage.XData = [xLL-(iCnt/2),xUR-(iCnt/2)];
        hPimage.YData = [yLL,yUR];
        pause(1/4);
        
%         if iCnt~=LEFT
            set(hPimage,'Visible','off');
            
            
%         end
    end
end

 xLL = xLL-(iCnt/2);
            xUR= xUR-(iCnt/2);

if BACKTRUE == 1
    for iCnt = 1:BACK
        
        
        if rem(iCnt,4) ==1
            hPimage = image('CData',fighter1back1p);
        end
        
        if rem(iCnt,4) ==2 || rem(iCnt,4) ==0
            hPimage = image('CData',fighter1back2p);
        end
        if rem(iCnt,4) ==3
            hPimage = image('CData',fighter1back3p);
        end
        
        
        
        hPimage.XData = [xLL,xUR];
        hPimage.YData = [yLL+(iCnt/2),yUR+(iCnt/2)];
        pause(1/4);
        
        if iCnt~=FRONT
            set(hPimage,'Visible','off');
        end
    end
end


characterDisplay;

% 
% fighter1front1pImage = image('CData',fighter1front1p);
% fighter1front1pImage.Parent = hax;
% 
% fighter1front2pImage = image('CData',fighter1front2p);
% fighter1front2pImage.Parent = hax;
% 
% 
% fighter1front3pImage = image('CData',fighter1front3p);
% fighter1front3pImage.Parent = hax;
% 
% xLL = 4;
% yLL = 1;
% [ny,nx,nz] = size(fighter1back1p);
% characterWidth =1;
% characterHeight = characterWidth *(ny/nx);
% 
% xUR = xLL + characterWidth;
% yUR = yLL + characterHeight;
% 
% for iCnt = 1:3
%     if iCnt ==1
%     fighter1front1pImage.XData = [xLL,xUR];
%     fighter1front1pImage.YData = [yLL,yUR];
%     pause(1);
%     end
% 
%     if iCnt ==2
%     fighter1front2pImage.XData = [xLL,xUR];
%     fighter1front2pImage.YData = [yLL,yUR];
%     pause(1);
%     end
%      
%     if iCnt ==3
%     fighter1front2pImage.XData = [xLL,xUR];
%     fighter1front2pImage.YData = [yLL,yUR]; 
%      pause(1);
%      
%     end
% end


