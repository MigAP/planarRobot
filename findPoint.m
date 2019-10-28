%Finds the position of a Point in the map 
% returns -1 if no position found 
function pos = findPoint(point, map)
  pos = -1; 
  for i=1:size(map,2)
    if isequal(point,map(i).coord)
      pos =i;
      break
    endif
  endfor
endfunction
