function states = startup
%% MascotMayhem.m
% Group 10

% This function is called upon startup of GameTool.m. It initializes the
% positions and properties of each encounter on the 50x50 gameboard and the
% stats of the player. All of this information is stored in the structured
% variable called 'states', and states is passed to the GameTool GUI
% program.

% For a better picture of how states contains the other variables, notice
% how in the first few lines of code below, we create a structured variable
% called 'player'. That variable is a structured variable within a
% structured variable (player is within states). This works the same way
% that handles does. We did this so that we could pass all of this
% information in this function to GameTool.m very easily just by containing
% it all in one variable, 'states'.


rng('shuffle')

%% Initialization of starting game state

states.worldArray = zeros(50); % Initialization of open world
states.encounterArray = zeros(12); % Initialization of encounter board

states.player.pos = [1,1]; % Player's position in the open world
states.player.encounterPos = [12,1]; % Player's position in first encounter
states.player.maxHealth = 100; % Maximum health the player can have
states.player.health = 100; % Not necessarily a percentage
states.player.accuracy = 75; % Percentage of maximum hit that is the lower bound
% for each hit. Ex: A player with strength 20 and accuracy 75 will hit with
% a random number between 15 and 20 each time before defense is factored in
states.player.strength = 15; % Maximum hit the player can deal
states.player.baseDefense = 20; % Percentage of opponent's hits that is mitigated
states.player.defense = 20;
states.player.speed = 1; % Number of tiles moved per turn; slow, normal, fast, heck-a fast
states.player.critChance = 10; % Percent chance of dealing double damage
states.player.range = 1; % Number of tiles a player can reach with an attack
states.player.counterattack = 5; % Percentage chance of an attack during a dUp
states.player.wins = 0; % Counter that keeps track of victories for the purpose of unlocking bonuses
states.player.movesRemaining = states.player.speed; % The number of moves
% that the player has remaining in his current turn when he is in an
% encounter. This variable will decrease by 1 every times he makes a
% movement, and once it reaches 0, his turn will end.
states.player.healRate = 5; % Amount of health the player heals per turn
states.inEncounter = false; % Whether the player is in an encounter
states.inBonus = false; % Whether the player is in a bonus or not
states.bonus1received = false;
states.bonus2received = false;
states.bonus3received = false;  % Initializes all the bonuses
states.bonus4received = false;
states.bonus5received = false;
states.bonus6received = false;
states.bonus7received = false;
states.playerTurn = 0; % Turn number used in battles
states.encounterTurn = 0; % Turn number used in battles

% Placement of encounters on open world map
states.positions{1} = [randi(10) + 40, randi(10) + 40]; % Rover is placed near
% the lower right-hand corner of the map
encountersPlaced = 1; % Number of encounters that have been placed so far

% This loop places the encounters on the board
while encountersPlaced < 17
    encountersPlaced = encountersPlaced + 1;
    rowPos = randi(50);
    colPos = randi(50);
    
    % This loop makes sure that no two encounters are within three squares
    % of each other
    for i=1:encountersPlaced-1
        if abs(rowPos-states.positions{i}(1)) <= 3 && abs(colPos-states.positions{i}(2)) <=3
            encountersPlaced = encountersPlaced - 1;
            
        % Makes sure that no encounter is too close to the player's
        % starting position
        elseif rowPos < 4 && colPos < 4
            encountersPlaced = encountersPlaced - 1;
            
        else
            states.positions{encountersPlaced} = [rowPos,colPos];
        end
    end
    
end

%% Assign positions to each mascot

% Switch the Mars Rover's position with the position of the tenth
% encounter. This will be more logical for other parts of the program.
pos1 = states.positions{1};
states.positions{1} = states.positions{9};
states.positions{9} = pos1;

states.purpleWeasel.pos = states.positions{1};
states.duck.pos = states.positions{2};
states.angryMob.pos = states.positions{3};
states.zahmbie.pos = states.positions{4};
states.gentleman.pos = states.positions{5};
states.juggerknott.pos = states.positions{6};
states.bear.pos = states.positions{7};
states.lion.pos = states.positions{8};
states.marsRover.pos = states.positions{9};
states.drSeelinger.pos = states.positions{10};

states.purpleWeasel.encounterPos = [1,12];
states.duck.encounterPos = [1,12];
states.angryMob.encounterPos = [1,12];
states.zahmbie.encounterPos = [1,12];
states.gentleman.encounterPos = [1,12];
states.juggerknott.encounterPos = [1,12];
states.bear.encounterPos = [1,12];
states.lion.encounterPos = [1,12];
states.marsRover.encounterPos = [1,12];
states.drSeelinger.encounterPos = [1,12];

% Changes the value of the worldArray element for each encounter's position
% to that encounter's number.
% e.g. If marsRover's position is (45,47), then worldArray(45,47) = 9
for i=1:17
    states.worldArray(states.positions{i}(1),states.positions{i}(2)) = i;
end

%% Purple Weasel stats

