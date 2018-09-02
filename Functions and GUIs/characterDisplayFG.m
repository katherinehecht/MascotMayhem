function characterDisplayFG(handles,characterNum,moveBoolean,yyy,xxx)

RIGHT = 12;
RIGHTTRUE = 1;

LEFT = 12;
LEFTTRUE = 1;
FRONT = 12;
FRONTTRUE = 1;

BACK = 12;
BACKTRUE = 1;




%% Read Character Profile


if characterNum==0
[characterImage,map,Ralpha] = imread('ranger_f.png');    
% characterImage = imread('Fighter-F-01.png');
[ny,nx,nz,ralpha] = size(characterImage);

    
end 
if characterNum==3
[characterImage,map,Ralpha] = imread('3_angryMob.png');    

[ny,nx,nz,ralpha] = size(characterImage);

    
end 
if characterNum==4
[characterImage,map,Ralpha] = imread('4_zombie.png');    

[ny,nx,nz,ralpha] = size(characterImage);

    
end 
if characterNum==5
[characterImage,map,Ralpha] = imread('5_Gentleman.png');    

[ny,nx,nz,ralpha] = size(characterImage);

    
end 
if characterNum==6
[characterImage,map,Ralpha] = imread('6_jugger.png');    

[ny,nx,nz,ralpha] = size(characterImage);

    
end 
if characterNum==7
[characterImage,map,Ralpha] = imread('7_Bear.png');
[ny,nx,nz,ralpha] = size(characterImage);
end 

if characterNum==8
[characterImage,map,Ralpha] = imread('8_lion.png');
[ny,nx,nz,ralpha] = size(characterImage);
for iCnt = 1:ny
    for jCnt = 1:nx
        if characterImage(iCnt,jCnt,1 )==181 
        Ralpha(iCnt,jCnt)= 0;
        else 
        Ralpha(iCnt,jCnt)= 255;
        end
    end
end 

end 
if characterNum==9
characterImage = imread('9_marsRover.PNG');
[ny,nx,nz,ralpha] = size(characterImage);
for iCnt = 1:ny
    for jCnt = 1:nx
        if characterImage(iCnt,jCnt,1 )==255 
        Ralpha(iCnt,jCnt)= 0;
        else 
        Ralpha(iCnt,jCnt)= 255;
        end
    end
end 
end

if characterNum==10
characterImage = imread('10_Doc.PNG');
[ny,nx,nz,ralpha] = size(characterImage);
for iCnt = 1:ny
    for jCnt = 1:nx
        if characterImage(iCnt,jCnt,1 )==12 
        Ralpha(iCnt,jCnt)= 0;
        else 
        Ralpha(iCnt,jCnt)= 255;
        end
    end
end 
end




if characterNum==2
[characterImage,map,Ralpha] = imread('2_duck.png');
[ny,nx,nz,ralpha] = size(characterImage);


end 


if characterNum==1
[characterImage,map,Ralpha] = imread('1_weasel.png');    
% characterImage = imread('Fighter-F-01.png');
[ny,nx,nz,ralpha] = size(characterImage);


for inx=1:nx
    for iny=1:ny      

           characterImage(iny,inx,2)= 0;
           
    end
end

end
characterImageP= characterImageProcess(characterImage);
RalphaP(:,:) = flipud(Ralpha(:,:));
% xLL = 1;
% yLL = 1;
% [ny,nx,nz] = size(characterImageP);
% characterWidth =3;
% characterHeight = characterWidth *(ny/nx);
% 
% xUR = xLL + characterWidth;
% yUR = yLL + characterHeight;

if characterNum==0||characterNum==3||characterNum==4||characterNum==5||characterNum==6
    R1 = 33;
    R2 = 32;
    R3 = 31;
    F1 = 21;
    F2 = 22;
    F3 = 23;
    L1 = 11;
    L2 = 12;
    L3 = 13;
    B1 = 41;
    B2 = 42;
    B3 = 43;
end     
if characterNum==2


    R1 = 23;
    R2 = 13;
    R3 = 23;
    F1 = 24;
    F2 = 14;
    F3 = 24;
    L1 = 22;
    L2 = 12;
    L3 = 22;
    B1 = 21;
    B2 = 11;
    B3 = 21;
     
end
if characterNum==1
    R1 = 21;
    R2 = 23;
    R3 = 22;
    F1 = 41;
    F2 = 43;
    F3 = 42;
    L1 = 31;
    L2 = 33;
    L3 = 32;
    B1 = 11;
    B2 = 13;
    B3 = 12;
end     
if characterNum==7
    R1 = 11;
    R2 = 12;
    R3 = 13;
    F1 = 41;
    F2 = 42;
    F3 = 43;
    L1 = 31;
    L2 = 32;
    L3 = 33;
    B1 = 21;
    B2 = 22;
    B3 = 23;
