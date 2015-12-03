close all;
clear all;

policyfile = fopen('../../problems/LaneMergingModel/OutFiles/policyfile.txt','r');

nAlphas = fscanf(policyfile, '%d', [1 1]);
num_qq = 12;
num_zq = 1;
num_cstate = 4;
num_coeff = 1 + num_cstate + num_cstate * num_cstate;

Sigma = zeros(1, nAlphas);
Localx = zeros([num_cstate, nAlphas]);
alpha0 = zeros([num_qq, nAlphas]);
alpha1 = zeros([num_cstate, num_qq, nAlphas]);
alpha2 = zeros([num_cstate, num_cstate, num_qq, nAlphas]);

for i=1:nAlphas
    Sigma(i) = fscanf(policyfile, '%d', [1 1]) + 1;
    Localx(:, i) = fscanf(policyfile, '%f', num_cstate);
    alphaTmp = fscanf(policyfile, '%f', [num_coeff num_qq]);
    alpha0(:, i) = alphaTmp(1, :)';
    alpha1(:, :, i) = alphaTmp(2:(num_cstate+1), :);
    alpha2(:, :, :, i) = reshape(alphaTmp((num_cstate+2):num_coeff), num_coeff, num_coeff, []);
end

fclose(policyfile);

SimTime = 200;
endSim = false;

gamma = 0.99;

thresholddist = 6;

x_sim = zeros(SimTime+1, num_cstate);
q_sim = ones(SimTime+1, 1);
zq_sim = ones(SimTime+1, 1);
b_q = zeros(1, num_qq); b_q(1) = 1;
b_q = repmat(b_q, SimTime+1, 1);
control = zeros(SimTime+1, 1);

MatlabSimulationfile = ...
    fopen('../../problems/LaneMergingModel/OutFiles/MatlabSimulationfile.txt', 'w');
MatlabSimfile_Discrete = ...
    fopen('../../problems/LaneMergingModel/OutFiles/MatlabSimfile_Discrete.txt', 'w');

Reward = 0;

for k = 1:SimTime
    k
    control(k) = calpolicy2(x_sim(k, :), b_q(k, :), nAlphas, Sigma, Localx, Beta, thresholddist);
    
    str = sprintf('q = %d, x = (%f, %f, %f, %f), bq = (%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f), zq = %d, sigma = %d', ...
                  q_sim(k), x_sim(k, 1), x_sim(k, 2), x_sim(k, 4), ...
                  b_q(k, 1), b_q(k, 2), b_q(k, 3), b_q(k, 4), b_q(k, 5), b_q(k, 6), ...
                  b_q(k, 7), b_q(k, 8), b_q(k, 9), b_q(k, 10), b_q(k, 11), b_q(k, 12), ...
                  zq_sim(k), control(k));
    disp(str);
    fprintf(MatlabSimfile_Discrete, '%d  %f  %f  %f  %f  %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f  %d  %d\n', ...
        q_sim(k), x_sim(k, 1), x_sim(k, 2), x_sim(k, 4),...
        b_q(k, 1), b_q(k, 2), b_q(k, 3), b_q(k, 4), b_q(k, 5), b_q(k, 6), ...
        b_q(k, 7), b_q(k, 8), b_q(k, 9), b_q(k, 10), b_q(k, 11), b_q(k, 12), ...
        zq_sim(k), control(k));
    
    Reward = Rewardfn(x_sim(k, :), b_q(k, :), control(k)) + gamma*Reward
    
    [q_next x_next, T, X, zq_next, b_q_next] = SampleNext(q_sim(k), x_sim(k, :), control(k), b_q(k, :));
    
    x_sim(k+1, :) = x_next;
    q_sim(k+1) = q_next;
    zq_sim(k+1) = zq_next;
    
    b_q(k+1, :) = b_q_next;
    
    for i = 1:length(T)
        fprintf(MatlabSimulationfile, '%f  %f\n', T(i)+k-1, X(i));
    end
    

end

fclose(MatlabSimulationfile);
fclose(MatlabSimfile_Discrete);







