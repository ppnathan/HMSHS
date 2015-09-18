function prob = DStateTransfn(qq, q, sigma)

Tq(:, :, 1) = [0.9 0.1;
               0.1 0.9];
Tq(:, :, 2) = [0.9 0.8; 
               0.1 0.2];

q1 = (q>2)+1;
q2 = (mod(q, 2)==1)*1+(mod(q, 2)==0)*2;
qq1 = (qq>2)+1;
qq2 = (mod(qq, 2)==1)*1+(mod(qq, 2)==0)*2;

sigma1 = (sigma>2)+1;
sigma2 = (mod(sigma, 2)==1)*1+(mod(sigma, 2)==0)*2;
           
prob = Tq(qq1, q1, sigma1)*(qq2 == sigma2);
end