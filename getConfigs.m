%% Get all the robots configurations from
%% the path given by the Dijkstra algorithm

function configs = getConfigs(path, map)
  configs = []; 

  path = flip(path); % start node is the first element 

  for i =2:(size(path,1)-1)
    currentCoord = path(i,:);
    currentNode = map(findPoint(currentCoord, map)); 
    configs = [configs getNextConfig(currentNode, path(i+1,:), map)]; %initial configuration
  endfor
  
endfunction
