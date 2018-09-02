function int=processImagePos(positionCode,num,sizeX,sizeY)

if num==1
    int = (((floor(positionCode/10))-1)*sizeY+1);
end

if num==2
    int = ((floor(positionCode/10))*sizeY);
end

if num==3
    int = ((positionCode-10*(floor(positionCode/10)))-1)*sizeX+1;
end

if num==4
    int = (((positionCode-10*(floor(positionCode/10))))*sizeX);

end
