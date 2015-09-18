function [b_q_next] = CalBelief_obs(x_next, xk, zq_next, sigma, b_q)

nDState = length(b_q);
b_q_next = zeros(1, nDState);

for qq = 1:nDState
    tmp = 0;
    for q = 1:nDState
        tmp = tmp + DStateTransfn_obs(qq, q, sigma)*b_q(q);
    end
    b_q_next(qq) = DObsfn_obs(zq_next, qq)*CStateTransfn_obs(x_next, qq, xk)*tmp;
end

b_q_next = b_q_next/sum(b_q_next);


end