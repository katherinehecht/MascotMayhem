function [states,handles] = attack(states,handles)
% Performs a player's attack upon an encounter

% If the player is not in range, no attack will be completed and the
% console will alert the user.

playerPos = states.player.encounterPos;
encounterPos = states.currentEncounter.encounterPos;
range = states.player.range;

if abs(playerPos(1)-encounterPos(1)) > range || abs(playerPos(2)-encounterPos(2)) > range
    handles = console('You are not within range.',handles);
    
% If the player is within range, he will perform an attack.
else
    % Creates easier-to-use variable names for the pertinent values
    strength = states.player.strength;
    accuracy = states.player.accuracy;
    defense = states.currentEncounter.defense;
    
    % Calculates the amount of damage to be dealt
    dmgRange = ceil(strength - accuracy*strength/100);
    randInt = randi(dmgRange) - 1;
    dmg = strength - randInt;
    netDmg = round(dmg*(1-defense/100));
    
    % calculate and implement critical hit chance
    rng('shuffle');
    critChance = states.player.critChance;
    if randi(100) <= critChance
        netDmg = netDmg*2;
    end % if randi(100) < critChance
    
    if netDmg >= states.currentEncounter.health
        netDmg = states.currentEncounter.health;
    end
    
    % Subtracts damage done from opponent's health
    states.currentEncounter.health = states.currentEncounter.health - netDmg;
    
    console(['You deal ',num2str(netDmg),' damage!'],handles);
    
    % determine possibility of counterattack by evaluating whether or not
    % enemy D'ed Up
    counterattack = false;
    if states.currentEncounter.defense > states.currentEncounter.baseDefense
        counterattack = true;
    end
    
    % implement counterattack
    if counterattack
        if randi(100) <= states.currentEncounter.counterattack
            counterDmg = floor(states.currentEncounter.strength*.5);
            if counterDmg > states.player.health
                counterDmg = states.player.health;
            end
            states.player.health = states.player.health - (counterDmg);
            console(['Your enemy counterattacked (',num2str(counterDmg),' damage)!'],handles);
        end
    end

    % If the user kills the enemy
    if states.currentEncounter.health <= 0
        console('You have slain your enemy!',handles);
        states.inEncounter = false;
        states.player.health = states.player.maxHealth;
        states.player.wins = states.player.wins + 1;
        states.player.encounterPos = [12,1];
        % Update the statistics of the encounter so that they are saved in
        % states.encounterName instead of states.currentEncounter
        switch states.currentEncounter.name
            case 'Purple Weasel'
                states.purpleWeasel = states.currentEncounter;
            case 'Duck'
                states.duck = states.currentEncounter;
            case 'Angry Mob'
                states.angryMob = states.currentEncounter;
            case 'Zahmbie'
                states.zahmbie = states.currentEncounter;
            case 'Gentleman'
                states.gentleman = states.currentEncounter;
            case 'Juggerknott'
                states.juggerknott = states.currentEncounter;
            case 'Bear'
                states.bear = states.currentEncounter;
            case 'Lion'
                states.lion = states.currentEncounter;
            case 'Mars Rover'
                states.marsRover = states.currentEncounter;
                console('You have unleashed the anger of the professor!',handles);
                console('You''d better go find him!',handles);
            case 'Dr. Seelinger'
                states.drSeelinger = states.currentEncounter;
                console('You have just completed Mascot Mayhem!',handles);
                console('CONGRATULATIONS!!!',handles);
        end
    elseif states.player.health <= 0
        console('You have been defeated!',handles);
        states.inEncounter = false;
        states.player.health = states.player.maxHealth;
        states.player.pos = [1,1];
        states.player.encounterPos = [12,1];
    end
    
    % If the player has not killed the encounter, his moves remaining is
    % subtracted by 1.
    if states.inEncounter
        states.player.movesRemaining = states.player.movesRemaining - 1;
    end
end