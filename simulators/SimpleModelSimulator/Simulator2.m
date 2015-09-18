close all;
clear all;

policyfile = fopen('../../problems/SimpleModel/OutFiles/policyfile.txt','r');

nAlphas = fscanf(policyfile, '%d', [1 1]);
num_qq = 2;%fscanf(policyfile, '%d', [1 1]);
num_zq = 2;%fscanf(policyfile, '%d', [1 1]);
num_cstate = 1;

Sigma = zeros(nAlphas, 1);
Localx = zeros([nAlphas num_cstate]);
Beta = zeros([num_qq 3 nAlphas]);

for i=1:nAlphas
    Sigma(i) = fscanf(policyfile, '%d', [1 1])+1;
    Localx(i, :) = fscanf(policyfile, '%f', num_cstate);
    Betatmp = fscanf(policyfile, '%f', [3 num_qq]);
    Beta(:, :, i) = Betatmp';
end

fclose(policyfile);


SimTime = 100;

gamma = 0.95;

thresholddist = 1;

x_sim = zeros(SimTime+1, 1);
q_sim = ones(SimTime+1, 1);
zq_sim = ones(SimTime+1, 1);
b_q = repmat([1 0], SimTime+1, 1);
control = zeros(SimTime+1, 1);

MatlabSimulationfile = fopen('../../problems/SimpleModel/OutFiles/MatlabSimulationfile.txt', 'w');
MatlabSimfile_Discrete = fopen('../../problems/SimpleModel/OutFiles/MatlabSimfile_Discrete.txt', 'w');

NumRun = 50;
Reward = zeros(NumRun, 1);

for r = 1:NumRun
    for k = 1:SimTime
        k
        control(k) = calpolicy2(x_sim(k), b_q(k, :), nAlphas, Sigma, Localx, Beta, thresholddist);
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




















