%% Transform the cartesian coordinates
%% of the robot to get the joint
%% coordinates

function jointsCoord = getJointsCoord(configs)
  base = zeros(2,size(configs,2)); % base coord 
  configs = [base; configs]; % add base coord 
  jointsCoord = zeros(4,size(configs,2)); % 4xn vector with the joint angles
  for i = 1:size(configs,2)
    jointsCoord(1,i) = atan2(configs(4,i) -configs(2,i), configs(3,i) -configs(1,i)); % q1   
    jointsCoord(2,i) = atan2(configs(6,i) -configs(4,i), configs(5,i) -configs(3,i)); % q2   
    jointsCoord(3,i) = atan2(configs(8,i) -configs(6,i), configs(7,i) -configs(5,i)); % q3   
    jointsCoord(4,i) = atan2(configs(10,i) -configs(8,i), configs(9,i) -configs(7,i)); % q4   
  endfor
endfunction
