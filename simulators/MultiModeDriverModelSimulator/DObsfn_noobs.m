function prob = DObsfn_noobs(zq_next, qq)
	
DObsProb(:, :) = [0.7617, 0.0145;
				  0.2225, 0.42;
				  0.0158, 0.5655];


qq1 = (qq>2)+1;
prob = DObsProb(zq_next, qq1);

end