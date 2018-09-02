function [states, handles] = bonus1(states, handles)
% Administers a bonus to the player once they have the proper
% qualifications to receive it

% I commented two of the bonuses to explain how they work; the rest are
% just copies, they have the same logic behind them.

if states.player.pos == states.positions{11}
    % Checks to see if the player is on the first bonus positon
    % (states.positions.11)
    
    if states.player.wins >= 1
        % Checks to see if the player has received the proper # of wins
        
        if ~states.bonus1received
            % Checks to see if the player has not received the bonus yet
            
            states.player.health = states.player.health + 50;
            states.player.maxHealth = states.player.maxHealth + 50;
            % Gives the player his/her bonus
            
            console('Out of the woods appears the former Chief Technology Officer of Boeing.', handles);
            pause(1)
            console('He has come to impart engineering knowledge and give you a bonus.', handles);
            pause(1)
            console('"The 787 Dreamliner uses electrical flight systems. . ." he says.', handles);
            pause(2)
            console('. . .', handles);
            pause(1)
            console('You have received +50 health.', handles);
            % Notifies the player of their bonus acquisition
            
            states.bonus1received = true;
            % Sets it so that the game knows the player has received their
            % bonus
            
        else
            console('You''ve already received this bonus!', handles);
            % Displayed if the player attempts to receive the bonus again
            
        end
    else
        winsRemaining = 1 - states.player.wins;
        % Creates a variable for the # of wins to be achieved before the player
        % is eligible for this bonus.
        
        message1 = 'You have not defeated enough opponents yet.';
        message2 = ['You must defeat ',num2str(winsRemaining),' more opponent(s) to receive this bonus.'];
        console(message1, handles);
        pause(1)
        console(message2, handles);
        % Displays a message that informs the user of their need to achieve
        % more victories    
    end
elseif states.player.pos == states.positions{12}
    if states.player.wins >= 2
        if ~states.bonus2received
            states.player.speed = states.player.speed + 1;
            states.player.movesRemaining = states.player.speed;
            console('You come upon Blessed Fr. Basil Moreau, who is giving a TED Talk.', handles);
            pause(1)
            console('"Set up a regular sleep schedule if you Moreau what''s good for you!" he says.', handles);
            pause(1)
            console('That god-awful joke causes you to run away.', handles);
            pause(1)
            console('You ran so fast your speed increased by 1.', handles);
            states.bonus2received = true;
        else
            console('You''ve already received this bonus!', handles);
        end
    else
        winsRemaining = 2 - states.player.wins;
        message1 = 'You have not defeated enough opponents yet.';
        message2 = ['You must defeat ',num2str(winsRemaining),' more opponent(s) to receive this bonus.'];
        console(message1, handles);
        pause(1)
        console(message2, handles);
    end
elseif states.player.pos == states.positions{13}
    % Checks to see if the player is on the second bonus positon
    % (states.positions.12)
    
    if states.player.wins >= 5
        % Checks to see if the player has received the proper # of wins
        
        if ~states.bonus3received
            % Checks to see if the player has not received the bonus yet
            
            states.player.strength = states.player.strength + 15;
            states.player.speed = states.player.speed + 1;
            states.player.movesRemaining = states.player.speed;
            % Gives the player his/her bonus
            
            console('You have been visited by Professor Lent!', handles);
            pause(1)
            console('He is here to increase your speed, just like you increase the speed of his videos.', handles);
            pause(1)
            console('Your strength has increased by 15 and your speed has increased by 1!', handles);
            % Notifies the player of their bonus acquisition
            
            states.bonus3received = true;
            % Sets it so that the game knows the player has received their
            % bonus
            
        else
            console('You''ve already received this bonus!', handles);
            % Displayed if the player attempts to receive the bonus again
        end
    else
        winsRemaining = 5 - states.player.wins;
        % Creates a variable for the # of wins to be achieved before the player
        % is eligible for this bonus.
        
        message1 = 'You have not defeated enough opponents yet.';
        message2 = ['You must defeat ',num2str(winsRemaining),' more opponent(s) to receive this bonus.'];
        console(message1, handles);
        pause(1)
        console(message2, handles);
        % Displays a message that informs the user of their need to achieve
        % more victories
    end
