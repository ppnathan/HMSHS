function prob = DStateTransfn(qq, q, sigma)

Tq(:, :, 1) = [0.95 0.05;
               0.05 0.95];
Tq(:, :, 2) = [0.95 0.8; 
               0.05 0.2];
			   
P_att_S2T = 0.0377;
P_dis_S2T = 0.0377; 

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

q1 = ceil(q/2);
q2 = (mod(q, 2)==1)*1+(mod(q, 2)==0)*2;
qq1 = ceil(qq/2);
qq2 = (mod(qq, 2)==1)*1+(mod(qq, 2)==0)*2;

sigma1 = (sigma>2)+1;
sigma2 = (mod(sigma, 2)==1)*1+(mod(sigma, 2)==0)*2;
           
prob = transprob(qq1, q1, sigma1)*(qq2 == sigma2);

end