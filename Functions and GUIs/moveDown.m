function [states,handles] = moveDown(states,handles)
%% moveDown
% Moves the player down if there is room.
% Does not allow the player to move on top of an opponent when in an
% encounter.

if states.inEncounter
    if states.player.encounterPos + [1,0] == states.currentEncounter.encounterPos
        console('You cannot move on top of your opponent.',handles);
    elseif states.player.encounterPos(1) + 1 <= 12
        states.player.encounterPos(1) = states.player.encounterPos(1) + 1;
        states.player.movesRemaining = states.player.movesRemaining - 1;
    end
elseif states.player.pos(1) + 1 <= 50
    states.player.pos(1) = states.player.pos(1) + 1;
end