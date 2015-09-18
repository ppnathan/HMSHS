function [b_q_next] = CalBelief(x_next, xk, zq_next, sigma, b_q)

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