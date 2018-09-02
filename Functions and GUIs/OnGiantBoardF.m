function d = OnGiantBoardF(board,x,y)
d=0;
if x<26 && y<26

a = 1;
end 

if x<26 && y>25
a = 2;
end 

if x>25 && y<26
a=3;
end 

if x>25 && y>25
a = 4;
end

if a == board
    d=1;
end