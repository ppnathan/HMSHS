function reward = Rewardfn(b_x, b_q, sigma)

R = [0, -5, -5, -10];
reward = (100 - b_x(1)*b_x(1) - 0.1*b_x(2)*b_x(2)) + R(sigma);


end