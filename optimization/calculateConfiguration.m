%% Calculates the robot configuration from an initial node
%% to an adjancet node

function config = calculateConfiguration(initConfig, adjNodeCoord, obstacles)
  global l;
  global ub;
  global lb; 
  rmin = 2; %minimum radius of obstacles
 
  H = adjNodeCoord; % Coordinates of the end-point
                    % Where we want to go 

  f = @(X) objFunc(X,H,initConfig); % objective function 
  gFunc = @(X) equal(X,H,l); % equality constraints  
  h = @(X) inequality(X,H,initConfig,rmin, obstacles); % positive constraints 

  X0 = initConfig(1:end-2); % initial feasible configuration
                            % without end effector coordinates 
  nbIter = 1000; % number of iterations allowed 
  tol = 1e-15; % tolerance of the stopping criteria 
  try
    [x, obj, info, iter]  = sqp(X0, f,gFunc,h, lb,ub,nbIter,tol);
  catch
    disp("Solution not found");
  end_try_catch
  config = [x;H]; 
  
  %printRobot([x;H]); 
endfunction
