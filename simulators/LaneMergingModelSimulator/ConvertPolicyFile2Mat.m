policyfile = fopen('../../problems/LaneMergingModel/OutFiles/policyfile.txt','r');

nAlphas = fscanf(policyfile, '%d', [1 1]);
num_qq = 12;
num_cstate = 4;
num_coeff = 1 + num_cstate + num_cstate * num_cstate;

sigmas = zeros(nAlphas, 1);
localxs = zeros([num_cstate, nAlphas]);
params = zeros(num_coeff * num_qq , nAlphas);
% alpha0s = zeros([num_qq, nAlphas]);
% alpha1s = zeros([num_cstate, num_qq, nAlphas]);
% alpha2s = zeros([num_cstate, num_cstate, num_qq, nAlphas]);

for i = 1:nAlphas
    sigmas(i) = fscanf(policyfile, '%d', [1 1]) + 1;
    localxs(:, i) = fscanf(policyfile, '%f', num_cstate);
    params(:, i) = fscanf(policyfile, '%f', num_coeff * num_qq);
%     alpha0s(:, i) = alphaTmp(1, :)';
%     alpha1s(:, :, i) = alphaTmp(2:(num_cstate+1), :);
%     alpha2s(:, :, :, i) = reshape(alphaTmp((num_cstate+2):num_coeff, :), num_coeff, num_coeff, []);
end

fclose(policyfile);

localxs = [0; reshape(localxs, num_cstate * nAlphas, 1)];
params = [0; reshape(params, num_coeff * num_qq * nAlphas, 1)];
nAlphas = [0; nAlphas];
sigmas = [0; sigmas];


save('nAlphas.mat', 'nAlphas');
save('sigmas.mat', 'sigmas');
save('localxs.mat', 'localxs');
save('params.mat', 'params');