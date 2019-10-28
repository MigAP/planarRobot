%% From all the unvisited nodes
%% it selects the one with the smallest distance

function currentNode = nextNode(map)
  currentNode = map(1); 
  minDistance = currentNode.distance; 

  for i = 2:size(map,2)
    if (map(i).exp == 0)
      if (map(i).distance >= 0 && map(i).distance < minDistance)
	currentNode = map(i);
        minDistance = currentNode.distance;
      elseif (map(i).exp >= 0 && minDistance == -1)
	currentNode = map(i);
        minDistance = currentNode.distance;
      endif
    endif
  endfor
endfunction
