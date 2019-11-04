%Map generation taking into account the limits 
function map = mapGeneration(pointH, pointL,deltaH, deltaV)
  xH = pointH(1); 
  yH = pointH(2);
  xL = pointL(1);
  yL = pointL(2); 

  nbPointsH = int32 ( (xH-xL)/deltaH+1);
  nbPointsV = int32 ( (yH-yL)/deltaV+1);
  nbPoints =nbPointsH* nbPointsV; 

  %map = zeros(1,2,nbPoints);
  j=0;
  k=0; 
  for i=0:nbPoints-1
    if yL+k*deltaH > yH
      j = j+1; 
      k = 0; 
    endif
    %map(:,:,i+1) = [xL+j*deltaH yL+k*deltaV];
    map(i+1).coord = [yL+k*deltaV  xL+j*deltaH];
    map(i+1).adj =[]; % adjacent positions  
    map(i+1).configs = []; % configurations of the adj. pos.
    map(i+1).ownConfigs = []; % configurations of the node, at max 2 
    map(i+1).pred = []; % predecesors positions, at max 2 
    map(i+1).exp = 0; % to know if the position has been explored 
    map(i+1).costs = []; % for dijkstra algorithm 
    map(i+1).distance =-1 ; % for dijkstra algorithm 
    map(i+1).distNode =[] ; % smallest distance predecessor  
    k = k+1; 
  endfor
endfunction
