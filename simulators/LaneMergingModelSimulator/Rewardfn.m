function reward = Rewardfn(b_x, b_q, sigma)

maxReward = 1000;
if (max(b_x(1), b_x(3)) < 0)
    reward =  0; 
else
    if (abs(b_x(1) - b_x(3)) < mSafeDist) 
        reward = 0;
    elseif (b_x(1) - b_x(3) > mSafeDist && b_x(1) - b_x(3) < mSafeDist + 3) 
        reward = (maxReward + mRewardParam * b_x(3)) * (b_x(1) - b_x(3) - mSafeDist) / 3.0;
    elseif (b_x(3) - b_x(1) > mSafeDist && b_x(3) - b_x(1) < mSafeDist + 3)
        reward = (maxReward + mRewardParam * b_x(3)) * (b_x(3) - b_x(1) - mSafeDist) / 3.0;
    elseif (b_x(3) > 0) 
        reward = maxReward + mRewardParam * b_x(3);
    else 
        reward = maxReward;
    end
end

end