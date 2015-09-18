close all;
clear all;

policyfile = fopen('../../problems/SimpleModel/OutFiles_OldSolver5000/policyfile.txt','r');

nAlphas = fscanf(policyfile, '%d', [1 1]);
num_qq = 2;%fscanf(policyfile, '%d', [1 1]);
num_zq = 2;%fscanf(policyfile, '%d', [1 1]);
num_samples =1000;% fscanf(policyfile, '%d', [1 1]);

Sigma = zeros(nAlphas, 1);
Beta = zeros([num_samples num_zq num_qq nAlphas]);

for i=1:nAlphas
    Sigma(i) = fscanf(policyfile, '%d', [1 1])+1;
    Betatmp = fscanf(policyfile, '%f', [num_samples num_qq*num_zq]);
    Beta(:, :, :, i) = reshape(Betatmp, [num_samples num_zq num_qq]);
end

fclose(policyfile);


interval = 10;
minzx = -5;

zx = minzx + (0:num_samples-1)*interval/num_samples;

SimTime = 100;

gamma = 0.95;

x_sim = zeros(SimTime+1, 1);
q_sim = ones(SimTime+1, 1);
zq_sim = ones(SimTime+1, 1);
b_q = repmat([1 0], SimTime+1, 1);
control = zeros(SimTime+1, 1);

MatlabSimulationfile = fopen('../../problems/SimpleModel/OutFiles_OldSolver5000/MatlabSimulationfile.txt', 'w');
MatlabSimfile_Discrete = fopen('../../problems/SimpleModel/OutFiles_OldSolver5000/MatlabSimfile_Discrete.txt', 'w');

NumRun = 50;
Reward = zeros(NumRun, 1);

for r = 1:NumRun
    
    Reward(r) = 0;

    for k = 1:SimTime
        k
        control(k) = calpolicy(x_sim(k), b_q(k, :), nAlphas, Sigma, Beta, zx);
        str = sprintf('q = %d, x = %f, bq = (%f, %f), zq = %d, sigma = %d', q_sim(k), x_sim(k), b_q(k, 1), b_q(k, 2), zq_sim(k), control(k));
        disp(str);
        fprintf(MatlabSimfile_Discrete, '%d  %f  %f  %f  %d  %d\n', q_sim(k), x_sim(k), b_q(k, 1), b_q(k, 2), zq_sim(k), control(k));

        Reward(r) = SimpleModelRewardfn(x_sim(k), b_q(k, :), control(k)) + gamma*Reward(r)

        [q_next x_next, T, X, zq_next, b_q_next] = SimpleModelSample(q_sim(k), x_sim(k), control(k), b_q(k, :));

        x_sim(k+1) = x_next;
        q_sim(k+1) = q_next;
        zq_sim(k+1) = zq_next;

        b_q(k+1, :) = b_q_next;

%         for i = 1:length(T)
%             fprintf(MatlabSimulationfile, '%f  %f\n', T(i)+k-1, X(i));
%         end


    end
end

AvgReward = mean(Reward);

fclose(MatlabSimulationfile);
fclose(MatlabSimfile_Discrete);




















