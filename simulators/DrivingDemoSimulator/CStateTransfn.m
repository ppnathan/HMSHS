function prob = CStateTransfn(xx, qq, x)


noisemean = 0;
a = 0.0432;%0.0012;
AttStraightNoiseStdDev = 0.05;%0.2216;%0.0179;
AttTurnNoiseStdDev = 0.05;%0.0539;
DisStraightNoiseStdDev = 0.05;%0.1884;%0.0179;
DisTurnNoiseStdDev = 0.05;%0.0678;
DisStraightConst = 0.03;
AttTurnConst = 0.0117;
DisTurnConst = 0.0065; 


if(qq == 1)
    difference = (xx(1) - x(1)) - (-a*x(1));
    prob = normpdf(difference, noisemean, AttStraightNoiseStdDev);
elseif (qq == 2)
    difference = (xx(1) - x(1)) - (-2*a*x(1));
    prob = normpdf(difference, noisemean, AttStraightNoiseStdDev);
elseif (qq == 3)
    difference = (xx(1) - x(1)) - AttTurnConst;
    prob = normpdf(difference, noisemean, AttTurnNoiseStdDev);
elseif (qq == 4)
    difference = (xx(1) - x(1))- AttTurnConst - (-a*x(1));
    prob = normpdf(difference, noisemean, AttTurnNoiseStdDev);
elseif (qq == 5)
    difference = (xx(1) - x(1)) - ((x(1)>0)*DisStraightConst - (x(1)<0)*DisStraightConst);
    prob = normpdf(difference, noisemean, DisStraightNoiseStdDev);
elseif (qq == 6)
    difference = (xx(1) - x(1)) - ((x(1)>0)*DisStraightConst - (x(1)<0)*DisStraightConst) - (-a*x(1));
    prob = normpdf(difference, noisemean, DisStraightNoiseStdDev);
elseif (qq == 7)
    difference = (xx(1) - x(1)) - DisTurnConst;
    prob = normpdf(difference, noisemean, DisTurnNoiseStdDev);
else % qq ==8
    difference = (xx(1) - x(1)) - DisTurnConst - (-a*x(1));
    prob = normpdf(difference, noisemean, DisTurnNoiseStdDev);
end



end