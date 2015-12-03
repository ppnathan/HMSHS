function control = calpolicy(b_x, b_q, nAlphas, sigma, localx, alpha0, alpha1, alpha2, thresholdDist)

nDState = size(b_q, 2);

bestvalue = -1e100;
bestidx = -1;

mindist = 1e100;
mindistidx = -1;
for n = 1:nAlphas
    sum  = 0;
    dist = norm(b_x - localx(:, n));
    if(dist < thresholdDist)
        for q = 1:nDState
            first_order_term = alpha1(:, q, n)'*(b_x - localx(:, n));
            second_order_term = (b_x - localx(:, n))' * alpha2(:, :, q, n) * (b_x - localx(:, n));
            sum = sum + (alpha0(q, n) + first_order_term + second_order_term)*b_q(q); 
        end
        
        if (sum > bestvalue)
            bestvalue = sum;
            bestidx = n;
        end
    end
    if (dist < mindist)
        mindist = dist;
        mindistidx = n;
    end
end

% The case when all distances are greater than thresholdDist
if(bestidx == -1)
    for q = 1:nDState
        first_order_term = alpha1(:, q, mindistidx)'*(b_x - localx(:, mindistidx));
        second_order_term = (b_x - localx(:, mindistidx))' * ...
                             alpha2(:, :, q, mindistidx) * (b_x - localx(:, mindistidx));
        sum = sum + (alpha0(q, n) + first_order_term + second_order_term)*b_q(q); 
    end

    bestvalue = sum;
    bestidx = mindistidx;
end

control = sigma(bestidx);

end