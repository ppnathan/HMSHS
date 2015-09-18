function control = RuleBasedPolicy_obs(b_x, thresholddist)

if(abs(b_x(2)) < thresholddist)
	control = 2;
else
	control = 1;
end


end