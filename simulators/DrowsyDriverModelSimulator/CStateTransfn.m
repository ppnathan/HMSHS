function prob = CStateTransfn(xx, qq, x)


deltaT = 1;
a = 0.5;
awakenoisestddev = 0.5;
drowsynoisestddev = 1;
noisemean = 0;


if(qq == 1)
    difference = (xx - x)/deltaT - (-a*x);
    prob = normpdf(difference, noisemean, awakenoisestddev);
elseif (qq == 2)
    difference = (xx - x)/deltaT - (-2*a*x);
    prob = normpdf(difference, noisemean, awakenoisestddev);
elseif (qq == 3)
    difference = (xx - x)/deltaT;
    prob = normpdf(difference, noisemean, drowsynoisestddev);
elseif (qq == 4)
    difference = (xx - x)/deltaT - (-a*x);
    prob = normpdf(difference, noisemean, drowsynoisestddev);
end

%prob = 1.0/(noisestddev*sqrt(2*pi))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(noisestddev*noisestddev));
%prob = normpdf(difference, noisemean, noisestddev);

end