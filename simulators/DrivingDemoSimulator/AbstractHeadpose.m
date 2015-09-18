function zq = AbstractHeadpose(yaw, pitch, roll, exp, currentlane)

%   exp: 0 - both eyes closed,1 = right eye open, 2 = left eye open, 3 =
%   both eyes open.
%   negative yaw occurs when you turn your head right when facing the
%   kinect.
%   negative pitch occurs when you turn your head downwards when facing the
%   kinect.
%   negative roll occurs when you rotate your head with a negative angle
%   with respect to the x-axis.
%   currentlane: 1: left lane, 2: right lane.


Up = 1; Below = 2; Front = 3; Left = 4; Right = 5;
leftlane = 1; %rightlane = 2;
DrivingDirection = 1; NeighborLaneDirection = 2; OtherDirections = 3;

i = 1;
if(sum(pitch(max(1, end-10):end) <= 30)==0)
    Looking(i) = Up;
    i = i+1;
end
if(sum(pitch(max(1, end-10):end) >= -30)==0)
    Looking(i) = Below;
    i = i+1;
end
if(max(yaw) >= 30)
    Looking(i) = Left;
    i = i+1;
end
if(min(yaw) <= -30)
    Looking(i) = Right;
    i = i+1;
end
if(sum(pitch(max(1, end-10):end)<=30)>0 && sum(pitch(max(1, end-10):end) >= -30)>0 && ...
        sum(yaw(max(1, end-10):end)<30)>0 && sum(yaw(max(1, end-10):end) > -30)>0)
    Looking(i) = Front;
end

if(sum(Looking == Up)>0 || sum(Looking == Below)>0)
    zq = OtherDirections;
else 
    if(currentlane == leftlane)
        if(sum(Looking == Right)>0)
            zq = NeighborLaneDirection;
        elseif(sum(Looking == Front)>0)
            zq = DrivingDirection;
        else
            zq = OtherDirections;
        end
    else %(currentlane == rightlane)

        if(sum(Looking == Left)>0)
            zq = NeighborLaneDirection;
        elseif(sum(Looking == Front)>0)
            zq = DrivingDirection;
        else
            zq = OtherDirections;
        end
    end
end

% if(Looking ~= Up && Looking ~= Below)
%     if(currentlane == leftlane)
%         if(Looking == Front)
%             zq = DrivingDirection;
%         elseif(Looking == Right)
%             zq = NeighborLaneDirection;
%         else
%             zq = OtherDirections;
%         end
%     else %(currentlane == rightlane)
%         if(Looking == Front)
%             zq = DrivingDirection;
%         elseif(Looking == Left)
%             zq = NeighborLaneDirection;
%         else
%             zq = OtherDirections;
%         end
%     end
% else
%     zq = OtherDirections;
%     
% end

end