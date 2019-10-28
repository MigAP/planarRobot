function printRobot(conf, gridLimits)
  conf = vect2mat(conf); 
  conf = [ 0 0 ; conf]; 
  plot(conf(:,1), conf(:,2)); % print Robot
  xlim([-3, 20]);
  ylim([-3, 20]);
endfunction
