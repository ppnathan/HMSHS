function prob = SimpleModelCStateTransfn(xx, qq, x)


deltaT = 1;
a = 1;
noisestddev = 1;
noisemean = 0;
c = 1;

if(qq == 1)
    difference = (xx - x)/deltaT - (-a*x);
else
    difference = (xx - x)/deltaT - (2.0*c/(1+exp(-5*x)) - c);
end

%prob = 1.0/(noisestddev*sqrt(2*pi))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(noisestddev*noisestddev));
 prob = normpdf(difference, noisemean, noisestddev);

end