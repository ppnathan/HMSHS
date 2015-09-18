function prob = DObsfn(zq_next, qq)

obserr = 0.05;

qq1 = (qq>2)+1;

if(zq_next == qq1)
    prob = 1-obserr;
else
    prob = obserr;
end
end