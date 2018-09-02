function outputImage =characterImageProcess (character1)

%% find image scale 
[ny,nx,nz,ralpha] = size(character1);




%% flip color planes

for k=1:3
    character2(:,:,k)=flipud(character1(:,:,k));
end

outputImage = character2;
