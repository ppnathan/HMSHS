function reward = Rewardfn(b_x, b_q, sigma)

R = [0, -5, -5, -10];
reward = (100 - b_x*b_x) + R(sigma);


end