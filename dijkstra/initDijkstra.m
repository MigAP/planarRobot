%% Initialization of the map for the Dijkstra algorithm :
% - Set the distance to zero for our initial node
% By defaults all nodes have -1 

function [map, startPos] = initDijkstra(map, start)
  startPos = findPoint(start,map);  
  map = resetExpl(map); % all the nodes are unvisited 
  if startPos == -1
    return
  endif
  map(startPos).distance = 0; 
endfunction
