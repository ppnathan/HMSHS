clear all; close all;
load('sample_data_4.mat');

IsInLeftLane = (laneScan0.LeftLaneIntersection2.WorldCoordinateX.Data == 0);
IsInRightLane = (laneScan0.RightLaneIntersection2.WorldCoordinateX.Data == 0);

datalen = length(x);

% Check = xor(InLeftLane, InRightLane);

IsInLeftLaneNoObstacle = IsInLeftLane & (frontObj(1, :)==0)';
IsInRightLaneNoObstacle = IsInRightLane & (frontObj(1, :)==0)';

InLeftLaneNoObstacle_idx = find(IsInLeftLaneNoObstacle);
InRightLaneNoObstacle_idx = find(IsInRightLaneNoObstacle);

numdata = 20000;
sampledataidx = 1:50:numdata;
Leftboundary = [laneLeft0X(1:numdata); laneLeft0Y(1:numdata)] ;
Rightboundary = [laneRight0X(1:numdata); laneRight0Y(1:numdata)];
MiddleLine = [(laneLeft0X(1:numdata)+laneRight0X(1:numdata))/2; (laneLeft0Y(1:numdata)+laneRight0Y(1:numdata))/2];
LeftLaneMiddle = [0.75*laneLeft0X(1:numdata) + 0.25*laneRight0X(1:numdata); 0.75*laneLeft0Y(1:numdata) + 0.25*laneRight0Y(1:numdata)];
RightLaneMiddle = [0.25*laneLeft0X(1:numdata) + 0.75*laneRight0X(1:numdata); 0.25*laneLeft0Y(1:numdata) + 0.75*laneRight0Y(1:numdata)];

isfrontObj = (frontObj(1, :)>0);
isfrontObj_idx = find(isfrontObj);
frontObj(6, :) = isfrontObj.*(x' + frontObj(2, :).* cos(-(heading+frontObj(3, :)'-90)/180*pi)');
frontObj(7, :) = isfrontObj.*(y' + frontObj(2, :).* sin(-(heading+frontObj(3, :)'-90)/180*pi)');
frontObj(8, :) = zeros(1, datalen);

for i = 1:length(isfrontObj_idx)
    [dist, idx] = pdist2(Rightboundary', frontObj(6:7, isfrontObj_idx(i))', 'euclidean','Smallest',1);
    if(dist>3.6)
        frontObj(8, isfrontObj_idx(i)) = 1;
    else
        frontObj(8, isfrontObj_idx(i)) = 2;
    end
end

%% Check if the leftlane and rightlane indicators correct;

% ObjInLeftlaneidx = find(frontObj(8, :)==2);
% ObjInRightlaneidx = find(frontObj(8, :)==1);
% numdataplot = 1000;
% ObjInLeftlaneidx = ObjInLeftlaneidx(1:numdataplot);
% ObjInRightlaneidx = ObjInRightlaneidx(1:numdataplot);
% 
% figure;
% plot(x(ObjInLeftlaneidx), y(ObjInLeftlaneidx), 'r.'); hold on;
% plot(laneLeft0X(ObjInLeftlaneidx), laneLeft0Y(ObjInLeftlaneidx), 'k.'); hold on;
% plot(laneRight0X(ObjInLeftlaneidx), laneRight0Y(ObjInLeftlaneidx), 'k.'); hold on;
% plot(frontObj(6, ObjInLeftlaneidx), frontObj(7, ObjInLeftlaneidx), 'b.'); hold on;
% plot(x(1), y(1), 'ko'); hold off
% title('Obstacles in left lane');
% 
% figure;
% plot(x(ObjInRightlaneidx), y(ObjInRightlaneidx), 'r.'); hold on;
% plot(laneLeft0X(ObjInRightlaneidx), laneLeft0Y(ObjInRightlaneidx), 'k.'); hold on;
% plot(laneRight0X(ObjInRightlaneidx), laneRight0Y(ObjInRightlaneidx), 'k.'); hold on;
% plot(frontObj(6, ObjInRightlaneidx), frontObj(7, ObjInRightlaneidx), 'b.'); hold on;
% plot(x(1), y(1), 'ko'); hold off
% title('Obstacles in right lane');

%%

