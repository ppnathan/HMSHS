function prob = CStateTransfn(xx, qq, x)


deltaT = 1;
awakenoisestddev = 0.2;
drowsynoisestddev = 1;
noisemean = 0;

k1 = 0.0796;
k2 = 0.4068;


if(qq == 1)
    difference = xx(1) - (1- deltaT*deltaT/2*k1)*x(1) - (deltaT-deltaT*deltaT/2*k2)*x(2);
    prob = normpdf(difference, noisemean, awakenoisestddev);
elseif (qq == 2)
    difference = xx(1) - (1- deltaT*deltaT/2*2*k1)*x(1) - (deltaT-deltaT*deltaT/2*2*k2)*x(2);
    prob = normpdf(difference, noisemean, awakenoisestddev);
elseif (qq == 3)
    difference = xx(1) - x(1) - deltaT*x(2);
    prob = normpdf(difference, noisemean, drowsynoisestddev);
elseif (qq == 4)
    difference = xx(1) - (1- deltaT*deltaT/2*k1)*x(1) - (deltaT-deltaT*deltaT/2*k2)*x(2);
    prob = normpdf(difference, noisemean, drowsynoisestddev);
end

%prob = 1.0/(noisestddev*sqrt(2*pi))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(noisestddev*noisestddev));
%prob = normpdf(difference, noisemean, noisestddev);

end