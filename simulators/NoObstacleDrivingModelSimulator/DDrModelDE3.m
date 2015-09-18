function [T, X] = DDrModelDE3(t, x)

stddev = 1;

N = 1000;
h = t/N;
T = 0:h:t;
X = zeros(N+1, 1);
X(1) = x;
for i = 1:N
    X(i+1) = X(i)+ (stddev*randn(1)/(sqrt(N)*h))*h;
end
%dx = stddev*randn(1);

end

