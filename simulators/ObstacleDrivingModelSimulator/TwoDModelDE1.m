function [T, X] = TwoDModelDE1(t, x)


stddev = 0.2;
k1 = 0.0796;
k2 = 0.4068;


N = 1000;
h = t/N;
T = 0:h:t;
X = zeros(N+1, 2);
X(1, :) = x;

A = [1 h; 0 1]; 
B = [h^2/2; h];
K = [k1 k2];

A_new = A-B*K;

for i = 1:N
    x_new = A_new*X(i, :)'+ [(stddev*randn(1)/(sqrt(N)*h))*h; 0];
    X(i+1, :) = x_new';
end


end