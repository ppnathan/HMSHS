function [T, X] = DDrModelDE2(t, x)

a = 0.5;
stddev = 0.5;

N = 1000;
h = t/N;
T = 0:h:t;
X = zeros(N+1, 1);
X(1) = x;
for i = 1:N
    X(i+1) = X(i)+ (-2*a*X(i))*h + (stddev*randn(1)/(sqrt(N)*h))*h;
end
%dx = -2*a*x + stddev*randn(1);

end