function [T, X] = SimpleModelDE1(t, x)

a = 1;
stddev = 0.5;

N = 1000;
h = t/N;
T = 0:h:t;
X = zeros(N+1, 1);
X(1) = x;
for i = 1:N
    X(i+1) = X(i)+ (-a*X(i))*h + (stddev*randn(1)/(sqrt(N)*h))*h;
end

end
% function dx = SimpleModelDE1(t, x)
%    dx = -x +randn(1);
% end