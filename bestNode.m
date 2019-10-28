%% Finds the next best Node in the map

function nextNode = bestNode(currentNode)
  [minCost, index] = min(currentNode.cost); % finds the minimun cost and its index 
  nextNode = currentNode.adj(index); 
endfunction
