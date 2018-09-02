function [player1,player2] = attackS(player1,player2)
% USED FOR SIMULATIONS
% Performs player1's attack on player 2 and returns both players as outputs
% We already know that the attacker is within range because that is
% evaluated in the playerMove function.

% Creates easier-to-use variable names for the pertinent values
strength = player1.strength;
accuracy = player1.accuracy;
defense = player2.defense;

% Calculates the amount of damage to be dealt
dmgRange = ceil(strength - accuracy*strength/100);
randInt = randi(dmgRange) - 1;
dmg = strength - randInt;
netDmg = round(dmg*(1-defense/100));

% calculate and implement critical hit chance
rng('shuffle');
critChance = player1.critChance;
if randi(100) < critChance
    netDmg = netDmg*2;
end % if randi(100) < critChance

if netDmg >= player2.health
    netDmg = player2.health;
end

% Subtracts damage done from opponent's health
player2.health = player2.health - netDmg;

% determine possibility of counterattack by evaluating whether or not player
% 2 D'ed Up
counterattack = false;
if player2.defense > player2.baseDefense
    counterattack = true;
end

% implement counterattack
if counterattack == true
    if randi(100) < player2.critChance
        player1.health = player1.health - (floor(player2.strength*.5));
    end
end



