% Creates all the possible 
% configurations of the end effector
% with their respective adjacents configurations 

function map = createAllConfig(map, pointF, pointH, pointL, initConfig, obstacles)
  nbPoints = size(map); % total number of points to explore
  adjConfig = []; 

  %Initial run
  initPos = findPoint(pointF,map); % position of the initial node 
  map(initPos).ownConfigs = initConfig;  
  [adjConfig, map] = exploreAdj(initPos, map, pointH, pointL, adjConfig, obstacles); 
  configPos = adjConfig(1);
  adjConfig = adjConfig(2:end); % remove explored configuration 
  % Debug
  %disp('Next point to expand:');
  %disp(map(configPos).coord); 

  while (size(adjConfig,1) != 0)
    [adjConfig, map] = exploreAdj(configPos, map, pointH, pointL, adjConfig, obstacles);

    if size(adjConfig,2) == 1
      configPos = adjConfig(1);
      [adjConfig, map] = exploreAdj(configPos, map, pointH, pointL, adjConfig, obstacles);
      break
    else
      configPos = adjConfig(1);
      adjConfig = adjConfig(2:end); % remove explored cnofigruation
    endif
    
    % Debug
    %disp('Next point to expand:');
    %disp(map(configPos).coord); 
  endwhile
endfunction
