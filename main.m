%%%% Path planning trajectory example 
addpath("./optimization");
addpath("./dijkstra");
addpath("./print");


% Input Data
pointH = [20 20]; % max point of the grid
pointL = [-3 -3]; % min point of the grid  
pointF = [13 16]; % initial feasible end effector point 
N=1; % number of points per axis in order to calculate the deltas 
global deltaH=1;
global deltaV=1;
q=39;% number of obstacles
r=1; % radius of the obstacles
global l = [ 10 7 7 7 ]; % values of the links l_i 
Cf = [5.9;  8.0; 0  ;  11.7; 6  ;  15.2; 13 ;  16]; % initial feasible configuration 
global ub = [pointH pointH pointH];
global lb = [pointL pointL pointL]; 


%Obstacles : x, y and radius 
obstacles = [[6 2 0.5];
	     [13 9 2];
	     [16 18 1]]; 
%obstacles = []; 
%printRobot(Cf); 
%printObstacles(obstacles); 

% Optimization
H = [13;17]; % Coordinates of the end-point
             % Possible next adjacent configuration 

%config = calculateConfiguration(Cf, H, obstacles); 
%printRobot(config);  
%printObstacles(obstacles); 

% Main program
disp("Map generation..."); 
tic; 
map = mapGeneration(pointH, pointL, deltaH, deltaV); % generates discretized map 
map = createAllConfig(map, pointF, pointH, pointL, Cf); % creates all the adj configuration relations  
toc; 


disp("Calculating all the robot configurations..."); 
tic 
map = mapExpansion(map, findPoint(pointF, map), Cf, obstacles); % calculates the configurations and the costs for all the nodes  
toc 

disp("Finding the best path..."); 
tic 
[path, map] = dijkstra(pointF, [18 5], map);
toc 
configs = getConfigs(path, map); 
printConfigs(configs, obstacles); 
