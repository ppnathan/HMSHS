function prob = CStateTransfn_obs(xx, qq, x)

noisemean = 0;

AttStraightNoiseStdDev = 0.0361;
AttTurnNoiseStdDev = 0.0539;
AttCarDistNoiseStdDev = 0.2555;

DisStraightNoiseStdDev = 0.0548;
DisTurnNoiseStdDev = 0.0678;
DisCarDistNoiseStdDev = 0.2337;


AttRelSpd = -0.1767;
AttTurnConst = 0.0117;
DisTurnConst = 0.0065;
DisRelSpd = -0.2012;
c = 0.25;

difference = zeros(2, 1);


if(qq == 1)
	difference(1) = xx(1) - x(1);
	difference(2) = xx(2) - x(2) - AttRelSpd;
	prob = normpdf(difference(1), noisemean, AttStraightNoiseStdDev)*normpdf(difference(2), noisemean, AttCarDistNoiseStdDev);
%	p1 = 1.0/(AttStraightNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(1)-noisemean)*(difference(1)-noisemean)/(AttStraightNoiseStdDev*AttStraightNoiseStdDev));
%	p2 = 1.0/(AttCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(2)-noisemean)*(difference(2)-noisemean)/(AttCarDistNoiseStdDev*AttCarDistNoiseStdDev));
%   return p1*p2;
		
elseif(qq == 2)

    difference(1) = xx(1) - x(1);
	difference(2) = xx(2)  -x(2) - AttRelSpd - c;
	prob = normpdf(difference(1), noisemean, AttStraightNoiseStdDev)*normpdf(difference(2), noisemean, AttCarDistNoiseStdDev);
%	p1 = 1.0/(AttStraightNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(1)-noisemean)*(difference(1)-noisemean)/(AttStraightNoiseStdDev*AttStraightNoiseStdDev));
%	p2 = 1.0/(AttCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(2)-noisemean)*(difference(2)-noisemean)/(AttCarDistNoiseStdDev*AttCarDistNoiseStdDev));
%   return p1*p2;
	
elseif(qq == 3)
	difference(1) = xx(1) - x(1) - AttTurnConst;
	difference(2) = xx(2) - x(2) - AttRelSpd;
	prob = normpdf(difference(1), noisemean, AttTurnNoiseStdDev)*normpdf(difference(2), noisemean, AttCarDistNoiseStdDev);
%   p1 = 1.0/(AttTurnNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(1)-noisemean)*(difference(1)-noisemean)/(AttTurnNoiseStdDev*AttTurnNoiseStdDev));
%	p2 = 1.0/(AttCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(2)-noisemean)*(difference(2)-noisemean)/(AttCarDistNoiseStdDev*AttCarDistNoiseStdDev));
%	return p1*p2;
	
elseif(qq == 4)
	difference(1) = xx(1) - x(1) - AttTurnConst;
	difference(2) = xx(2) - x(2) - AttRelSpd - c;
	prob = normpdf(difference(1), noisemean, AttTurnNoiseStdDev)*normpdf(difference(2), noisemean, AttCarDistNoiseStdDev);
%	p1 = 1.0/(AttTurnNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(1)-noisemean)*(difference(1)-noisemean)/(AttTurnNoiseStdDev*AttTurnNoiseStdDev));
%	p2 = 1.0/(AttCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(2)-noisemean)*(difference(2)-noisemean)/(AttCarDistNoiseStdDev*AttCarDistNoiseStdDev));
%	return p1*p2;
	
elseif(qq == 5)
    difference(1) = xx(1) - x(1);
	difference(2) = xx(2) - x(2) - DisRelSpd;
	prob = normpdf(difference(1), noisemean, DisStraightNoiseStdDev)*normpdf(difference(2), noisemean, DisCarDistNoiseStdDev);
%	p1 = 1.0/(DisStraightNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(1)-noisemean)*(difference(1)-noisemean)/(DisStraightNoiseStdDev*DisStraightNoiseStdDev));
%		p2 = 1.0/(DisCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(2)-noisemean)*(difference(2)-noisemean)/(DisCarDistNoiseStdDev*DisCarDistNoiseStdDev));
%    	return p1*p2;
	
elseif(qq == 6)
    difference(1) = xx(1) -x(1);
	difference(2) = xx(2) -x(2)- DisRelSpd -c;
	prob = normpdf(difference(1), noisemean, DisStraightNoiseStdDev)*normpdf(difference(2), noisemean, DisCarDistNoiseStdDev);
		
%		p1 = 1.0/(DisStraightNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(1)-noisemean)*(difference(1)-noisemean)/(DisStraightNoiseStdDev*DisStraightNoiseStdDev));
%		p2 = 1.0/(DisCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(2)-noisemean)*(difference(2)-noisemean)/(DisCarDistNoiseStdDev*DisCarDistNoiseStdDev));
%    	return p1*p2;
	
elseif(qq == 7)
	difference(1) = xx(1) - x(1) - DisTurnConst;
	difference(2) = xx(2) - x(2) - DisRelSpd;
	prob = normpdf(difference(1), noisemean, DisTurnNoiseStdDev)*normpdf(difference(2), noisemean, DisCarDistNoiseStdDev);
%		p1 = 1.0/(DisTurnNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(1)-noisemean)*(difference(1)-noisemean)/(DisTurnNoiseStdDev*DisTurnNoiseStdDev));
%		p2 = 1.0/(DisCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(2)-noisemean)*(difference(2)-noisemean)/(DisCarDistNoiseStdDev*DisCarDistNoiseStdDev));
%		return p1*p2;
	
elseif(qq == 8)
	difference(1) = xx(1) - x(1) - DisTurnConst;
	difference(2) = xx(2) - x(2) - DisRelSpd - c;
	prob = normpdf(difference(1), noisemean, DisTurnNoiseStdDev)*normpdf(difference(2), noisemean, DisCarDistNoiseStdDev);
		
%		p1 = 1.0/(DisTurnNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(1)-noisemean)*(difference(1)-noisemean)/(DisTurnNoiseStdDev*DisTurnNoiseStdDev));
%		p2 = 1.0/(DisCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference(2)-noisemean)*(difference(2)-noisemean)/(DisCarDistNoiseStdDev*DisCarDistNoiseStdDev));
%		return p1*p2;
end

end