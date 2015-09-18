function [q_next x_next, T, X, zq_next, b_q_next] = SimpleModelSample(qk, xk, sigma, b_q)

Tq(:, :, 1) = [0.9 0.1;
               0.1 0.9];
Tq(:, :, 2) = [0.9 0.8; 
               0.1 0.2];
           
r = rand(1);
obserr = 0.1;


if r<Tq(1, qk, sigma)
    q_next = 1;
else
    q_next = 2;
end

if q_next ==1
%     [T, X] = ode45(@SimpleModelDE1, [0 1], xk);
    [T, X] = SimpleModelDE1(1, xk);
else
%     [T, X] = ode45(@SimpleModelDE2, [0 1], xk);
    [T, X] = SimpleModelDE2(1, xk);
end

x_next = X(end);

r = rand(1);
if r < obserr
    if q_next == 1
        zq_next = 2;
    else
        zq_next = 1;
    end
else
    zq_next = q_next;
end




b_q_next = zeros(1, 2);

for qq = 1:2
    tmp = 0;
    for q = 1:2
        tmp = tmp + SimpleModelDStateTransfn(qq, q, sigma)*b_q(q);
    end
    b_q_next(qq) = SimpleModelDObsfn(zq_next, qq)*SimpleModelCStateTransfn(x_next, qq, xk)*tmp;
end

b_q_next = b_q_next/sum(b_q_next);


end