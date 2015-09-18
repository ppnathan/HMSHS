function prob = SimpleModelDObsfn(zq_next, qq)

obserr = 0.1;

if(zq_next == qq)
    prob = 1-obserr;
else
    prob = obserr;
end
end