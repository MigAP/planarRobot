%% print all of the configurations

function  printConfigs(configs, obstacles)
  for config = configs
    printRobot(config);
    printObstacles(obstacles); 
    %pause(0.5);
    pause;
  endfor
  
endfunction
