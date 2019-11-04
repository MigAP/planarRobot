%% Test if a node is inside an obstacle
function test = isInsideObstacle(node, obstacles)
  test = 0; 
  for i = 1:size(obstacles,1)
    xObs = obstacles(i,1);
    yObs = obstacles(i,2);
    radius = obstacles(i,3); 
    diffX = node.coord(1)- xObs;
    diffY = node.coord(2)-  yObs;
    distance = sqrt(diffX^2 + diffY^2);

    if (distance -radius) < 0
      test = 1; 
      break
    endif
  endfor

endfunction
