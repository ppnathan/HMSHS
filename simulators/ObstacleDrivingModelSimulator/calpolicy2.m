function control = calpolicy2(b_x, b_q, nAlphas, sigma, localx, beta, thresholddist)

nDState = 4;

bestvalue = -99999999999;
bestidx = -1;

mindist = 0;
mindistidx = -1;
for n = 1:nAlphas
    sum  = 0;
    dist = norm(b_x-localx(n, :));
    if(dist<thresholddist)
        for q = 1:nDState
            sum = sum + (beta(q, 1, n) + beta(q, 2, n)*b_x(1) + beta(q, 3, n)*b_x(1)*b_x(1) + ...
                beta(q, 4, n)*b_x(1)*b_x(2)+ beta(q, 5, n)*b_x(2) +beta(q, 6, n)*b_x(2)*b_x(2))*b_q(q); 
        end
        
        if (sum>bestvalue)
            bestvalue = sum;
            bestidx = n;
        end
    end
    if(dist>mindist)
        mindist = dist;
        mindistidx = n;
    end
end

if(bestidx == -1)
    for q = 1:nDState
        sum = sum + (beta(q, 1, mindistidx) + beta(q, 2, mindistidx)*b_x(1) + beta(q, 3, mindistidx)*b_x(1)*b_x(1) + ...
                beta(q, 4, mindistidx)*b_x(1)*b_x(2) + beta(q, 5, mindistidx)*b_x(2) +beta(q, 6, mindistidx)*b_x(2)*b_x(2))*b_q(q);
    end
        
    bestvalue = sum;
    bestidx = mindistidx;

end

control = sigma(bestidx);

end