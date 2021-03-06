function moveSequence = playerMove(player1, player2)
% function accounts for statistics of each player and then analyzes health
% strategy, and characteristics to move one of 6 ways : up, down, left,
% right, defend, or attack. The following cases are temporary guidlines to
% determine gameplay.

% initialize cell array of moves dependent upon player speed
moveSequence = cell(1,player1.speed);

% keep track of current postition
currentPos = player1.pos;
switch player1.strategy
    case 'flee'
        % flees from opponent by dividing board into quadrants and moving
        % to corner opposite the quadrant that the enemy is is. Once in
        % opposite corner, dUp.
        for iFlee = 1:player1.speed
            % test to see if enemy and player are in upper left quadrant
            if ((currentPos(1) < 7 && currentPos(2) < 7) && (player2.pos(1) < 7 && player2.pos(2) < 7))
                % test to see if enemy is closer left or closer upward
                if abs(currentPos(1) - player2.pos(1)) < abs(currentPos(2) - player2.pos(2))
                    moveSequence{1,iFlee} = 'down';
                    currentPos = [currentPos(1)+1,currentPos(2)];
                else
                    moveSequence{1,iFlee} = 'right';
                    currentPos = [currentPos(1),currentPos(2)+1];
                end % abs(player1.pos(1) - player2.pos(1)) < abs(player1.pos(2) - player2.pos(2))
                % test to see if enemy and player are in upper right quadrant
            elseif ((currentPos(1) < 7 && currentPos(2) >= 7) && (player2.pos(1) < 7 && player2.pos(2) >= 7))
                % test to see if enemy is closer right or closer upward
                if abs(currentPos(1) - player2.pos(1)) < abs(currentPos(2) - player2.pos(2))
                    moveSequence{1,iFlee} = 'down';
                    currentPos = [currentPos(1)+1,currentPos(2)];
                else
                    moveSequence{1,iFlee} = 'left';
                    currentPos = [currentPos(1),currentPos(2)-1];
                end % abs(player1.pos(1) - player2.pos(1)) < abs(player1.pos(2) - player2.pos(2))
                % test to see if enemy and player are in lower left quadrant
            elseif ((currentPos(1) >= 7 && currentPos(2) < 7) && (player2.pos(1) >= 7 && player2.pos(2) < 7))
                % test to see if enemy is closer left or closer downward
                if abs(currentPos(1) - player2.pos(1)) < abs(currentPos(2) - player2.pos(2))
                    moveSequence{1,iFlee} = 'up';
                    currentPos = [currentPos(1)-1,currentPos(2)];
                else
                    moveSequence{1,iFlee} = 'right';
                    currentPos = [currentPos(1),currentPos(2)+1];
                end % abs(player1.pos(1) - player2.pos(1)) < abs(player1.pos(2) - player2.pos(2))
                % test to see if enemy and player are in lower right quadrant
            elseif ((currentPos(1) >= 7 && currentPos(2) >= 7) && (player2.pos(1) >= 7 && player2.pos(2) >= 7))
                % test to see if enemy is closer right or closer downward
                if abs(currentPos(1) - player2.pos(1)) < abs(currentPos(2) - player2.pos(2))
                    moveSequence{1,iFlee} = 'up';
                    currentPos = [currentPos(1)-1,currentPos(2)];
                else
                    moveSequence{1,iFlee} = 'left';
                    currentPos = [currentPos(1),currentPos(2)-1];
                end % abs(player1.pos(1) - player2.pos(1)) < abs(player1.pos(2) - player2.pos(2))
                % if the enemy and character aren't in the same quadrant,
                % employ opposite corner strategy
            else
                % if opponent is in upper left quadrant, move to bottom right
                % corner
                if player2.pos(1) < 7 && player2.pos(2) < 7
                    % dUp if already in corner
                    if currentPos == [12,12]
                        moveSequence{1,iFlee} = 'dUp';
                        % determine if player1 is further from the corner in
                        % columns or in rows
                    elseif currentPos(1) <= currentPos(2) && (currentPos(1) ~= 1) && (currentPos(2) ~= 1)
                        moveSequence{1,iFlee} = 'down';
                        currentPos = [currentPos(1)+1,currentPos(2)];
                    else
                        moveSequence{1,iFlee} = 'right';
                        currentPos = [currentPos(1),currentPos(2)+1];
                    end % if currentPos = [12,12]
                    % if opponent is in upper right quadrant, move to bottom left
                    % corner
                elseif player2.pos(1) < 7 && player2.pos(2) >= 7
                    % dUp if already in corner
                    if currentPos == [12,1]
                        moveSequence{1,iFlee} = 'dUp';
                        % determine if player1 is further from the corner in
                        % columns or in rows
                    elseif currentPos(1) <= currentPos(2) && (currentPos(1) ~= 12) && (currentPos(2) ~= 12)
                        moveSequence{1,iFlee} = 'down';
                        currentPos = [currentPos(1)+1,currentPos(2)];
                    else
                        moveSequence{1,iFlee} = 'left';
                        currentPos = [currentPos(1),currentPos(2)-1];
                    end % if currentPos = [12,1]
                    % if opponent is in lower left quadrant, move to top right
                    % corner
                elseif player2.pos(1) >= 7 && player2.pos(2) < 7
                    % dUp if already in corner
                    if currentPos == [1,12]
                        moveSequence{1,iFlee} = 'dUp';
                        % determine if player1 is further from the corner in
                        % columns or in rows
                    elseif  currentPos(1) <= currentPos(2) && (currentPos(1) ~= 12) && (currentPos(2) ~= 12)
                        moveSequence{1,iFlee} = 'right';
                        currentPos = [currentPos(1),currentPos(2)+1];
                    else
                        moveSequence{1,iFlee} = 'up';
                        currentPos = [currentPos(1)-1,currentPos(2)];
                    end % if currentPos = [1,12]
                    % if opponent is in lower right quadrant, move to top left
                    % corner
                elseif player2.pos(1) >= 7 && player2.pos(2) >= 7
                    % dUp if already in corner
                    if currentPos == [1,1]
                        moveSequence{1,iFlee} = 'dUp';
                    elseif currentPos(1) <= currentPos(2)
                        moveSequence{1,iFlee} = 'left';
                        currentPos = [currentPos(1),currentPos(2)-1];
                    else
                        moveSequence{1,iFlee} = 'up';
                        currentPos = [currentPos(1)-1,currentPos(2)];
                    end % if currentPos = [1,1]
                end % if player2.pos(1) < 7 && player2.pos(2) < 7
            end % ((player1.pos(1) < 7 && player1.pos(2) < 7) && (player2.pos(1) < 7 && player2.pos(2) < 7))
        end % for iFlee = 1:player1.speed
        
        
    case 'coward'
        % refuses to move even if far from enemy and high health
        % dUps for all of its moves
        for iCnt = 1:player1.speed
            moveSequence{1,iCnt} = 'dUp';
        end % for iCnt = 1:player1.speed
        
    case 'passive'
        % defends more than neutral
        % player 1 becomes suicidal when it could theoretically kill player 2 within
        % 2 turns
        if (2*player1.strength) > player2.health && (2*player2.strength) < player1.health
            player1.substrategy = 'suicidal';
        % player 1 becomes suicidal when player1 is not within 2*player2's  range
        elseif (abs(currentPos(1)-player2.pos(1)) > 2*player2.range && abs(currentPos(2)-player2.pos(2))) > 2*player2.range
            player1.substrategy = 'suicidal';
        % player 1 becomes suicidal if it is within range of attacking and
        % has health greater than quadruplice player2's strength
        elseif player1.health > (4*player2.strength)
            player1.substrategy = 'suicidal';
        % otherwise, player 1 becomes flee
        else
            player1.substrategy = 'flee';
        end % substrategy if statements
        % determine move sequence based on player1's substrategy
        moveSequence = fluicidal(player1,player2);
        % if player1's speed is greater than 1, dUp on last move
        if player1.speed > 1
            moveSequence{player1.speed} = 'dUp';
        end % if player1.speed > 1
    case 'neutral'
        % correct analysis of position and health
        % defends more than neutral
        % player 1 becomes suicidal when it could theoretically kill player 2 within
        % 3 turns
        if (3*player1.strength) > player2.health && (3*player2.strength) < player1.health
            player1.substrategy = 'suicidal';
        % player 1 becomes suicidal when player1 is not within player2's  range
        elseif (abs(currentPos(1)-player2.pos(1)) > player2.range && abs(currentPos(2)-player2.pos(2))) > player2.range
            player1.substrategy = 'suicidal';
        % player 1 becomes suicidal if it is within range of attacking and
        % has health greater than thrice player2's strength
        elseif player1.health > (3*player2.strength)
            player1.substrategy = 'suicidal';
        % otherwise, player 1 becomes flee
        else
            player1.substrategy = 'flee';
        end % substrategy if statements
        % determine move sequence based on player1's substrategy
        moveSequence = fluicidal(player1,player2);
        % if player1's speed is greater than 2, dUp on last move
        if player1.speed > 2
            moveSequence{player1.speed} = 'dUp';
        end % if player1.speed > 1
    case 'active'
        % attacks more than neutral
        % player 1 becomes suicidal when it could theoretically kill player 2 within
        % 4 turns
        if (4*player1.strength) > player2.health && (4*player2.strength) < player1.health
            player1.substrategy = 'suicidal';
        % player 1 becomes suicidal when player 2 is not within player 1's  range
        elseif (abs(currentPos(1)-player2.pos(1)) > player1.range && abs(currentPos(2)-player2.pos(2))) > player1.range
            player1.substrategy = 'suicidal';
        % player 1 becomes suicidal if it is within range of attacking and
        % has health greater than twice player2's strength
        elseif player1.health > (2*player2.strength)
            player1.substrategy = 'suicidal';
        % otherwise, player 1 becomes flee
        else
            player1.substrategy = 'flee';
        end % substrategy if statements
        % determine move sequence based on player1's substrategy
        moveSequence = fluicidal(player1,player2);
        
    case 'suicidal'
        % moves towards enemy with no regard to health
        movesMade = 0; % keeps track of moves made
        % this while loop will cause player1 to move towards player2 as
        % long as it is not within attack range and number of moves made is
        % less than player1 speed
        while (abs(currentPos(1)-player2.pos(1)) > player1.range || abs(currentPos(2)-player2.pos(2)) > player1.range) && movesMade < player1.speed
            movesMade = movesMade+1; % increment movesMade
            % evaluate if player 1 is farther away in rows than columns
            % from player 2
            if (abs(currentPos(1) - player2.pos(1)) > abs(currentPos(2) - player2.pos(2)))
                % player 1 moves down if its position is above player 2
                if currentPos(1) < player2.pos(1)
                    moveSequence{1,movesMade} = 'down';
                    currentPos = [currentPos(1)+1,currentPos(2)];
                    
                else % player moves up
                    moveSequence{1,movesMade} = 'up';
                    currentPos = [currentPos(1)-1,currentPos(2)];
                    
                end % player1.pos(1) < player2.pos(1)
            else % will occur if player 1 is farther away in columns than rows
                % player 1 moves right if its position is left of player 2
                if currentPos(2) < player2.pos(2)
                    moveSequence{1,movesMade} = 'right';
                    currentPos = [currentPos(1),currentPos(2)+1];
                else % player moves up
                    moveSequence{1,movesMade} = 'left';
                    currentPos = [currentPos(1),currentPos(2)-1];
                    
                end % player1.pos(2) < player2.pos(2)
            end % (abs(player1.pos(1) - player2.pos(1)) > abs(player1.pos(2) - player2.pos(2)))
            % evaluates if close enough to attack, then attacks regardless
        end % ends while not in range and still has moves
        
        % set move to 'attack' for remaining moves
        if movesMade < player1.speed
            for iAttack = movesMade+1:player1.speed
                moveSequence{1,iAttack} = 'attack';
            end % for iAttack = movesMade+1:player1.speed
        end
        
end