end    
if characterNum==8||characterNum==9||characterNum==10||characterNum==11
    R1 = 11;
    R2 = 11;
    R3 = 11;
    F1 = 11;
    F2 = 11;
    F3 = 11;
    L1 = 11;
    L2 = 11;
    L3 = 11;
    B1 = 11;
    B2 = 11;
    B3 = 11;
end   

MAX = max([R1,R2,R3,F1,F2,F3,L1,L2,L3,B1,B2,B3]);
MAXy = floor(MAX/10);
MAXx = MAX - MAXy*10;
sizeX = nx/MAXx;
sizeY = ny/MAXy;
y=floor(R1/10);

xx1=((R1-10*(floor(R1/10)))-1)*sizeX+1;
xx2=(((R1-10*(floor(R1/10))))*sizeX);
yy1=(((floor(R1/10))-1)*sizeY+1);
yy2=((floor(R1/10))*sizeY);

Right1 = characterImageP(processImagePos(R1,1,sizeX,sizeY): processImagePos(R1,2,sizeX,sizeY),processImagePos(R1,3,sizeX,sizeY):processImagePos(R1,4,sizeX,sizeY),: );
RalphaR1 = RalphaP(processImagePos(R1,1,sizeX,sizeY): processImagePos(R1,2,sizeX,sizeY),processImagePos(R1,3,sizeX,sizeY):processImagePos(R1,4,sizeX,sizeY),: );
Right2 = characterImageP(processImagePos(R2,1,sizeX,sizeY): processImagePos(R2,2,sizeX,sizeY),processImagePos(R2,3,sizeX,sizeY):processImagePos(R2,4,sizeX,sizeY),: );
RalphaR2 = RalphaP(processImagePos(R2,1,sizeX,sizeY): processImagePos(R2,2,sizeX,sizeY),processImagePos(R2,3,sizeX,sizeY):processImagePos(R2,4,sizeX,sizeY),: );
Right3 = characterImageP(processImagePos(R3,1,sizeX,sizeY): processImagePos(R1,2,sizeX,sizeY),processImagePos(R3,3,sizeX,sizeY):processImagePos(R3,4,sizeX,sizeY),: );
RalphaR3 = RalphaP(processImagePos(R3,1,sizeX,sizeY): processImagePos(R1,2,sizeX,sizeY),processImagePos(R3,3,sizeX,sizeY):processImagePos(R3,4,sizeX,sizeY),: );

% % 
Front1 = characterImageP(processImagePos(F1,1,sizeX,sizeY): processImagePos(F1,2,sizeX,sizeY),processImagePos(F1,3,sizeX,sizeY):processImagePos(F1,4,sizeX,sizeY),: );
RalphaF1 = RalphaP(processImagePos(F1,1,sizeX,sizeY): processImagePos(F1,2,sizeX,sizeY),processImagePos(F1,3,sizeX,sizeY):processImagePos(F1,4,sizeX,sizeY),: );
Front2 = characterImageP(processImagePos(F2,1,sizeX,sizeY): processImagePos(F2,2,sizeX,sizeY),processImagePos(F2,3,sizeX,sizeY):processImagePos(F2,4,sizeX,sizeY),: );
RalphaF2 = RalphaP(processImagePos(F2,1,sizeX,sizeY): processImagePos(F2,2,sizeX,sizeY),processImagePos(F2,3,sizeX,sizeY):processImagePos(F2,4,sizeX,sizeY),: );
Front3 = characterImageP(processImagePos(F3,1,sizeX,sizeY): processImagePos(F1,2,sizeX,sizeY),processImagePos(F3,3,sizeX,sizeY):processImagePos(F3,4,sizeX,sizeY),: );
RalphaF3 = RalphaP(processImagePos(F3,1,sizeX,sizeY): processImagePos(F1,2,sizeX,sizeY),processImagePos(F3,3,sizeX,sizeY):processImagePos(F3,4,sizeX,sizeY),: );

% % 
Left1 = characterImageP(processImagePos(L1,1,sizeX,sizeY): processImagePos(L1,2,sizeX,sizeY),processImagePos(L1,3,sizeX,sizeY):processImagePos(L1,4,sizeX,sizeY),: );
RalphaL1 = RalphaP(processImagePos(L1,1,sizeX,sizeY): processImagePos(L1,2,sizeX,sizeY),processImagePos(L1,3,sizeX,sizeY):processImagePos(L1,4,sizeX,sizeY),: );
Left2 = characterImageP(processImagePos(L2,1,sizeX,sizeY): processImagePos(L2,2,sizeX,sizeY),processImagePos(L2,3,sizeX,sizeY):processImagePos(L2,4,sizeX,sizeY),: );
RalphaL2 = RalphaP(processImagePos(L2,1,sizeX,sizeY): processImagePos(L2,2,sizeX,sizeY),processImagePos(L2,3,sizeX,sizeY):processImagePos(L2,4,sizeX,sizeY),: );
Left3 = characterImageP(processImagePos(L3,1,sizeX,sizeY): processImagePos(L3,2,sizeX,sizeY),processImagePos(L3,3,sizeX,sizeY):processImagePos(L3,4,sizeX,sizeY),: );
RalphaL3 = RalphaP(processImagePos(L3,1,sizeX,sizeY): processImagePos(L3,2,sizeX,sizeY),processImagePos(L3,3,sizeX,sizeY):processImagePos(L3,4,sizeX,sizeY),: );

