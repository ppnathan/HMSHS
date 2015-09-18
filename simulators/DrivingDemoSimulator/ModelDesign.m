close all; clear all;

deltaT = 1;
A = [1 deltaT; 0 1];
B = [deltaT*deltaT/2; deltaT];

Q = eye(2);
R = 100;

K = dlqr(A,B,Q,R);

nSim = 100;
x = zeros(2,nSim);
u = zeros(1, nSim);
x(:, 1) = [5; 3];

newA = A-2*B*K;
d = eig(newA);

for i = 1:nSim-1
    u(i) = -K*x(:, i);
    x(:, i+1) = A*x(:, i) +B*u(i);
end

figure(1)
plot(x(1, :));