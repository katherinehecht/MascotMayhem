function [states,handles,player1] = encounterAttack(states,handles,player1)
% Attack function for when an enemy is attacking the player

% Creates easier-to-use variable names for the pertinent values
strength = player1.strength;
accuracy = player1.accuracy;
defense = states.player.defense;

% Calculates the amount of damage to be dealt
dmgRange = ceil(strength - accuracy*strength/100);
randInt = randi(dmgRange) - 1;
dmg = strength - randInt;
netDmg = round(dmg*(1-defense/100));

if netDmg >= states.player.health
    netDmg = states.player.health;
end

% Subtracts damage done from player's health
states.player.health = states.player.health - netDmg;

console(['You have taken ',num2str(netDmg),' damage!'],handles);

% determine possibility of counterattack by evaluating whether or not
% enemy D'ed Up
counterattack = false;
if states.player.defense > states.player.baseDefense
    counterattack = true;
end

% implement counterattack
if counterattack
    if randi(100) <= states.player.counterattack
        counterDmg = floor(states.player.strength*.5);
        if counterDmg > player1.health
            counterDmg = player1.health;
        end
        player1.health = player1.health - counterDmg;
        console(['You executed a counterattack (',num2str(counterDmg),' damage)!'],handles);
    end
end

if states.player.health <= 0
    console('You have been defeated!',handles);
    states.inEncounter = false;
    states.player.health = states.player.maxHealth;
    states.player.pos = [1,1];
    states.player.encounterPos = [12,1];
    
elseif player1.health <=0
    console('You have slain your enemy!',handles);
    states.inEncounter = false;
    states.player.health = states.player.maxHealth;
    states.player.encounterPos = [12,1];
    states.player.wins = states.player.wins + 1;
    
    % Update the statistics of the encounter so that they are saved in
    % states.encounterName instead of player1
    switch player1.name
        case 'Purple Weasel'
            states.purpleWeasel = player1;
        case 'Duck'
            states.duck = player1;
        case 'Angry Mob'
            states.angryMob = player1;
        case 'Zahmbie'
            states.zahmbie = player1;
        case 'Gentleman'
            states.gentleman = player1;
        case 'Juggerknott'
            states.juggerknott = player1;
        case 'Bear'
            states.bear = player1;
        case 'Lion'
            states.lion = player1;
        case 'Mars Rover'
            states.marsRover = player1;
            console('You have unleashed the anger of the professor!',handles);
            console('You''d better go find him!',handles);
        case 'Dr. Seelinger'
            states.drSeelinger = player1;
            console('You have just completed Mascot Mayhem!',handles);
            console('CONGRATULATIONS!!!',handles);
    end
end