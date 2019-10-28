% Test if point can be adjacent
function test = canBeAdj(pos, map)
  point = map(pos);
  if size(point.pred,1) <2
    test = 1;
  else
    test = 0; 
  endif
endfunction
