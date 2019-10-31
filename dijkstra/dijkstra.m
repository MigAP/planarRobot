%% Dijkstra algorithm implementation
%% In order to find the shortes path

function [path,map] = dijkstra(startCoord, goalCoord, map)
  [map, startPos] = initDijkstra(map, startCoord);  
  currentNode = nextNode(map);  %searchs for the minimum distance node  
  currentNodePos = findPoint(currentNode.coord, map);
  map(currentNodePos).exp = 1; % mark the node as explored 
  map = updateDistances(currentNode, map);

  while !isequal(currentNode.coord,goalCoord)
    currentNode = nextNode(map); %searchs for the minimum distance node  
    %disp("Current node coord");
    %disp(currentNode.coord);
    %pause 
    currentNodePos = findPoint(currentNode.coord, map);
    map(currentNodePos).exp = 1; % mark the node as explored 
    map = updateDistances(currentNode, map); 
  endwhile
  disp("Finish path finding"); 

  path = [currentNode.coord; currentNode.distNode]; 

  while !isequal(path(end,:),startCoord)
    currentNode = map(findPoint(currentNode.distNode, map));
    path = [path; currentNode.distNode];
  endwhile
  
endfunction
