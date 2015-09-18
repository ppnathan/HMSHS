function [T, X] = SimpleModelDE2(t, x)

c = 1;
stddev = 0.5;

N = 1000;
h = t/N;
T = 0:h:t;
X = zeros(N+1, 1);
X(1) = x;

for i = 1:N
    X(i+1) = X(i)+ (2.0*c/(1+exp(-5*x)) - c)*h + (stddev*randn(1)/(sqrt(N)*h))*h;
end
end
% function dx = SimpleModelDE2(t, x)
% 
% c = 1;
% dx = 2.0*c/(1+exp(-5*x)) - c + randn(1);
% 
% end