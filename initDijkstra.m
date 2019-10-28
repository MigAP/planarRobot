%% Initialization of the map for the Dijkstra algorithm :
% - Set the distance to zero for our initial node
% - and to infinity ( -1 ) for the others 
% By defaults all nodes have -1 

function [map, startPos] = initDijkstra(map, start)
  startPos = findPoint(start); 
  if startPos == -1
    return
  endif
  map(startPos).cost = 0; 

endfunction
