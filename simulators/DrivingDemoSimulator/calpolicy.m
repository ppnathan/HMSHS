function control = calpolicy(b_x, b_q, nAlphas, sigma, localx, beta, thresholddist)


nDState = length(b_q);

bestvalue = -99999999999;
bestidx = -1;

mindist = 999999999999;
mindistidx = -1;

for n = 1:nAlphas
    sum  = 0;
    dist = norm(b_x-localx(n, :));
    if(dist<thresholddist)
        for q = 1:nDState
            sum = sum + (beta(q, 1, n) + beta(q, 2, n)*b_x(1) + beta(q, 3, n)*b_x(1)*b_x(1))*b_q(q); 
        end
        
        if (sum>bestvalue)
            bestvalue = sum;
            bestidx = n;
        end
    end
    if(dist<mindist)
        mindist = dist;
        mindistidx = n;
    end
end

if(bestidx == -1)
    bestidx = mindistidx;
end

control = sigma(bestidx);

end