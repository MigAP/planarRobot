%% Update the distances of the explored nodes

function map = updateDistances(currentNode, map)

  for i = 1:size(currentNode.adj,1)
    adjNodesPos = findPoint(currentNode.adj(i,:),map); 

    if map(adjNodesPos).exp == 0
      if map(adjNodesPos).distance == -1
        map(adjNodesPos).distance = currentNode.costs(i) + currentNode.distance;
        map(adjNodesPos).distNode = currentNode.coord;
      elseif  map(adjNodesPos).distance > (currentNode.costs(i) + currentNode.distance) 
        map(adjNodesPos).distance = currentNode.distance +currentNode.costs(i); 
        map(adjNodesPos).distNode = currentNode.coord;
      else
        continue;
      endif
    endif
    
  endfor

endfunction
