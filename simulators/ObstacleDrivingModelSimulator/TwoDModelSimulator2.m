close all;
clear all;

policyfile = fopen('../../problems/TwoDModel/OutFiles/policyfile.txt','r');

nAlphas = fscanf(policyfile, '%d', [1 1]);
num_qq = 4;%fscanf(policyfile, '%d', [1 1]);
num_zq = 2;%fscanf(policyfile, '%d', [1 1]);
num_cstate = 2;
num_coeff = 6;

Sigma = zeros(nAlphas, 1);
Localx = zeros([nAlphas num_cstate]);
Beta = zeros([num_qq num_coeff nAlphas]);

for i=1:nAlphas
    Sigma(i) = fscanf(policyfile, '%d', [1 1])+1;
    Localx(i, :) = fscanf(policyfile, '%f', num_cstate);
    Betatmp = fscanf(policyfile, '%f', [num_coeff num_qq]);
    Beta(:, :, i) = Betatmp';
end

% for i=1:nAlphas
%     Sigma(i) = fscanf(policyfile, '%d', [1 1])+1;
%     Betatmp = fscanf(policyfile, '%f', [num_samples num_qq*num_zq]);
%     Beta(:, :, :, i) = reshape(Betatmp, [num_samples num_zq num_qq]);
% end

fclose(policyfile);


SimTime = 200;

gamma = 0.95;

thresholddist = 1;

x_sim = zeros(SimTime+1, num_cstate);
q_sim = ones(SimTime+1, 1);
zq_sim = ones(SimTime+1, 1);
b_q = zeros(1, num_qq); b_q(1) = 1;
b_q = repmat(b_q, SimTime+1, 1);
control = zeros(SimTime+1, 1);

MatlabSimulationfile = fopen('../../problems/TwoDModel/OutFiles/MatlabSimulationfile.txt', 'w');
MatlabSimfile_Discrete = fopen('../../problems/TwoDModel/OutFiles/MatlabSimfile_Discrete.txt', 'w');

Reward = 0;

for k = 1:SimTime
    k
%     control(k) = calpolicy(x_sim(k), b_q(k, :), nAlphas, Sigma, Beta, zx);
    control(k) = calpolicy2(x_sim(k, :), b_q(k, :), nAlphas, Sigma, Localx, Beta, thresholddist);
    str = sprintf('q = %d, x = (%f, %f), bq = (%f, %f, %f, %f), zq = %d, sigma = %d', q_sim(k), x_sim(k, 1), x_sim(k, 2), b_q(k, 1), b_q(k, 2), b_q(k, 3), b_q(k, 4), zq_sim(k), control(k));
    disp(str);
    fprintf(MatlabSimfile_Discrete, '%d  %f  %f  %f  %f  %f  %f  %d  %d\n', q_sim(k), x_sim(k, 1), x_sim(k, 2), b_q(k, 1), b_q(k, 2), b_q(k, 3), b_q(k, 4), zq_sim(k), control(k));
    
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










