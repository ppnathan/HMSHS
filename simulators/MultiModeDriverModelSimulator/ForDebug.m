clear all; close all;

load('processeddata.mat');

figure;
T_start = 16086;
T_end  = 16100
plot(x(T_start:T_end), y(T_start:T_end), 'r.'); hold on;
plot(laneLeft0X(T_start:T_end), laneLeft0Y(T_start:T_end), 'k.'); hold on;
plot(laneRight0X(T_start:T_end), laneRight0Y(T_start:T_end), 'k.'); hold on;
plot((laneLeft0X(T_start:T_end)+laneRight0X(T_start:T_end))/2, (laneLeft0Y(T_start:T_end)+laneRight0Y(T_start:T_end))/2, 'k.'); hold on;
plot( laneScan0.LeftLaneIntersection1.WorldCoordinateX.Data(T_start:T_end), ...
      laneScan0.LeftLaneIntersection1.WorldCoordinateY.Data(T_start:T_end), 'b.'); hold on;
plot( laneScan0.RightLaneIntersection1.WorldCoordinateX.Data(T_start:T_end), ...
      laneScan0.RightLaneIntersection1.WorldCoordinateY.Data(T_start:T_end), 'b.'); hold on;

%plot( (laneScan0.LeftLaneIntersection1.WorldCoordinateX.Data(T_start:T_end) + laneScan0.RightLaneIntersection1.WorldCoordinateX.Data(T_start:T_end))/2, ...
%      (laneScan0.LeftLaneIntersection1.WorldCoordinateY.Data(T_start:T_end) + laneScan0.RightLaneIntersection1.WorldCoordinateY.Data(T_start:T_end))/2, 'b.'); hold on;
title('Warning on example');

