function [heading_angle, curvature_A, curvature_dA] = preprocessCameraOthers(delta_t, ...
                                                                             highway_exit, ...
                                                                             quality_left, ...
                                                                             quality_right, ...
                                                                             type_left, ...
                                                                             type_right, ...
                                                                             curvature_A_left, ...
                                                                             curvature_A_right, ...
                                                                             curvature_dA_left, ...
                                                                             curvature_dA_right, ...
                                                                             view_left, ...
                                                                             view_right, ...
                                                                             heading_angle_left, ...
                                                                             heading_angle_right)

persistent heading_angle_prev
if isempty(heading_angle_prev)
    if abs(heading_angle_left)<abs(heading_angle_right)
        heading_angle_prev = heading_angle_left;
    else
        heading_angle_prev = heading_angle_right;
    end
end
persistent curvature_A_prev
if isempty(curvature_A_prev)
   if abs(curvature_A_left)<abs(curvature_A_right)
        curvature_A_prev = curvature_A_left;
    else
        curvature_A_prev = curvature_A_right;
    end
end
persistent curvature_dA_prev
if isempty(curvature_dA_prev)
   if abs(curvature_dA_left)<abs(curvature_dA_right)
        curvature_dA_prev = curvature_dA_left;
    else
        curvature_dA_prev = curvature_dA_right;
    end
end

persistent heading_angle_left_prev
if isempty(heading_angle_left_prev)
   heading_angle_left_prev = heading_angle_left;
end
persistent heading_angle_right_prev
if isempty(heading_angle_right_prev)
   heading_angle_right_prev = heading_angle_right;
end
persistent curvature_A_left_prev
if isempty(curvature_A_left_prev)
   curvature_A_left_prev = curvature_A_left;
end
persistent curvature_A_right_prev
if isempty(curvature_A_right_prev)
   curvature_A_right_prev = curvature_A_right;
end

th_d_heading_angle = degToRad(20);
th_d_curvature_A = 0.005;

coef_left = quality_left;
coef_right = quality_right;

if coef_left~=0
    d_heading_angle_left = abs(heading_angle_left - heading_angle_left_prev)/delta_t;
    d_curvature_A_left = abs(curvature_A_left - curvature_A_left_prev)/delta_t;
    if d_heading_angle_left>th_d_heading_angle
        coef_left = 0;
    else
        heading_angle_left_prev = heading_angle_left;
    end
    if d_curvature_A_left>th_d_curvature_A
        coef_left = 0;
    else
        curvature_A_left_prev = curvature_A_left;
    end
else
    heading_angle_left_prev = heading_angle_left;
    curvature_A_left_prev = curvature_A_left;
end

if coef_right~=0
    d_heading_angle_right = abs(heading_angle_right - heading_angle_right_prev)/delta_t;
    d_curvature_A_right = abs(curvature_A_right - curvature_A_right_prev)/delta_t;
    if d_heading_angle_right>th_d_heading_angle
        coef_right = 0;
    else
        heading_angle_right_prev = heading_angle_right;
    end
    if d_curvature_A_right>th_d_curvature_A
        coef_right = 0;
    else
        curvature_A_right_prev = curvature_A_right;
    end
else
    heading_angle_right_prev = heading_angle_right;
    curvature_A_right_prev = curvature_A_right;
end
use_left_lane = (view_left>5) && (ismember(type_left, [0 1 4])) && (~highway_exit);
accepted_types_right = [0 4];
if use_left_lane
    if coef_left>=3
        accepted_types_right = 1000;
    elseif coef_left>=2 && coef_left>=coef_right
        accepted_types_right = 1000;
    end
elseif coef_right>=2
    accepted_types_right = [0 1 4];
end
use_right_lane = (view_right>5) && (ismember(type_right, accepted_types_right)) && (~highway_exit);
coef_left = coef_left * use_left_lane;
coef_right = coef_right * use_right_lane;
sum_coefs = coef_left + coef_right;

% Parameter A of road curvature
curvature_A = (coef_left * curvature_A_left + coef_right * curvature_A_right) / max(1,sum_coefs);
if coef_left==0 && coef_right==0
    curvature_A = curvature_A_prev;
end

% Parameter dA of road curvature
curvature_dA = (coef_left * curvature_dA_left + coef_right * curvature_dA_right) / max(1,sum_coefs);
if coef_left==0 && coef_right==0
    curvature_dA = curvature_dA_prev;
end

% Heading angle
heading_angle = (coef_left * heading_angle_left + coef_right * heading_angle_right) / max(1,sum_coefs);
if coef_left==0 && coef_right==0
    heading_angle = heading_angle_prev;
end


% For next step
heading_angle_prev = heading_angle;
curvature_A_prev = curvature_A;
curvature_dA_prev = curvature_dA;