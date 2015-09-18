function [q_next, x_next, zq_next, b_q_next] = SampleNext(qk, xk, sigma, b_q)

Tq(:, :, 1) = [0.95 0.05;
                0.05 0.95];
Tq(:, :, 2) = [0.95 0.8; 
                0.05 0.2];
           
P_att_S2T = 0.0377;
P_dis_S2T = 0.0377; %0.2797; 

transprob(:, :, 1) = [Tq(1, 1, 1)*(1-P_att_S2T), Tq(1, 1, 1)*P_att_S2T    , Tq(1, 2, 1)*(1-P_dis_S2T), Tq(1, 2, 1)*P_dis_S2T    ;
					  Tq(1, 1, 1)*P_att_S2T    , Tq(1, 1, 1)*(1-P_att_S2T), Tq(1, 2, 1)*P_dis_S2T    , Tq(1, 2, 1)*(1-P_dis_S2T);
					  Tq(2, 1, 1)*(1-P_att_S2T), Tq(2, 1, 1)*P_att_S2T    , Tq(2, 2, 1)*(1-P_dis_S2T), Tq(2, 2, 1)*P_dis_S2T    ;
					  Tq(2, 1, 1)*P_att_S2T    , Tq(2, 1, 1)*(1-P_att_S2T), Tq(2, 2, 1)*P_dis_S2T    , Tq(2, 2, 1)*(1-P_dis_S2T) ];
					  
transprob(:, :, 2) = [Tq(1, 1, 2)*(1-P_att_S2T), Tq(1, 1, 2)*P_att_S2T    , Tq(1, 2, 2)*(1-P_dis_S2T), Tq(1, 2, 2)*P_dis_S2T    ;
					  Tq(1, 1, 2)*P_att_S2T    , Tq(1, 1, 2)*(1-P_att_S2T), Tq(1, 2, 2)*P_dis_S2T    , Tq(1, 2, 2)*(1-P_dis_S2T);
					  Tq(2, 1, 2)*(1-P_att_S2T), Tq(2, 1, 2)*P_att_S2T    , Tq(2, 2, 2)*(1-P_dis_S2T), Tq(2, 2, 2)*P_dis_S2T    ;
					  Tq(2, 1, 2)*P_att_S2T    , Tq(2, 1, 2)*(1-P_att_S2T), Tq(2, 2, 2)*P_dis_S2T    , Tq(2, 2, 2)*(1-P_dis_S2T) ];


% transprob(:, :, 1) = [Tq(1, 1, 1)*(1-P_att_S2T), 0          , Tq(1, 2, 1)              , 0          ;
% 					  Tq(1, 1, 1)*P_att_S2T    , Tq(1, 1, 1), 0                        , Tq(1, 2, 1);
% 					  Tq(2, 1, 1)              , 0          , Tq(2, 2, 1)*(1-P_dis_S2T), 0          ;
% 					  0                        , Tq(2, 1, 1), Tq(2, 2, 1)*P_dis_S2T    , Tq(2, 2, 1) ];
% 					  
% transprob(:, :, 2) = [Tq(1, 1, 2)*(1-P_att_S2T), 0          , Tq(1, 2, 2)              , 0          ;
% 					  Tq(1, 1, 2)*P_att_S2T    , Tq(1, 1, 2), 0                        , Tq(1, 2, 2);
% 					  Tq(2, 1, 2)              , 0          , Tq(2, 2, 2)*(1-P_dis_S2T), 0          ;
% 					  0                        , Tq(2, 1, 2), Tq(2, 2, 2)*P_dis_S2T    , Tq(2, 2, 2) ];
                  
           
r = rand(1);
obserr = 0.05;

qk1 = ceil(qk/2);
%sigma1 = (sigma>2)+1;
sigma1 = ceil(sigma/2);
sigma2 = (mod(sigma, 2) == 1)*1+(mod(sigma, 2) == 0)*2;

if r<transprob(1, qk1, sigma1)
    q_next1 = 1;
elseif r< (transprob(1, qk1, sigma1)+transprob(2, qk1, sigma1))
    q_next1 = 2;
elseif r< (transprob(1, qk1, sigma1)+transprob(2, qk1, sigma1)+transprob(3, qk1, sigma1))
    q_next1 = 3;
else
    q_next1 = 4;
end
q_next2 = sigma2;

q_next  = (q_next1-1)*2+q_next2;

a = 0.0432; %0.0012;
AttStraightNoiseStdDev = 0.05;%0.2216;%0.0179;
AttTurnNoiseStdDev = 0.05;%0.0539;
DisStraightNoiseStdDev = 0.05;%0.1884;%0.0179;
DisTurnNoiseStdDev = 0.05;%0.0678;
DisStraightConst = 0.03;
AttTurnConst = 0.0117;
DisTurnConst = 0.0065; 

if q_next ==1
    x_next = xk - a*xk + AttStraightNoiseStdDev*randn(1);
elseif q_next ==2
    x_next = xk - 2*a*xk + AttStraightNoiseStdDev*randn(1);
elseif q_next ==3
    x_next = xk + AttTurnConst + AttTurnNoiseStdDev*randn(1);
elseif q_next ==4
    x_next = xk + AttTurnConst - a*xk + AttTurnNoiseStdDev*randn(1);
elseif q_next ==5
    x_next = xk + (xk>0)*DisStraightConst - (xk<0)*DisStraightConst + DisStraightNoiseStdDev*randn(1);
elseif q_next ==6
    x_next = xk + (xk>0)*DisStraightConst - (xk<0)*DisStraightConst - a*xk+ DisStraightNoiseStdDev*randn(1);
elseif q_next ==7
    x_next = xk + DisTurnConst + DisTurnNoiseStdDev*randn(1);
else
    x_next = xk + DisTurnConst - a*xk+ DisTurnNoiseStdDev*randn(1);
end


% ObsProb(:, :) = [0.8, 0.1, 0.1, 0.4;
% 			     0.1, 0.8, 0.4, 0.1;
% 				 0.1, 0.1, 0.5, 0.5 ];

ObsProb(:, :) = [0.5, 0.1, 0.1, 0.4;
			     0.4, 0.8, 0.4, 0.1; 
				 0.1, 0.1, 0.5, 0.5];

r = rand(1);
if r < ObsProb(1, q_next1)
    zq_next = 1;
elseif r < (ObsProb(1, q_next1) + ObsProb(2, q_next1))
    zq_next = 2;
else
    zq_next = 3;
end

b_q_next = CalBelief(x_next, xk, zq_next, sigma, b_q);


% nDState = length(b_q);
% b_q_next = zeros(1, nDState);
% 
% for qq = 1:nDState
%     tmp = 0;
%     for q = 1:nDState
%         tmp = tmp + DStateTransfn(qq, q, sigma)*b_q(q);
%     end
%     b_q_next(qq) = DObsfn(zq_next, qq)*CStateTransfn(x_next, qq, xk)*tmp;
% end
% 
% b_q_next = b_q_next/sum(b_q_next);


end