%% Reset map nodes exploration

function map = resetExpl(map)
  for i = 1:size(map,2)
    map(i).exp = 0;
  endfor
endfunction
