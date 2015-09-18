function bestvalue = calJ_star(b_x, b_q1, nAlphas, sigma, beta, zx)

nDObs = 2;

b_q = [b_q1 1-b_q1];

bestvalue = -99999999;
bestidx = -1;

for n = 1:nAlphas
    sum  = 0;
    
    for q =1:length(b_q)
        sum = sum + SimpleModelRewardfn(b_x, b_q, sigma(n))*b_q(q);
    end
    
    for i =1:length(zx)
        for qq =1:length(b_q)
            for zq = 1:nDObs
                sum_q = 0;
                for q =1:length(b_q)
                    sum_q = sum_q + SimpleModelCStateTransfn(zx(i), qq, b_x)*SimpleModelDStateTransfn(qq, q, sigma(n))*b_q(q);
                end
                sum = sum + beta(i, zq, qq, n)*sum_q;
            end
        end
    end
     
    if (sum>bestvalue)
        bestvalue = sum;
        bestidx = n;
    end
        
end

end