function [dist_to_mark_left, dist_to_mark_right] = preprocessCameraLanes(delta_t, lane_width, dist_to_mark_left, dist_to_mark_right, quality_left, quality_right)

% Very basic filtering of the lane data

persistent dist_to_mark_left_prev
if isempty(dist_to_mark_left_prev)
   dist_to_mark_left_prev = dist_to_mark_left;
end
persistent dist_to_mark_right_prev
if isempty(dist_to_mark_right_prev)
   dist_to_mark_right_prev = dist_to_mark_right;
end
persistent dist_to_mark_left_dot_prev
if isempty(dist_to_mark_left_dot_prev)
    dist_to_mark_left_dot_prev = 0;
end

dist_to_mark_left = min(0, dist_to_mark_left);
dist_to_mark_right = max(0, dist_to_mark_right);

dist_to_mark_left_dot = (dist_to_mark_left-dist_to_mark_left_prev) / delta_t;
dist_to_mark_right_dot = (dist_to_mark_right-dist_to_mark_right_prev) / delta_t;

% Distance to lane markings
if (quality_left<2)
    if (quality_right>=3)
        dist_to_mark_left = dist_to_mark_left_prev + dist_to_mark_right_dot * delta_t;
    else
        if min(abs(dist_to_mark_left_dot),abs(dist_to_mark_right_dot))==abs(dist_to_mark_right_dot)
            dist_to_mark_left = dist_to_mark_left_prev + dist_to_mark_right_dot * delta_t;
        else
            dist_to_mark_left = dist_to_mark_left_prev + dist_to_mark_left_dot * delta_t;
        end
    end
end
dist_to_mark_right = lane_width + dist_to_mark_left;

if (quality_left<=1) && (quality_right<=1)
%     dist_to_mark_left = dist_to_mark_left_prev;
%     dist_to_mark_right = dist_to_mark_right_prev;
    dist_to_mark_left_dot = dist_to_mark_left_dot_prev;
    dist_to_mark_left = dist_to_mark_left_prev + dist_to_mark_left_dot*delta_t;
    dist_to_mark_right = lane_width + dist_to_mark_left;
end

dist_to_mark_left = max(-lane_width,min(dist_to_mark_left,0));
dist_to_mark_right = min(lane_width,max(dist_to_mark_right,0));

% For next step
dist_to_mark_left_prev = dist_to_mark_left;
dist_to_mark_right_prev = dist_to_mark_right;
dist_to_mark_left_dot_prev = dist_to_mark_left_dot;
