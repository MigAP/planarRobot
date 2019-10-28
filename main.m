%%%% Path planning trajectory example 

% Input Data
pointH = [20 20]; % max point of the grid
pointL = [0 0]; % min point of the grid  
pointF = [13 16]; % initial feasible end effector point 
N=1; % number of points per axis in order to calculate the deltas 
deltaH=1;
deltaV=1;
q=39;% number of obstacles
r=1; % radius of the obstacles
global l = [ 10 7 7 7 ]; % values of the links l_i 
Cf = [5.9;  8.0; 0  ;  11.7; 6  ;  15.2; 13 ;  16]; % initial feasible configuration 
global ub = [pointH pointH pointH];
global lb = [pointL pointL pointL]; 

%printRobot(Cf); 

% Optimization
H = [13;17]; % Coordinates of the end-point
             % Possible next adjacent configuration 
%{
f = @(X) objFunc(X,H,Cf); 
gFunc = @(X) equal(X,H,l); % equality constraint  
h = @(X) inequality(X,H,Cf,1); % positive constraint 
X0 = Cf(1:end-2); % initial feasible configuration 

[y, obj, info, iter, nf, lambda]  = sqp(X0, f,gFunc, [], lb,ub);   
nbIter = 100; % number of iterations allowed 
tol = 1e-12; % tolerance of the stopping criteria 
[x, obj, info, iter]  = sqp(X0, f,gFunc,h, lb,ub,nbIter,tol)    

figure(2);
printRobot([x;H]); 
%}

config = calculateConfiguration(Cf, H); 
%printRobot(config);  

% Main program

map = mapGeneration(pointH, pointL, deltaH, deltaV); % generates discretized map 
map = createAllConfig(map, pointF, pointH, pointL, Cf); % creates all the adj configuration relations  
map = mapExpansion(map, findPoint(pointF, map), Cf); % calculates the configurations and the costs for all the nodes  

