function bestvalue = calJ_star2(b_x, b_q1, nAlphas, localx, beta, thresholddist)

nDState = 2;

b_q = [b_q1 1-b_q1];

bestvalue = -99999999;
bestidx = -1;

mindist = 0;
mindistidx = -1;
for n = 1:nAlphas
    sum  = 0;
    dist = norm(b_x-localx(n, :));
    if(dist<thresholddist)
        for q = 1:nDState
            sum = sum + (beta(q, 1, n) + beta(q, 2, n)*b_x + beta(q, 3, n)*b_x*b_x)*b_q(q); 
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
        sum = sum + (beta(q, 1, mindistidx) + beta(q, 2, mindistidx)*b_x + beta(q, 3, mindistidx)*b_x*b_x)*b_q(q); 
    end
        
    bestvalue = sum;
    bestidx = mindistidx;

end


end