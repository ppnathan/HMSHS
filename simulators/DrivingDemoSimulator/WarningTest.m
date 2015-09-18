close all;
clear all;

%% Read policyfile.
policyfile = fopen('../../problems/DrivingDemoModel/OutFiles/policyfile.txt','r');

nAlphas = fscanf(policyfile, '%d', [1 1]);
num_qq = 8; %fscanf(policyfile, '%d', [1 1]);
num_cstate = 1;
num_coeff = 3;

Sigma = zeros(nAlphas, 1);
Localx = zeros([nAlphas num_cstate]);
Beta = zeros([num_qq num_coeff nAlphas]);

for i=1:nAlphas
    Sigma(i) = fscanf(policyfile, '%d', [1 1])+1;
    Localx(i, :) = fscanf(policyfile, '%f', num_cstate);
    Betatmp = fscanf(policyfile, '%f', [num_coeff num_qq]);
    Beta(:, :, i) = Betatmp';
end

fclose(policyfile);


%% Simulation starts.
SimTime = 500;

gamma = 0.95;

thresholddist = 1;

x_sim = zeros(SimTime+1, num_cstate);
q_sim = ones(SimTime+1, 1);
zq_sim = ones(SimTime+1, 1);
b_q = zeros(1, num_qq); b_q(1) = 1;
b_q = repmat(b_q, SimTime+1, 1);
control = zeros(SimTime+1, 1);
headpose = zeros(SimTime+1, 5);

MatlabSimfile_Discrete = fopen('WarningTestSimfile_Discrete.txt', 'w');

Reward = 0;
figure;
for k = 1:SimTime
    k
    
    control(k) = calpolicy(x_sim(k, :), b_q(k, :), nAlphas, Sigma, Localx, Beta, thresholddist);
    str = sprintf('q = %d, x = (%f), bq = (%f, %f, %f, %f, %f, %f, %f, %f ), zq = %d, sigma = %d', q_sim(k), x_sim(k, 1),...
              b_q(k, 1), b_q(k, 2), b_q(k, 3), b_q(k, 4), b_q(k, 5), b_q(k, 6), b_q(k, 7), b_q(k, 8), zq_sim(k), control(k));
    disp(str);
    fprintf(MatlabSimfile_Discrete, '%d  %f  %f  %f  %f  %f  %f  %f  %f  %f  %d  %d\n', q_sim(k), x_sim(k, 1),...
        b_q(k, 1), b_q(k, 2), b_q(k, 3), b_q(k, 4), b_q(k, 5), b_q(k, 6), b_q(k, 7), b_q(k, 8), zq_sim(k), control(k));
    control(k)
    
    hplookback = 30;
    
    subplot(2, 1, 1);
    plot(ceil(control(max(1, k-hplookback):k)/2), 'r');
    title('Warning');
    set(gca,'YLim',[0.5 2.5], 'FontSize', 14, 'YTick',[1 2], 'YTickLabel',['Off';'On ']);
    drawnow;
    subplot(2, 1, 2);
    plot((mod(control(max(1, k-hplookback):k), 2)==1)*1 + (mod(control(max(1, k-hplookback):k), 2)==0)*2, 'r');
    title('Control Intervention');
    set(gca,'YLim',[0.5 2.5], 'FontSize', 14, 'YTick',[1 2], 'YTickLabel',['Off';'On ']);
    drawnow;
    
%    Reward = Rewardfn(x_sim(k, :), b_q(k, :), control(k)) + gamma*Reward
    
    Q = msgDecoder('128.32.44.164',4950, 4950);
    headpose(k+1, : ) = Q';
    fprintf('Yaw = %d, Pitch = %d, Roll = %d, exp = %d, time = %d \n', Q(1), Q(2),Q(3),Q(4),Q(5));
    
    
    
    [q_next, x_next, zq_next, b_q_next] = WarningTestSampleNext(q_sim(k), x_sim(k, :), headpose(max(1, k-hplookback):(k+1), :), control(k), b_q(k, :));
    
%     if(x_next >1.8)
%         x_next = 1.8- abs(x_next-1.8);
%         b_q_next(1) = b_q_next(1)+b_q_next(3);
%         b_q_next(2) = b_q_next(2)+b_q_next(4);
%         b_q_next(5) = b_q_next(5)+b_q_next(7);
%         b_q_next(6) = b_q_next(6)+b_q_next(8);
%         
%         if(q_next ==1 || q_next ==3)
%             q_next = 1;
%         elseif(q_next ==2 || q_next ==4)
%             q_next = 2;
%         elseif(q_next ==5 || q_next ==7)
%             q_next = 5;
%         else %(q_next ==6 || q_next ==8)
%             q_next = 6;
%         end
%     end
    
    x_sim(k+1, :) = x_next;
    q_sim(k+1) = q_next;
    zq_sim(k+1) = zq_next;
    
    b_q(k+1, :) = b_q_next;    

end

%fclose(MatlabSimulationfile);
fclose(MatlabSimfile_Discrete);










