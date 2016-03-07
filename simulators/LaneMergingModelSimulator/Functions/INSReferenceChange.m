function [GPS_Local_Pos,INS_Heading] = INSReferenceChange(PosLon,PosLat,AngleHeading,Map2)

GPS_Pos = [PosLon;PosLat];
GPS_Shifted = GPS_Pos-Map2.GPS_Pos0;
GPS_Shifted(1) = GPS_Shifted(1)*cosd(Map2.GPS_Pos0(2));
GPS_Local_Pos = GPS_Shifted*Map2.earthRadius*pi/180;

INS_Heading  = -(AngleHeading)*pi/180+pi/2;
if INS_Heading<0
    INS_Heading = INS_Heading+2*pi;
end
