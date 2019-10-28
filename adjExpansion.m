%% Takes a node and investigates its adjacents nodes

function [map, toExplNodes] = adjExpansion(map,initialNodePos, toExplNodes)
  % If the position has been explored
  % the function returns 
  if map(initialNodePos).exp == 1
    return
  else
    map(initialNodePos).exp = 1; 
  endif
  initialNode = map(initialNodePos); 
  %disp("Node coord ");
  %disp(mat2str(initialNode.coord)); 
  adjNodes = initialNode.adj; 
  toExplNodes =  [toExplNodes;  adjNodes]; 

  if size(initialNode.ownConfigs, 2) == 1
    initConfig = initialNode.ownConfigs;
  else
    initConfig = initialNode.ownConfigs(:,2);
  endif

  %% Treatment for all the nodes 
  for i = 1:size(initialNode.adj,1)
    adjNodeCoord = initialNode.adj(i,:);  
    adjNodePos = findPoint(adjNodeCoord, map); % get Node position 
    config = calculateConfiguration(initConfig, adjNodeCoord'); % configuration calculation 
    map(adjNodePos).ownConfigs = [map(adjNodePos).ownConfigs config]; 
    map(initialNodePos).configs = [map(initialNodePos).configs config]; % add configuration to the node 
    map(initialNodePos).costs = [map(initialNodePos).costs calculateWeight(config, initConfig)]; % add configuration to the node 
  endfor
endfunction
