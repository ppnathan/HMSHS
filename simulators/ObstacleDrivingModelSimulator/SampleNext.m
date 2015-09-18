function [q_next x_next, T, X, zq_next, b_q_next] = SampleNext(qk, xk, sigma, b_q)

Tq(:, :, 1) = [0.95 0.05;
               0.05 0.95];
Tq(:, :, 2) = [0.95 0.8; 
               0.05 0.2];
           
r = rand(1);
obserr = 0.05;

qk1 = (qk>2)+1;
sigma1 = (sigma>2)+1;
sigma2 = (mod(sigma, 2) == 1)*1+(mod(sigma, 2) == 0)*2;

if r<Tq(1, qk1, sigma1)
    q_next1 = 1;
else
    q_next1 = 2;
end
q_next2 = sigma2;

q_next  = (q_next1-1)*2+q_next2;

if q_next ==1
    %[T, X] = ode45(@DDrModelDE1, [0 1], xk);
    [T, X] = TwoDModelDE1(1, xk);
elseif q_next ==2
    %[T, X] = ode45(@DDrModelDE2, [0 1], xk);
    [T, X] = TwoDModelDE2(1, xk);
elseif q_next ==3
    %[T, X] = ode45(@DDrModelDE3, [0 1], xk);
    [T, X] = TwoDModelDE3(1, xk);
else % q_next ==4
    %[T, X] = ode45(@DDrModelDE4, [0 1], xk);
    [T, X] = TwoDModelDE4(1, xk);
end

x_next = X(end, :);

r = rand(1);
if r < obserr
    if q_next1 == 1
        zq_next = 2;
    else
        zq_next = 1;
    end
else
    zq_next = q_next1;
end

nDState = length(b_q);


b_q_next = zeros(1, nDState);

for qq = 1:nDState
    tmp = 0;
    for q = 1:nDState
        tmp = tmp + DStateTransfn(qq, q, sigma)*b_q(q);
    end
    b_q_next(qq) = DObsfn(zq_next, qq)*CStateTransfn(x_next, qq, xk)*tmp;
end

b_q_next = b_q_next/sum(b_q_next);


end