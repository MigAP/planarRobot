% Prints  the coordinates of a position
% Its adjacents positions
% and it's predecessors 

function printPosition(pos)
  % pos -> structure position of the map 
  strCoord = mat2str(pos.coord); 
  disp(['Position coordinates : ' strCoord])
  disp(["\t Adjacents " mat2str(pos.adj)])
  disp(["\t Predecessors " mat2str(pos.pred)])
  disp(["\t Explored?  " num2str(pos.exp)])
  disp(["\t Own config?  " mat2str(size(pos.ownConfigs))])
  disp(["\t configs?  " mat2str(size(pos.configs))])
  disp(["\t costs?  " mat2str(size(pos.costs))])
endfunction
