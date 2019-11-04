% Test if point can be adjacent
function test = canBeAdj(pos, map, obstacles)
  point = map(pos);
  if size(point.pred,1) <2 % Test if the node has more than two adj Node 
    if isInsideObstacle(point, obstacles) % if the node is inside obstacle 
      test = 0;
    else
      test = 1;
    endif
  else
    test = 0; 
  endif
endfunction
