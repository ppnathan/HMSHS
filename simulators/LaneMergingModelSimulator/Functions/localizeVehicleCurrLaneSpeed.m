function [eY, ePsi, coeffsCurrLane, currLane, refSpeed] = localizeVehicleCurrLaneSpeed(states,Map2,tuning)
% this function will properly localize the vehicle in all lanes 

% Outputs: 
% currLane - the current lane that the vehicle is closest to
% coeffs - 4xn array of the coefficients for each lane 
% sPositions - nx1 array of s positions of the vehicle in each lane

% grab current states of the vehicle
x       = states(1);
y       = states(2);
psi     = states(3);
car_pos = [x; y];

% tuning parameters for lane stuff
N_nodes_poly_front  = tuning(1);
N_nodes_poly_back   = tuning(2); 
N_threshold         = tuning(3);
numLanes            = Map2.N_Ways;

% initialize values of all outputs
coeffs      = zeros(4,numLanes);

% first find current lane of the vehicle and also project vehicle onto
% other lanes
dir_mot         = [cos(psi); sin(psi)];

% calculate the closest point to the current index
idx_min_vec     = zeros(numLanes,1);
lane_distances  = zeros(numLanes,1);
lane_direction  = zeros(numLanes,1);

for ii = 1:numLanes
    % check for each lane
    nodes_lane      = Map2.Nodes(:,Map2.Way_Pointers(1,ii):Map2.Way_Pointers(2,ii));
    
    % distances from current point to all relevant points
    dist_vec        = sqrt((x-nodes_lane(1,:)).^2 + (y - nodes_lane(2,:)).^2);
    
    % find minimum distance for lane
    [dist_lane, idx_min] = min(dist_vec);
    
    % figure out where the current car's position would be projected
    % onto
    idx_min_vec(ii)      = Map2.Way_Pointers(1,ii)+idx_min-1;
    lane_distances(ii)   = dist_lane;
    
    nodes_center    = Map2.Nodes(:,Map2.Way_Pointers(1,ii):Map2.Way_Pointers(2,ii));
    N_nodes_center  = size(nodes_center,2);
    
    idx_min         = min(idx_min, N_nodes_center-1);
    idx_min         = max(idx_min,2);
    
    % now figure out which direction the vehicle is heading in according
    % to the indices of the map
    vec_pos     = [nodes_center(1,idx_min+1) - nodes_center(1,idx_min); nodes_center(2,idx_min+1) - nodes_center(2,idx_min)];
    vec_neg     = [nodes_center(1,idx_min-1) - nodes_center(1,idx_min); nodes_center(2,idx_min-1) - nodes_center(2,idx_min)];
    
    % Check whether car is moving in pos or neg direction
    dotP_pos    = vec_pos'*dir_mot;
    dotP_neg    = vec_neg'*dir_mot;
    
    if dotP_pos > 0
        dir_ind = 1;
    elseif dotP_neg > 0
        dir_ind = -1;
    elseif dotP_pos == 0 && dotP_neg == 0;
        dir_ind = 1;
    else
        dir_ind = 1;
    end
    
    lane_direction(ii) = dir_ind;
    
    % specify nodes that are used for polynomial fit 
    if dir_ind == 1
        ind_start   = max(1,idx_min-N_nodes_poly_back);
        ind_end     = min(N_nodes_center,idx_min+N_nodes_poly_front);
    else
        ind_start   = max(1,idx_min-N_nodes_poly_front);
        ind_end     = min(N_nodes_center,idx_min+N_nodes_poly_back);
    end
    nodes_near  = nodes_center(:,ind_start:ind_end);

    % compute least squares fit
    R   = [cos(psi) -sin(psi); sin(psi) cos(psi)];
        
    % transform nodes into local coordinate framec
    nodes_local = R'*(nodes_near - car_pos*ones(1,size(nodes_near,2)));
    px          = nodes_local(1,:)';
    py          = nodes_local(2,:)';
    
    % compute least squares coefficients
    N           = length(px);
    H           = [ones(N,1) px px.^2 px.^3];
    coeffs_center = -(H'*H)\H'*py;
    
    % check if enough nodes were available for least squares fit
    N_nodes_near = size(nodes_near,2);
    if N_nodes_near < N_threshold
        coeffs_center(3:4) = 0;
    end
    
    coeffs(:,ii) = coeffs_center;    
end

% outputs
[~,currLane]     = min(lane_distances);
coeffsCurrLane = coeffs(:,currLane);
eY = coeffsCurrLane(1);
ePsi = atan(coeffsCurrLane(2));
refSpeed = Map2.Speed(1,idx_min_vec(currLane));
