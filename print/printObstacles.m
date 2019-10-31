function printObstacles(obstacles)
  hold on;  
  for vector = obstacles'
    [x,y] = printCircle(vector(1), vector(2), vector(3));
    line(x,y); 
    line(x,2*vector(2)-y);
  endfor
  hold off; 
endfunction
