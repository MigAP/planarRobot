%% Returns the distance to the obstacles
%% for each link and for each obstacle

function H2 = dist2Obstacles(Xp,Yp, obstacles)
  H2 = [];
  for i = 1:size(obstacles,1)
    xObs = ones(size(Xp))* obstacles(i,1);
    yObs = ones(size(Yp))* obstacles(i,2);
    radius = ones(size(Xp))* obstacles(i,3); 
    diffX = Xp- xObs;
    diffY = Yp- yObs;

    distance = sqrt(diffX.^2 + diffY.^2);

    H2 = [H2; distance-radius];
  endfor
endfunction
