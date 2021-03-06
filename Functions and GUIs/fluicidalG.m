function [currentPos,moveSequence] = fluicidalG(player1, player2)

currentPos = player1.encounterPos;
switch player1.substrategy
    case 'flee'
        % flees from opponent by dividing board into quadrants and moving
        % to corner opposite the quadrant that the enemy is is. Once in
        % opposite corner, dUp.
        for iFlee = 1:player1.speed
            % test to see if enemy and player are in upper left quadrant
            if ((currentPos(1) < 7 && currentPos(2) < 7) && (player2.encounterPos(1) < 7 && player2.encounterPos(2) < 7))
                % test to see if enemy is closer left or closer upward
                if abs(currentPos(1) - player2.encounterPos(1)) < abs(currentPos(2) - player2.encounterPos(2))
                    moveSequence{1,iFlee} = 'down';
                    if currentPos(1)+1 <= 12
                        currentPos = [currentPos(1)+1, currentPos(2)];
                    else
                        moveSequence{1,iFlee} = 'dUp';
                    end
                else
                    moveSequence{1,iFlee} = 'right';
                    if currentPos(2) + 1 <= 12
                        currentPos = [currentPos(1),currentPos(2)+1];
                    else
                        moveSequence{1,iFlee} = 'dUp';
                    end
                end % abs(player1.encounterPos(1) - player2.encounterPos(1)) < abs(player1.encounterPos(2) - player2.encounterPos(2))
                % test to see if enemy and player are in upper right quadrant
            elseif ((currentPos(1) < 7 && currentPos(2) >= 7) && (player2.encounterPos(1) < 7 && player2.encounterPos(2) >= 7))
                % test to see if enemy is closer right or closer upward
                if abs(currentPos(1) - player2.encounterPos(1)) < abs(currentPos(2) - player2.encounterPos(2))
                    moveSequence{1,iFlee} = 'down';
                    if currentPos(1)+1 <= 12
                        currentPos = [currentPos(1)+1,currentPos(2)];
                    else
                        moveSequence{1,iFlee} = 'dUp';
                    end
                else
                    moveSequence{1,iFlee} = 'left';
                    if currentPos(2)-1 >= 1
                        currentPos = [currentPos(1),currentPos(2)-1];
                    else
                        moveSequence{1,iFlee} = 'dUp';
                    end
                end % abs(player1.encounterPos(1) - player2.encounterPos(1)) < abs(player1.encounterPos(2) - player2.encounterPos(2))
                % test to see if enemy and player are in lower left quadrant
            elseif ((currentPos(1) >= 7 && currentPos(2) < 7) && (player2.encounterPos(1) >= 7 && player2.encounterPos(2) < 7))
                % test to see if enemy is closer left or closer downward
                if abs(currentPos(1) - player2.encounterPos(1)) < abs(currentPos(2) - player2.encounterPos(2))
                    moveSequence{1,iFlee} = 'up';
                    if currentPos(1)-1 >= 1
                        currentPos = [currentPos(1)-1,currentPos(2)];
                    else
                        moveSequence{1,iFlee} = 'dUp';
                    end
                else
                    moveSequence{1,iFlee} = 'right';
                    if currentPos(2)+1 <= 12
                        currentPos = [currentPos(1),currentPos(2)+1];
                    else
                        moveSequence{1,iFlee} = 'dUp';
                    end
                end % abs(player1.encounterPos(1) - player2.encounterPos(1)) < abs(player1.encounterPos(2) - player2.encounterPos(2))
                % test to see if enemy and player are in lower right quadrant
            elseif ((currentPos(1) >= 7 && currentPos(2) >= 7) && (player2.encounterPos(1) >= 7 && player2.encounterPos(2) >= 7))
                % test to see if enemy is closer right or closer downward
                if abs(currentPos(1) - player2.encounterPos(1)) < abs(currentPos(2) - player2.encounterPos(2))
                    moveSequence{1,iFlee} = 'up';
                    if currentPos(1)-1 >= 1
                        currentPos = [currentPos(1)-1,currentPos(2)];
                    else
                        moveSequence{1,iFlee} = 'dUp';
                    end
                else
                    moveSequence{1,iFlee} = 'left';
                    if currentPos(2)-1 > 1
                        currentPos = [currentPos(1),currentPos(2)-1];
                    else
                        moveSequence{1,iFlee} = 'dUp';
                    end
                end % abs(player1.encounterPos(1) - player2.encounterPos(1)) < abs(player1.encounterPos(2) - player2.encounterPos(2))
                % if the enemy and character aren't in the same quadrant,
                % employ opposite corner strategy
            else
                % if opponent is in upper left quadrant, move to bottom right
                % corner
                if player2.encounterPos(1) < 7 && player2.encounterPos(2) < 7
                    % dUp if already in corner
                    if currentPos == [12,12]
                        moveSequence{1,iFlee} = 'dUp';
                        % determine if player1 is further from the corner in
                        % columns or in rows
                    elseif currentPos(1) <= currentPos(2) && (currentPos(1) ~= 1) && (currentPos(2) ~= 1)
                        moveSequence{1,iFlee} = 'down';
                        if currentPos(1) + 1 <= 12
                            currentPos = [currentPos(1)+1,currentPos(2)];
                        else
                            moveSequence{1,iFlee} = 'dUp';
                        end
                    else
                        moveSequence{1,iFlee} = 'right';
                        if currentPos(2) + 1 <= 12
                            currentPos = [currentPos(1),currentPos(2)+1];
                        else
                            moveSequence{1,iFlee} = 'dUp';
                        end
                    end % if currentPos = [12,12]
                    % if opponent is in upper right quadrant, move to bottom left
                    % corner
                elseif player2.encounterPos(1) < 7 && player2.encounterPos(2) >= 7
                    % dUp if already in corner
                    if currentPos == [12,1]
                        moveSequence{1,iFlee} = 'dUp';
                        % determine if player1 is further from the corner in
                        % columns or in rows
                    elseif currentPos(1) <= currentPos(2) && (currentPos(1) ~= 12) && (currentPos(2) ~= 12)
                        moveSequence{1,iFlee} = 'down';
                        if currentPos(1) + 1 <= 12
                            currentPos = [currentPos(1)+1,currentPos(2)];
                        else
                            moveSequence{1,iFlee} = 'dUp';
                        end
                    else
                        moveSequence{1,iFlee} = 'left';
                        if currentPos(2)-1 >= 1
                            currentPos = [currentPos(1),currentPos(2)-1];
                        else
                            moveSequence{1,iFlee} = 'dUp';
                        end
                    end % if currentPos = [12,1]
                    % if opponent is in lower left quadrant, move to top right
                    % corner
                elseif player2.encounterPos(1) >= 7 && player2.encounterPos(2) < 7
                    % dUp if already in corner
                    if currentPos == [1,12]
                        moveSequence{1,iFlee} = 'dUp';
                        % determine if player1 is further from the corner in
                        % columns or in rows
                    elseif  currentPos(1) <= currentPos(2) && (currentPos(1) ~= 12) && (currentPos(2) ~= 12)
                        moveSequence{1,iFlee} = 'right';
                        if currentPos(2)+1 <= 12
                            currentPos = [currentPos(1),currentPos(2)+1];
                        else
                            moveSequence{1,iFlee} = 'dUp';
                        end
                    else
                        moveSequence{1,iFlee} = 'up';
                        if currentPos(1)-1 >= 1
                            currentPos = [currentPos(1)-1,currentPos(2)];
                        else
                            moveSequence{1,iFlee} = 'dUp';
                        end
                    end % if currentPos = [1,12]
                    % if opponent is in lower right quadrant, move to top left
                    % corner
                elseif player2.encounterPos(1) >= 7 && player2.encounterPos(2) >= 7
                    % dUp if already in corner
                    if currentPos == [1,1]
                        moveSequence{1,iFlee} = 'dUp';
                    elseif currentPos(1) <= currentPos(2)
                        moveSequence{1,iFlee} = 'left';
                        if currentPos(2)-1 >= 1
                            currentPos = [currentPos(1),currentPos(2)-1];
                        else
                            moveSequence{1,iFlee} = 'dUp';
                        end
                    else
                        moveSequence{1,iFlee} = 'up';
                        if currentPos(1)-1 >= 1
                            currentPos = [currentPos(1)-1,currentPos(2)];
                        else
                            moveSequence{1,iFlee} = 'dUp';
                        end
                    end % if currentPos = [1,1]
                end % if player2.encounterPos(1) < 7 && player2.encounterPos(2) < 7
            end % ((player1.encounterPos(1) < 7 && player1.encounterPos(2) < 7) && (player2.encounterPos(1) < 7 && player2.encounterPos(2) < 7))
        end % for iFlee = 1:player1.speed
        
    case 'suicidal'
        % moves towards enemy with no regard to health
        movesMade = 0; % keeps track of moves made
        % this while loop will cause player1 to move towards player2 as
        % long as it is not within attack range and number of moves made is
        % less than player1 speed
        while (abs(currentPos(1)-player2.encounterPos(1)) > player1.range || abs(currentPos(2)-player2.encounterPos(2)) > player1.range) && movesMade < player1.speed
            movesMade = movesMade+1; % increment movesMade
            % evaluate if player 1 is farther away in rows than columns
            % from player 2
            if abs(currentPos(1) - player2.encounterPos(1)) > abs(currentPos(2) - player2.encounterPos(2))
                % player 1 moves down if its position is above player 2
                if currentPos(1) < player2.encounterPos(1)
                    moveSequence{1,movesMade} = 'down';
                    currentPos = [currentPos(1)+1,currentPos(2)];
                    
                else % player moves up
                    moveSequence{1,movesMade} = 'up';
                    currentPos = [currentPos(1)-1,currentPos(2)];
                    
                end % player1.encounterPos(1) < player2.encounterPos(1)
            else % will occur if player 1 is farther away in columns than rows
                % player 1 moves right if its position is left of player 2
                if currentPos(2) < player2.encounterPos(2)
                    moveSequence{1,movesMade} = 'right';
                    currentPos = [currentPos(1),currentPos(2)+1];
                else % player moves left
                    moveSequence{1,movesMade} = 'left';
                    currentPos = [currentPos(1),currentPos(2)-1];
                    
                end % player1.encounterPos(2) < player2.encounterPos(2)
            end % (abs(player1.encounterPos(1) - player2.encounterPos(1)) > abs(player1.encounterPos(2) - player2.encounterPos(2)))
            % evaluates if close enough to attack, then attacks regardless
        end % ends while not in range and still has moves
        
        % set move to 'attack' for remaining moves
        if movesMade < player1.speed
            for iAttack = movesMade+1:player1.speed
                moveSequence{1,iAttack} = 'attack';
            end % for iAttack = movesMade+1:player1.speed
        end
end % switch statement