elseif states.player.pos == states.positions{14}
    if states.player.wins >= 8
        if ~states.bonus4received
            states.player.defense = states.player.defense + 20;
            states.player.range = states.player.range + 1;
            states.player.strength = states.player.strength + 10;
            console('The Morrissey Manor has appeared to gift you a bonus!', handles);
            pause(1)
            console('The Manor rips itself out of its foundation and runs over to you.', handles);
            pause(1)
            console('"I should not be a sentient being," he says.',handles);
            pause(1)
            console('There is no explanation for this.',handles);
            pause(2)
            console('Your defense has increased by 20.', handles);
            pause(1)
            console('Your range has increased by 1.', handles);
            pause(1)
            console('Your strength has increased by 10.', handles);
            states.bonus4received = true;
        else
            console('You''ve already received this bonus!', handles);
        end
    else
        winsRemaining = 8 - states.player.wins;
        message1 = 'You have not defeated enough opponents yet.';
        message2 = ['You must defeat ',num2str(winsRemaining),' more opponent(s) to receive this bonus.'];
        console(message1, handles);
        pause(1)
        console(message2, handles);
    end
elseif states.player.pos == states.positions{15}
    if states.player.wins >= 9
        if ~states.bonus5received
            states.player.speed = states.player.speed + 1;
            states.player.movesRemaining = states.player.speed;
            states.player.range = states.player.range + 2;
            states.player.health = states.player.health + 50;
            states.player.maxHealth = states.player.maxHealth + 50;
            console('You have been visited by Andrew "The Sock" Sockamann.',handles);
            pause(1)
            console('He is preparing to fight in the Robo-Squid War.', handles);
            pause(1)
            console('"Take these armaments from the barracks," says Sock Man.', handles);
            pause(1)
            console('Your speed has increased by 1.', handles);
            pause(1)
            console('Your range has been increased by 2.', handles);
            pause(1)
            console('Your health has increased by 50.', handles);
            states.bonus5received = true;
        else
            console('You''ve already received this bonus!', handles);
        end
    else
        winsRemaining = 9 - states.player.wins;
        message1 = 'You have not defeated enough opponents yet.';
        message2 = ['You must defeat ',num2str(winsRemaining),' more opponent(s) to receive this bonus.'];
        console(message1, handles);
        pause(1)
        console(message2, handles);
    end    
elseif states.player.pos == states.positions{16}
    if states.player.wins >= 0
        if ~states.bonus6received
            % Bonus 1
            states.player.health = states.player.health + 50;
            states.player.maxHealth = states.player.maxHealth + 50;
            % Bonus 2
            states.player.speed = states.player.speed + 1;
            states.player.movesRemaining = states.player.speed;
            % Bonus 3
            states.player.strength = states.player.strength + 15;
            states.player.speed = states.player.speed + 1;
            states.player.movesRemaining = states.player.speed;
            % Bonus 4
            states.player.defense = states.player.defense + 20;
            states.player.range = states.player.range + 1;
            states.player.strength = states.player.strength + 10;
            % Bonus 5
            states.player.speed = states.player.speed + 1;
            states.player.movesRemaining = states.player.speed;
            states.player.range = states.player.range + 2;
            states.player.health = states.player.health + 50;
            states.player.maxHealth = states.player.maxHealth + 50;
            % Console
            console('Super bonus received.',handles);
            states.bonus6received = true;
        else
            console('You''ve already received this bonus!',handles)
        end
    else
        winsRemaining = 0 - states.player.wins;
        message1 = 'You have not defeated enough opponents yet.';
        message2 = ['You must defeat ',num2str(winsRemaining),' more opponent(s) to receive this bonus.'];
        console(message1, handles);
        pause(1)
        console(message2, handles);
    end
elseif states.player.pos == states.positions{17}
    if states.player.wins >= 0
        if ~states.bonus7received
            % Bonus 1
            states.player.health = states.player.health + 50;
            states.player.maxHealth = states.player.maxHealth + 50;
            % Bonus 2
            states.player.speed = states.player.speed + 1;
            states.player.movesRemaining = states.player.speed;
            % Console
            console('Super bonus received (Gentleman).',handles);
            states.bonus7received = true;
        else
            console('You''ve already received this bonus!',handles);
        end
    else
        winsRemaining = 0 - states.player.wins;
        message1 = 'You have not defeated enough opponents yet.';
        message2 = ['You must defeat ',num2str(winsRemaining),' more opponent(s) to receive this bonus.'];
        console(message1, handles);
        pause(1)
        console(message2, handles);
    end
end

    

