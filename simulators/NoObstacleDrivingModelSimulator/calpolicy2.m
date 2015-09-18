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

control = sigma(bestidx);


% nDObs = 2;
% 
% bestvalue = -99999999;
% bestidx = -1;
% 
% for n = 1:nAlphas
%     sum  = 0;
%     
%     for q =1:length(b_q)
%         sum = sum + Rewardfn(b_x, b_q, sigma(n))*b_q(q);
%     end
%     
%     for i =1:length(zx)
%         for qq =1:length(b_q)
%             for zq = 1:nDObs
%                 sum_q = 0;
%                 for q =1:length(b_q)
%                     sum_q = sum_q + CStateTransfn(zx(i), qq, b_x)*DStateTransfn(qq, q, sigma(n))*b_q(q);
%                 end
%                 sum = sum + beta(i, zq, qq, n)*sum_q;
%             end
%         end
%     end
%          
%     if (sum>bestvalue)
%         bestvalue = sum;
%         bestidx = n;
%     end
%     
% end
% 
% control = sigma(bestidx);

end