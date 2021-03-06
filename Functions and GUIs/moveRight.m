function [states,handles] = moveRight(states,handles)
%% moveRight.m
% Moves the player to the right if there is room.
% Does not allow the player to move on top of an opponent when in an
% encounter.

if states.inEncounter
    if states.player.encounterPos + [0,1] == states.currentEncounter.encounterPos
        console('You cannot move on top of your opponent.',handles);
    elseif states.player.encounterPos(2) < 12
        states.player.encounterPos(2) = states.player.encounterPos(2) + 1;
        states.player.movesRemaining = states.player.movesRemaining - 1;
    end
elseif states.player.pos(2) < 50
    states.player.pos(2) = states.player.pos(2) + 1;
end