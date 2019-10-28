%% Calculates the weight bewteen two nodes

function weight = calculateWeight(config1,config2)
  config1 = vect2mat(config1); % x first row, y second
  config2 = vect2mat(config2); 

  Xk = config1(:,1); 
  Yk = config1(:,2); 
  Xp = config2(:,1); 
  Yp = config2(:,2); 
  weight = sum( (Xk-Xp).^2 + (Yk-Yp).^2 ); 

endfunction
