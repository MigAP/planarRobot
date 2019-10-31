%% Prints a circle knowing the center and the radius

function [x,y] = printCircle(xC,yC,r)
  global deltaH; 
  x = (xC-r):deltaH:(xC+r);
  y = sqrt(r^2-(x-xC).^2) + yC;
endfunction
