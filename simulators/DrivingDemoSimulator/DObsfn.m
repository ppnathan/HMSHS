function prob = DObsfn(zq_next, qq)

ObsProb(:, :) = [0.5, 0.1, 0.1, 0.4;
			     0.4, 0.8, 0.4, 0.1; 
				 0.1, 0.1, 0.5, 0.5];
             
   
prob = ObsProb(zq_next, ceil(qq/2));

end