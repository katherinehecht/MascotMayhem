% battleF.m
% create and simulate battles
% April 3rd
% Andy and Katherine

function [winner,handles] = battleF(handles,player1,player2)

% initialize players' positions with randi
if randi(2) < 2
    player1.pos = [1,1];
    player2.pos = [12,12];
else
    player1.pos = [12,12];
    player2.pos = [1,1];
end

% test which player is faster to determine who moves first
if player1.speed > player2.speed
    turn1 = 1;
    turn2 = 0;
elseif player2.speed > player1.speed
    turn1 = 0;
    turn2 = 1;
else
    turn1 = randi(2) - 1;
    if turn1 == 0
        turn2 = 1;
    else
        turn2 = 0;
    end % ends if turn1 == 0
end % ends if player1.speed > player2.speed

% run while both players are alive
while player1.health > 0 && player2.health > 0
    
    % player1's movement
    if mod(turn1,2) == 1
        % set player defense back to baseDefense
        player1.defense = player1.baseDefense;
        % call playerMove function to get sequence of player1's moves
        % p1MoveSequence will be an array of strings describing moves
        p1MoveSequence = playerMove(player1,player2);
        
        % evaluate each move in p1MoveSequence
        for iMove = 1:length(p1MoveSequence)
            player1Move = p1MoveSequence{iMove};
            
            % switch case evaluates 'player1move' to update position on
            % board'
            switch player1Move
                case 'right'
                    % if moving right moves the player off the board, dUp
                    % instead
                    if player1.pos(2) + 1 == 13
                        defense = player1.baseDefense/100;
                        defense = (sqrt(defense) + defense)/2;
                        player1.defense = defense*100;
                    else
                        player1.pos = [player1.pos(1),player1.pos(2)+1];
                    end % if player2.pos(2) + 1 == 13
                case 'left'
                    % if moving left moves the player off the board, dUp
                    % instead
                    if player1.pos(2) - 1 == 0
                        defense = player1.baseDefense/100;
                        defense = (sqrt(defense) + defense)/2;
                        player1.defense = defense*100;
                    else
                        player1.pos = [player1.pos(1),player1.pos(2)-1];
                    end % if player2.pos(2) - 1 == 0
                case 'up'
                    % if moving up moves the player off the board, dUp
                    % instead
                    if player1.pos(1) - 1 == 0
                        defense = player1.baseDefense/100;
                        defense = (sqrt(defense) + defense)/2;
                        player1.defense = defense*100;
                    else
                        player1.pos = [player1.pos(1)-1,player1.pos(2)];
                    end % if player2.pos(1) - 1 == 0
                case 'down'
                    % if moving down moves the player off the board, dUp
                    % instead
                    if player1.pos(1) + 1 == 13
                        defense = player1.baseDefense/100;
                        defense = (sqrt(defense) + defense)/2;
                        player1.defense = defense*100;
                    else
                        player1.pos = [player1.pos(1)+1,player1.pos(2)];
                    end % if player2.pos(1) + 1 == 0
                case 'dUp'
                    % increase player 1's defense using math
                    defense = player1.baseDefense/100;
                    defense = (sqrt(defense) + defense)/2;
                    player1.defense = defense*100;
                    % increase player1's health by its healrate if it isn't already at max value
                    if player1.health + player1.healRate <= player1.maxHealth
                        player1.health = player1.health + player1.healRate;
                    else
                        player1.health = player1.maxHealth;
                    end % if player1.health + player1.healRate <= player1.maxHealth
                case 'attack'
                    % attack other player using attackS function
                    [player1,player2] = attackS(player1,player2);
            end % switch player1Move
        end   % iMove = 1:length(p1MoveSequence)
        
    else % player2's movement
        % set player defense back to baseDefense
        player2.defense = player2.baseDefense;
        % call playerMove function to get sequence of player2's moves
        % p2MoveSequence will be an array of strings describing moves
        p2MoveSequence = playerMove(player2,player1);
        
        % evaluate each move in p1MoveSequence
        for iMove = 1:length(p2MoveSequence)
            player2Move = p2MoveSequence{iMove};
            
            % switch case evaluates 'player1move' to update position on
            % board'
            switch player2Move
                case 'right'
                    % if moving right moves the player off the board, dUp
                    % instead
                    if player2.pos(2) + 1 == 13
                        defense = player2.baseDefense/100;
                        defense = (sqrt(defense) + defense)/2;
                        player2.defense = defense*100;
                    else
                        player2.pos = [player2.pos(1),player2.pos(2)+1];
                    end % if player2.pos(2) + 1 == 13
                case 'left'
                    % if moving left moves the player off the board, dUp
                    % instead
                    if player2.pos(2) - 1 == 0
                        defense = player2.baseDefense/100;
                        defense = (sqrt(defense) + defense)/2;
                        player2.defense = defense*100;
                    else
                        player2.pos = [player2.pos(1),player2.pos(2)-1];
                    end % if player2.pos(2) - 1 == 0
                case 'up'
                    % if moving up moves the player off the board, dUp
                    % instead
                    if player2.pos(1) - 1 == 0
                        defense = player2.baseDefense/100;
                        defense = (sqrt(defense) + defense)/2;
                        player2.defense = defense*100;
                    else
                        player2.pos = [player2.pos(1)-1,player2.pos(2)];
                    end % if player2.pos(1) - 1 == 0
                case 'down'
                    % if moving down moves the player off the board, dUp
                    % instead
                    if player2.pos(1) + 1 == 13
                        defense = player2.baseDefense/100;
                        defense = (sqrt(defense) + defense)/2;
                        player2.defense = defense*100;
                    else
                        player2.pos = [player2.pos(1)+1,player2.pos(2)];
                    end % if player2.pos(1) + 1 == 0
                case 'dUp'
                    % increase player 2's defense using math
                    defense = player2.baseDefense/100;
                    defense = (sqrt(defense) + defense)/2;
                    player2.defense = defense*100;
                    % increase player2's health by its healrate if it isn't already at max value
                    if player2.health + player2.healRate <= player2.maxHealth
                        player2.health = player2.health + player2.healRate;
                    else
                        player2.health = player2.maxHealth;
                    end % if player2.health + player2.healRate <= player2.maxHealth
                case 'attack'
                    % attack other player using attackS function
                    [player2,player1] = attackS(player2,player1);
            end % switch player1Move
        end   % iMove = 1:length(p2MoveSequence)
        
    end % ends if mod(turn1,2) == 1
    
    turn1 = turn1 + 1; % increment turns
    turn2 = turn2 + 1; % increment turns
end % ends while player1.health > 0 && player2.health > 0

% if player1's health is 0, winner is player 2. Otherwise, winner is player
% 2.
if player1.health == 0
    winner = 2;
else
    winner = 1;
end % if player1.health = 0

end