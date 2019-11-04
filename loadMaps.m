%% Load already simulated map with differents sets of obstables and steps 
%% Name type : testX_deltaH_deltaV_

load test1_1_1.mat; % load the map 
load obstacles1_1_1.mat obstacles; %saves the map 

disp("Finding the best path..."); 
tic 
[path, map] = dijkstra(pointF, [18 5], map);
toc 
configs = getConfigs(path, map); 
printConfigs(configs, obstacles); 
