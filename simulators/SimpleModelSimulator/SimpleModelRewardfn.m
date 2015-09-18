function reward = SimpleModelRewardfn(b_x, b_q, sigma)

R = [0, -5];
reward = (500 - b_x*b_x)+ R(sigma);


end