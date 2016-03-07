function [rel_dist, rel_speed, rel_dist3, rel_speed3] = RadarCameraFusion(rel_dist_c, rel_speed_c, rel_dist_r, rel_speed_r, speed_ego, params, dtLocal)
%#codegen

persistent rel_dist_prev

persistent rel_speed_prev

persistent iterations_no_vehicle
if isempty(iterations_no_vehicle)
    iterations_no_vehicle = 0;
end

% Outputs

if ~isempty(rel_dist_r) && ~isempty(rel_dist_c)
    % Main sensor: Radar
    radar_found_target = ((rel_dist_r~=255) & (rel_dist_r~=0));
    use_radar = radar_found_target;
    use_camera = ~use_radar;
%     % Main sensor: Camera
%     camera_found_target = rel_dist_c~=0;
%     use_camera = camera_found_target;
%     use_radar = ~use_camera;
    
    % Fuse
    rel_dist = use_radar.*rel_dist_r + use_camera.*rel_dist_c;
    rel_speed = use_radar.*rel_speed_r + use_camera.*rel_speed_c;
elseif ~isempty(rel_dist_r)
    rel_dist = rel_dist_r;
    rel_speed = rel_speed_r;
elseif ~isempty(rel_dist_c)
    rel_dist = rel_dist_c;
    rel_speed = rel_speed_c;
end

if isempty(rel_dist_prev)
    rel_dist_prev = rel_dist;
end
if isempty(rel_speed_prev)
    rel_speed_prev = rel_speed;
end

no_vehicle = ((rel_dist>=params.rel_dist_max) || (rel_dist==0));

if no_vehicle
    iterations_no_vehicle = iterations_no_vehicle + 1;
%     if iterations_no_vehicle>=2/dtLocal
        rel_dist = params.rel_dist_max;
        rel_speed = params.speed_max - speed_ego;
%     else
%         rel_dist = rel_dist_prev;
%         rel_speed = rel_speed_prev;
%     end
else
    iterations_no_vehicle = 0;
end

% For multi-target control (repeat center lane target 3 times)
rel_dist3 = rel_dist*ones(3,1);
rel_speed3 = rel_speed*ones(3,1);

% For next time
if ~no_vehicle
    rel_dist_prev = rel_dist;
    rel_speed_prev = rel_speed;
end
