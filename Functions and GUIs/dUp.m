function [states,handles] = dUp(states,handles)
% Increases the defense of the player for a turn

if states.inEncounter
    defense = states.player.baseDefense/100;
    defense = (sqrt(defense) + defense)/2;
    states.player.defense = defense*100;
    states.player.movesRemaining = 0;
    [states,handles] = updateGUI(states,handles);
else
    console('You are not in an encounter.',handles);
end