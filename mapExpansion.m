%% Goes through all the nodes of the map
%% starting from the initial node

function [map] = mapExpansion(map, initialNodePos, Cf, obstacles)
  map = resetExpl(map); 
  toExplNodes = []; % nodes to explore FIFO list 

  %% Initial run
  [map, toExplNodes] = adjExpansion(map, initialNodePos, toExplNodes, obstacles);
  initialNodePos = findPoint(toExplNodes(1,:),map); 
  if initialNodePos == -1
    disp('Error, Node not found in mapExpansion.m');
  endif
  toExplNodes = toExplNodes(2:end,:); 
  %i = 1; 
  while (size(toExplNodes,1) != 0)
    [map, toExplNodes] = adjExpansion(map, initialNodePos, toExplNodes, obstacles);
    %i = i+1; 
    %printStr = ["Step number " num2str(i) ", toExpl =  " mat2str(toExplNodes)]; 
    %disp(printStr);  
    
    initialNodePos = findPoint(toExplNodes(1,:), map);
    if initialNodePos == -1
      disp('Error, Node not found in mapExpansion.m');
    endif
    toExplNodes = toExplNodes(2:end, :); 
  end
  
endfunction
