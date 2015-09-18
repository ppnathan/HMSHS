function prob = CStateTransfn_noobs(xx, qq, x)


deltaT = 1;
attentivenoisestddev = 0.2216;
distractednoisestddev = 0.1884;
a = 0.0432;
noisemean = 0;


if(qq == 1)
    difference = (xx(1) - x(1))/deltaT - (-a*x(1));
    prob = normpdf(difference, noisemean, attentivenoisestddev);
    % 1.0/(attentivenoisestddev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(attentivenoisestddev*attentivenoisestddev));

elseif(qq == 2)
    difference = (xx(1) - x(1))/deltaT - (-2*a*x(1));
	prob = normpdf(difference, noisemean, attentivenoisestddev);
   % return 1.0/(attentivenoisestddev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(attentivenoisestddev*attentivenoisestddev));

elseif(qq == 3)
    difference = (xx(1) - x(1))/deltaT;
	prob = normpdf(difference, noisemean, distractednoisestddev);
   % return 1.0/(distractednoisestddev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(distractednoisestddev*distractednoisestddev));

else if(qq == 4)
    difference = (xx(1) - x(1))/deltaT - (-a*x(1));
	prob = normpdf(difference, noisemean, distractednoisestddev);
    % return 1.0/(distractednoisestddev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(distractednoisestddev*distractednoisestddev));
end

end