% % 
% % 
Back1 = characterImageP(processImagePos(B1,1,sizeX,sizeY): processImagePos(B1,2,sizeX,sizeY),processImagePos(B1,3,sizeX,sizeY):processImagePos(B1,4,sizeX,sizeY),: );
RalphaB1 = RalphaP(processImagePos(B1,1,sizeX,sizeY): processImagePos(B1,2,sizeX,sizeY),processImagePos(B1,3,sizeX,sizeY):processImagePos(B1,4,sizeX,sizeY),: );

Back2 = characterImageP(processImagePos(B2,1,sizeX,sizeY): processImagePos(B2,2,sizeX,sizeY),processImagePos(B2,3,sizeX,sizeY):processImagePos(B2,4,sizeX,sizeY),: );
RalphaB2 = RalphaP(processImagePos(B2,1,sizeX,sizeY): processImagePos(B2,2,sizeX,sizeY),processImagePos(B2,3,sizeX,sizeY):processImagePos(B2,4,sizeX,sizeY),: );

Back3 = characterImageP(processImagePos(B3,1,sizeX,sizeY): processImagePos(B1,2,sizeX,sizeY),processImagePos(B3,3,sizeX,sizeY):processImagePos(B3,4,sizeX,sizeY),: );
RalphaB3 = RalphaP(processImagePos(B3,1,sizeX,sizeY): processImagePos(B3,2,sizeX,sizeY),processImagePos(B3,3,sizeX,sizeY):processImagePos(B3,4,sizeX,sizeY),: );




%% Character Initial Position

    
xLL = xxx;
yLL = 13-yyy;

characterWidth =1;
characterHeight = characterWidth *(sizeY/sizeX);

xUR = xLL + characterWidth;
yUR = yLL + characterHeight;


%% Character Display
if moveBoolean==0
hPimage = image(handles.display,'CData',Front2,'AlphaData',RalphaF2);
hPimage.XData = [xLL,xUR];
hPimage.YData = [yLL,yUR];
end


%% Character Movement
% Move Right
if moveBoolean==1
if RIGHTTRUE == 1
    for iCnt = 1:3
        
        
        if rem(iCnt,4) ==1
            hPimage = image('CData',Right1,'AlphaData',RalphaR1);
        end
        
        if rem(iCnt,4) ==2 || rem(iCnt,4) ==0
            hPimage = image('CData',Right2,'AlphaData',RalphaR2);
        end
        if rem(iCnt,4) ==3
            hPimage = image('CData',Right3,'AlphaData',RalphaR3);
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
    for iCnt = 1:3
        
        
        if rem(iCnt,4) ==1
            hPimage = image('CData',Front1,'AlphaData',RalphaF1);
        end
        
        if rem(iCnt,4) ==2 || rem(iCnt,4) ==0
            hPimage = image('CData',Front2,'AlphaData',RalphaF2);
        end
        if rem(iCnt,4) ==3
            hPimage = image('CData',Front3,'AlphaData',RalphaF3);
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
    for iCnt = 1:3
        
        
        if rem(iCnt,4) ==1
            hPimage = image('CData',Left1,'AlphaData',RalphaL1);
        end
        
        if rem(iCnt,4) ==2 || rem(iCnt,4) ==0
            hPimage = image('CData',Left2,'AlphaData',RalphaL2);
        end
        if rem(iCnt,4) ==3
            hPimage = image('CData',Left3,'AlphaData',RalphaL3);
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
    for iCnt = 1:3
        
        
        if rem(iCnt,4) ==1
            hPimage = image('CData',Back1,'AlphaData',RalphaB1);
        end
        
        if rem(iCnt,4) ==2 || rem(iCnt,4) ==0
            hPimage = image('CData',Back2,'AlphaData',RalphaB2);
        end
        if rem(iCnt,4) ==3
            hPimage = image('CData',Back3,'AlphaData',RalphaB3);
        end
        
        
        
        hPimage.XData = [xLL,xUR];
        hPimage.YData = [yLL+(iCnt/2),yUR+(iCnt/2)];
        pause(1/4);
        
        if iCnt~=3
            set(hPimage,'Visible','off');
        end
    end
end

end
