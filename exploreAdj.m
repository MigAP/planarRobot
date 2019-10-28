% Explore all the adjacents configurations 
% from an initial configuration of the end effector  
function [adjConfigurations, map] = exploreAdj(configPos, map, pointH, pointL, adjConfigurations)

  % If the position has been explored
  % the function returns 
  if map(configPos).exp == 1
    return
  else
    map(configPos).exp = 1; 
  endif
  xH = pointH(1); 
  yH = pointH(2);
  xL = pointL(1);
  yL = pointL(2); 

  config = map(configPos).coord; % initial configuration
  xF = config(1);
  yF = config(2);

  if(yF+1 <= yH)
    c1 = findPoint([xF yF+1],map); % first adjacent configuration
    if canBeAdj(c1, map)
      c1Point = map(c1); 
      map(configPos).adj = [map(configPos).adj; c1Point.coord];% add adj
      c1Point.pred = [c1Point.pred; map(configPos).coord]; % update pred
      map(c1) = c1Point; % update on the map 
      adjConfigurations = [adjConfigurations c1]; % Add configuration ! 
      endif
  endif

  if(xF-1 >= xL)
    c2 = findPoint([xF-1 yF],map); % first adjacent configuration
    if canBeAdj(c2, map)
      c2Point = map(c2); 
      map(configPos).adj = [map(configPos).adj; c2Point.coord]; % add adj
      c2Point.pred = [c2Point.pred; map(configPos).coord]; % update pred
      map(c2) = c2Point; % update on the map 
      adjConfigurations = [adjConfigurations c2]; % Add configuration ! 
    endif
    
  endif

  if(yF-1 >= yL)
    c3 = findPoint([xF yF-1],map); % first adjacent configuration
    if canBeAdj(c3, map)
      c3Point = map(c3); 
      map(configPos).adj = [map(configPos).adj; c3Point.coord]; % add adj
      c3Point.pred = [c3Point.pred; map(configPos).coord]; % update pred
      map(c3) = c3Point; 
      adjConfigurations = [adjConfigurations c3]; % Add configuration ! 
    endif
  endif

  if(xF+1 <= xH)
    c4 = findPoint([xF+1 yF],map); %map(first adjacent configuration
    if canBeAdj(c4, map)
      c4Point = map(c4); 
      map(configPos).adj = [map(configPos).adj; c4Point.coord]; % add adj
      c4Point.pred = [c4Point.pred; map(configPos).coord]; % update pred
      map(c4) = c4Point; 
      adjConfigurations = [adjConfigurations c4]; % Add configuration ! 
    endif
  endif
    
endfunction
