function control = RuleBasedPolicy_noobs(b_x, thresholddist)

if(abs(b_x)>thresholddist)
	control = 2;
else
	control = 1;
end


end