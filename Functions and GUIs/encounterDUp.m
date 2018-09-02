function [states,handles,player1] = encounterDUp(states,handles,player1)
% Increases the defense of the opponent for a turn

defense = player1.baseDefense/100;
defense = (sqrt(defense) + defense)/2;
player1.defense = defense*100;
if player1.health + player1.healRate >= player1.maxHealth
    player1.health = player1.maxHealth;
else
    player1.health = player1.health + player1.healRate;
end
if states.inEncounter
    console('Your opponent takes a defensive stance and heals.',handles);
end