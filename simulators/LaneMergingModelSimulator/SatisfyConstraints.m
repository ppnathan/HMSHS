function out = SatisfyConstraints(x, mSafeDist)

if (x(1) + x(3) + mSafeDist > 0 && abs(x(1) - x(3)) < mSafeDist) 
    out = false;
else
	out = true;
end
end