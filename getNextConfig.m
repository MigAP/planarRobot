%% finds the configuration from a current
%% coord, to a next coord

function config = getNextConfig(currentNode, nextCoord, map)

  for i = 1:size(currentNode.configs,2)
    configCoord = currentNode.configs(end-1:end,i)';
    if isequal(configCoord, nextCoord)
      config = currentNode.configs(:,i);
      break;
    endif
  endfor
endfunction
