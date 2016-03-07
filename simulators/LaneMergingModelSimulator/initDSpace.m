addpath('Functions');

load('RFS_2Lanes_Speed_0202');

% Convert Map.Ways from cells to array
NWays = size(Map.Ways,2);
Way_Pointers = zeros(2,NWays);
for i=1:NWays
    Way_Pointers(:,i) = [Map.Ways{i}(1); Map.Ways{i}(end)];
end

% store in Map2
Map2.Nodes = Map.Nodes;
Map2.Way_Pointers = Way_Pointers;
Map2.N_Ways = Map.N_Ways;
Map2.GPS_Pos0 = Map.GPS_Pos0; %[-118.0266; 35.0536]
Map2.laneWidth = 3.6;
Map2.earthRadius = geocradius(Map.GPS_Pos0(2));
if isfield(Map,'Speed')
    Map2.Speed = Map.Speed;
end
