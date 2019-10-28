%% print all of the configurations

function  printConfigs(configs)
  for config = configs
    printRobot(config);
    pause(0.5);
  endfor
  
endfunction