% isfrontObj_attentive = (frontObj(1, :)==1) & (driver_state == 1)';
% isfrontObj_distracted = (frontObj(1, :)==1)& (driver_state == 3)';
% isfrontObj_attentive_idx = find(isfrontObj_attentive);
% isfrontObj_distracted_idx = find(isfrontObj_distracted);
% 
% isfrontObj_attentive_idx = isfrontObj_attentive_idx(300:400);
% isfrontObj_distracted_idx = isfrontObj_distracted_idx(1:600);
% 
% frontObj_attentiveExtracted = frontObj(:, isfrontObj_attentive_idx);
% frontObj_distractedExtracted = frontObj(:, isfrontObj_distracted_idx);
% 
% ObjlocX_attentive = x(isfrontObj_attentive_idx)+frontObj_attentiveExtracted(2, :)'.*cos(-(heading(isfrontObj_attentive_idx)+frontObj_attentiveExtracted(3, :)'-90)/180*pi);
% ObjlocY_attentive = y(isfrontObj_attentive_idx)+frontObj_attentiveExtracted(2, :)'.*sin(-(heading(isfrontObj_attentive_idx)+frontObj_attentiveExtracted(3, :)'-90)/180*pi);
% ObjlocX_distracted = x(isfrontObj_distracted_idx)+frontObj_distractedExtracted(2, :)'.*cos(-(heading(isfrontObj_distracted_idx)+frontObj_distractedExtracted(3, :)'-90)/180*pi);
% ObjlocY_distracted = y(isfrontObj_distracted_idx)+frontObj_distractedExtracted(2, :)'.*sin(-(heading(isfrontObj_distracted_idx)+frontObj_distractedExtracted(3, :)'-90)/180*pi);

% figure;
% plot(x(isfrontObj_attentive_idx), y(isfrontObj_attentive_idx), 'r.'); hold on;
% plot(laneLeft0X(isfrontObj_attentive_idx), laneLeft0Y(isfrontObj_attentive_idx), 'k.'); hold on;
% plot(laneRight0X(isfrontObj_attentive_idx), laneRight0Y(isfrontObj_attentive_idx), 'k.'); hold on;
% plot(ObjlocX_attentive, ObjlocY_attentive, 'b.'); hold on;
% plot(x(1), y(1), 'ko'); hold off;
% title('Attentive');
% 
% figure;
% plot(x(isfrontObj_distracted_idx), y(isfrontObj_distracted_idx), 'r.'); hold on;
% plot(laneLeft0X(isfrontObj_distracted_idx), laneLeft0Y(isfrontObj_distracted_idx), 'k.'); hold on;
% plot(laneRight0X(isfrontObj_distracted_idx), laneRight0Y(isfrontObj_distracted_idx), 'k.'); hold on;
% plot(ObjlocX_distracted, ObjlocY_distracted, 'b.'); hold on;
% plot(x(1), y(1), 'ko'); hold off
% title('Distracted');

% check_idx = find(Check ==0);


% figure;
% plot(x(1:numdata), y(1:numdata)); hold on;
% quiver(x(sampledataidx), y(sampledataidx), cos((rotz(sampledataidx))/180*pi),sin((rotz(sampledataidx))/180*pi), 'k'); hold on;
% plot(x(1), y(1), 'ko'); hold off;
% 
% figure;
% plot(x(1:numdata), y(1:numdata)); hold on;
% quiver(x(sampledataidx), y(sampledataidx), cos(-(heading(sampledataidx)-90)/180*pi),sin(-(heading(sampledataidx)-90)/180*pi), 'k'); hold on;
% plot(x(1), y(1), 'ko'); hold off
% % 
% figure;
% plot(laneLeft0X(1:numdata), laneLeft0Y(1:numdata)); hold on;
% plot(laneRight0X(1:numdata), laneRight0Y(1:numdata));hold on;
% plot(x(1:numdata), y(1:numdata), 'r-'); hold on;
% plot(x(1), y(1), 'ko'); hold off

save('processeddata.mat', 'driver_state', 'x', 'y', 'z', 'rotx', 'roty', 'rotz', 'vel', 'heading', 'yaw_rate', 'delta', 'throttle',... 
    'brake','frontObj', 'leftObj', 'rightObj', 'laneScan0', 'laneScan1', 'laneScan2', 'laneScan3', 'datalen', 'IsInLeftLane',...
      'IsInRightLane', 'laneLeft0X', 'laneLeft0Y', 'laneRight0X', 'laneRight0Y', 'Leftboundary', 'Rightboundary', 'MiddleLine',...
		  'LeftLaneMiddle', 'RightLaneMiddle');
