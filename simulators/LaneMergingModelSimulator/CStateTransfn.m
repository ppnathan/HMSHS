function prob = CStateTransfn(x_next, qq, x_k, mReactionDist, safeDist)

nCState = length(x_k);
differences = zeros(nCState, 1);
humanDriver = ceil(qq/3);
autonomousDriverNext = mod(qq - 1, 3) + 1;

OBLIVIOUS = 1; AGGRESSIVE = 2; COURTEOUS = 3; REASONABLE = 4;
mNoiseMean = 0;
mDistNoiseStd = 0.1;
mVelNoiseStd = 0.1;
mDeltaT = 0.1;

if (humanDriver == OBLIVIOUS)
        humanInput = 0;
elseif (humanDriver == AGGRESSIVE)
    if (abs(x_k(1) - x_k(3)) < mReactionDist)
        humanInput = 1;
    else
        humanInput = 0;
    end
elseif (humanDriver == COURTEOUS)
    if (abs(x_k(1) - x_k(3)) < mReactionDist)
        humanInput = -1; 
    else
        humanInput = 0;
    end
elseif (humanDriver == REASONABLE)
    if (abs(x_k(1) - x_k(3)) < mReactionDist)
        if (x_k(2) > x_k(4))
            humanInput = 1;
        else
            humanInput = -1;
        end
    else
        humanInput = 0;
    end
else
    humanInput = 0;
    disp('CStateTransfn(): q_next out of domain');
end

if (autonomousDriverNext == 1)
    autonomousInput = 0;
elseif (autonomousDriverNext == 2)
    autonomousInput = 1;
elseif (autonomousDriverNext == 3)
    autonomousInput = -1;
else
    autonomousInput = 0;
    disp('LaneMergingModel::getCStateTransProb(): q_next out of domain');
end

if (~SatisfyConstraints(x_k, safeDist))
    differences(1) = x_next(1) - x_k(1);
    differences(2) = x_next(2) - x_k(2);
    differences(3) = x_next(3) - x_k(3);
    differences(4) = x_next(4) - x_k(4);
else
    differences(1) = x_next(1) - (x_k(1) + mDeltaT * x_k(2));
    differences(2) = x_next(2) - (x_k(2) + mDeltaT * humanInput);
    differences(3) = x_next(3) - (x_k(3) + mDeltaT * x_k(4));
    differences(4) = x_next(4) - (x_k(4) + mDeltaT * autonomousInput);
end

p1 = 1.0 / (mDistNoiseStd * sqrt(2 * pi)) * ...
     exp(-0.5 * (differences(1) - mNoiseMean) * (differences(1) - mNoiseMean) / ...
                 (mDistNoiseStd * mDistNoiseStd));
p2 = 1.0 / (mVelNoiseStd * sqrt(2 * pi)) * ...
                exp(-0.5 * (differences(2) - mNoiseMean) * (differences(2) - mNoiseMean) / ...
                    (mVelNoiseStd * mVelNoiseStd));
p3 = 1.0 / (mDistNoiseStd * sqrt(2 * pi)) * ...
                exp(-0.5 * (differences(3) - mNoiseMean) * (differences(3) - mNoiseMean) / ...
                    (mDistNoiseStd * mDistNoiseStd));
p4 = 1.0 / (mVelNoiseStd * sqrt(2 * pi)) * ...
                exp(-0.5 * (differences(4) - mNoiseMean) * (differences(4) - mNoiseMean) / ...
                    (mVelNoiseStd * mVelNoiseStd));
    
prob = p1 * p2 * p3 * p4;

end