states.purpleWeasel.maxHealth = 30;
states.purpleWeasel.health = 30;
states.purpleWeasel.accuracy = 45;
states.purpleWeasel.strength = 5;
states.purpleWeasel.defense = 20;
states.purpleWeasel.baseDefense = 20;
states.purpleWeasel.speed = 2;
states.purpleWeasel.critChance = 10;
states.purpleWeasel.range = 1;
states.purpleWeasel.healRate = 1;
states.purpleWeasel.counterattack = 10;
states.purpleWeasel.strategy = 'suicidal';

%% Duck stats

states.duck.maxHealth = 35;
states.duck.health = 35;
states.duck.accuracy = 50;
states.duck.strength = 5;
states.duck.defense = 20;
states.duck.baseDefense = 20;
states.duck.speed = 1;
states.duck.critChance = 15;
states.duck.range = 2;
states.duck.healRate = 1;
states.duck.counterattack = 15;
states.duck.strategy = 'flee';

%% Angry Mob stats

states.angryMob.maxHealth = 60;
states.angryMob.health = 60;
states.angryMob.accuracy = 60;
states.angryMob.strength = 12;
states.angryMob.defense = 30;
states.angryMob.baseDefense = 30;
states.angryMob.speed = 2;
states.angryMob.critChance = 10;
states.angryMob.range = 1;
states.angryMob.healRate = 10;
states.angryMob.counterattack = 5;
states.angryMob.strategy = 'passive';

%% Zahmbie stats

states.zahmbie.maxHealth = 65;
states.zahmbie.health = 65;
states.zahmbie.accuracy = 60;
states.zahmbie.strength = 14;
states.zahmbie.defense = 35;
states.zahmbie.baseDefense = 35;
states.zahmbie.speed = 2;
states.zahmbie.critChance = 15;
states.zahmbie.range = 1;
states.zahmbie.healRate = 10;
states.zahmbie.counterattack = 7;
states.zahmbie.strategy = 'active';

%% Gentleman stats

states.gentleman.maxHealth = 65;
states.gentleman.health = 65;
states.gentleman.accuracy = 60;
states.gentleman.strength = 15;
states.gentleman.defense = 40;
states.gentleman.baseDefense = 40;
states.gentleman.speed = 2;
states.gentleman.critChance = 15;
states.gentleman.range = 2;
states.gentleman.healRate = 12;
states.gentleman.counterattack = 10;
states.gentleman.strategy = 'neutral';

%% Juggerknott stats

states.juggerknott.maxHealth = 72;
states.juggerknott.health = 72;
states.juggerknott.accuracy = 65;
states.juggerknott.strength = 15;
states.juggerknott.defense = 45;
states.juggerknott.baseDefense = 45;
states.juggerknott.speed = 2;
states.juggerknott.critChance = 20;
states.juggerknott.range = 2;
states.juggerknott.healRate = 10;
states.juggerknott.counterattack = 25;
states.juggerknott.strategy = 'passive';

%% Bear stats

states.bear.maxHealth = 75;
states.bear.health = 75;
states.bear.accuracy = 60;
states.bear.strength = 17;
states.bear.defense = 40;
states.bear.baseDefense = 40;
states.bear.speed = 2;
states.bear.critChance = 30;
states.bear.range = 3;
states.bear.healRate = 7;
states.bear.counterattack = 90;
states.bear.strategy = 'suicidal';

%% Lion stats

states.lion.maxHealth = 80;
states.lion.health = 80;
states.lion.accuracy = 70;
states.lion.strength = 20;
states.lion.defense = 50;
states.lion.baseDefense = 50;
states.lion.speed = 3;
states.lion.critChance = 40;
states.lion.range = 3;
states.lion.healRate = 10;
states.lion.counterattack = 92;
states.lion.strategy = 'active';

%% Mars Rover stats

states.marsRover.maxHealth = 85;
states.marsRover.health = 85;
states.marsRover.accuracy = 75;
states.marsRover.strength = 22;
states.marsRover.defense = 60;
states.marsRover.baseDefense = 60;
states.marsRover.speed = 3;
states.marsRover.critChance = 45;
states.marsRover.range = 4;
states.marsRover.healRate = 12;
states.marsRover.counterattack = 93;
states.marsRover.strategy = 'passive';

%% Dr. Seelinger stats

states.drSeelinger.maxHealth = 100;
states.drSeelinger.health = 100;
states.drSeelinger.accuracy = 99; % #SeelingerDontMiss
states.drSeelinger.strength = 25;
states.drSeelinger.defense = 65;
states.drSeelinger.baseDefense = 70;
states.drSeelinger.speed = 4;
states.drSeelinger.critChance = 50;
states.drSeelinger.range = 4;
states.drSeelinger.healRate = 15;
states.drSeelinger.counterattack = 99;
states.drSeelinger.strategy = 'suicidal';

%% Bonuses

states.bonus1.pos = states.positions{11};
states.bonus2.pos = states.positions{12};
states.bonus3.pos = states.positions{13};
states.bonus4.pos = states.positions{14};
states.bonus5.pos = states.positions{15};
states.bonus6.pos = states.positions{16};
states.bonus7.pos = states.positions{17};
