close all; clear all;

SimTime = 200;
NumBeliefs = 8000;

%q_sim = ones(SimTime, 1);
%x_sim = zeros(SimTime, 1);
%b_q = repmat([1 0], SimTime+1, 1);
%control = zeros(SimTime, 1);

MatlabSimfile_Discrete = fopen('../../problems/DrowsyDriverModel/OutFiles/MatlabSimfile_Discrete.txt', 'r');
BestValueFile = fopen('../../problems/DrowsyDriverModel/OutFiles/BestValue.txt');

BestValueFileData = fscanf(BestValueFile, '%f', [NumBeliefs+1 inf]);
BestValueData = BestValueFileData(1:NumBeliefs, :);
NumAlphasFn = BestValueFileData(NumBeliefs+1, :);
SimData_discrete = fscanf(MatlabSimfile_Discrete, '%f', [8 inf]);
q_sim = SimData_discrete(1, :)';
x_sim = SimData_discrete(2, :)';
b_q  = SimData_discrete(3:6, :)';
zq = SimData_discrete(7, :)';
control = SimData_discrete(8, :)';


%%

figureposition = [0 500 2048 300]; figurelinewidth = 1.5; figurefontsize = 32; markersize = 8;
savedir = './figures/';


% draw x(t)
figure('Position', figureposition)
plot(x_sim, 'b', 'LineWidth', figurelinewidth);
xlabel('t', 'FontSize', figurefontsize); ylabel('x', 'FontSize', figurefontsize);
%title('x(t)', 'FontSize', figurefontsize);hold on;
set(gca,'YLim',[-6 6], 'FontSize', figurefontsize);
savepath = [savedir 'x_t.png']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

% draw q(t)
figure('Position', figureposition)
plot((q_sim>2)+1, 'b', 'LineWidth', figurelinewidth);
xlabel('t', 'FontSize', figurefontsize); ylabel('q', 'FontSize', figurefontsize);
%title('q(t)', 'FontSize', figurefontsize);
hold on;
plot(zq, 'ko', 'MarkerSize', markersize, 'LineWidth', figurelinewidth); hold off;
legend('Actual q(t)', 'z_q(t)', 'Location', [.75,.7,.1,.2]);
set(gca,'YLim',[0.5 2.5], 'FontSize', figurefontsize, 'YTick',[1 2], 'YTickLabel',['Awake ';'Drowsy']);
savepath = [savedir 'q_t.png']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

% draw sigma_1(t)
figure('Position', figureposition)
plot((control>2)+1, 'b', 'LineWidth', figurelinewidth);
xlabel('t', 'FontSize', figurefontsize); ylabel('sigma_1', 'FontSize', figurefontsize);
%title('\sigma (t)', 'FontSize', figurefontsize);hold on;
set(gca,'YLim',[0.5 2.5], 'FontSize', figurefontsize, 'YTick',[1 2], 'YTickLabel',['Off';'On ']);
savepath = [savedir 'sigma1_t.png']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

% draw sigma2(t)
figure('Position', figureposition)
plot((mod(control, 2)==1)*1+(mod(control, 2)==0)*2, 'b', 'LineWidth', figurelinewidth);
xlabel('t', 'FontSize', figurefontsize); ylabel('sigma_2', 'FontSize', figurefontsize);
%title('\sigma (t)', 'FontSize', figurefontsize);hold on;
set(gca,'YLim',[0.5 2.5], 'FontSize', figurefontsize, 'YTick',[1 2], 'YTickLabel',['C_1';'C_2']);
savepath = [savedir 'sigma2_t.png']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

% draw P(q==1, t);\
figure('Position', figureposition)
plot(b_q(:, 1)+b_q(:, 2), 'b', 'LineWidth', figurelinewidth);
xlabel('t', 'FontSize', figurefontsize); ylabel('P(q=0)', 'FontSize', figurefontsize);
%title('P(q=0, t)', 'FontSize', figurefontsize);hold on;
set(gca,'YLim',[0 1], 'FontSize', figurefontsize);
savepath = [savedir 'P_t.png']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

% draw best value
figure('Position', [0 0 1024 512]);
for i = 1:size(BestValueData, 1);
    plot(BestValueData(i, :),  'b', 'LineWidth', figurelinewidth); hold on;
end
%errorbar(1:size(BestValueData, 2),mean(BestValueData),std(BestValueData));
xlabel('Iteration', 'FontSize', figurefontsize); ylabel('J(b)', 'FontSize', figurefontsize);
%title('Value function in value iteration', 'FontSize', figurefontsize);hold on;
set(gca,'XLim',[0 100], 'FontSize', figurefontsize);
savepath = [savedir 'BestValue.png']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);
%boxplot(BestValueData);
hold off;

figure('Position', [0 0 1024 512]);
plot(NumAlphasFn,'b', 'LineWidth', figurelinewidth);
xlabel('Iteration', 'FontSize', figurefontsize); ylabel('Number of \alpha-functions', 'FontSize', figurefontsize);
set(gca,'XLim',[0 100], 'FontSize', figurefontsize);
savepath = [savedir 'NumberAlphaFn.png']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

%%
if(0)
policyfile = fopen('../../problems/DrowsyDriverModel/OutFiles/policyfile.txt','r');
nAlphas = fscanf(policyfile, '%d', [1 1]);
num_qq = 2;%fscanf(policyfile, '%d', [1 1]);
num_zq = 2;%fscanf(policyfile, '%d', [1 1]);
num_cstate = 1;
thresholddist = 1;

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


[x,b_q1] = meshgrid(-5:.2:5, 0:.02:1);
z = zeros(size(x));
for i = 1:size(x, 1)
    i
    for j=1:size(x, 2)
        j
        z(i, j) = calJ_star(x(i, j), b_q1(i, j), nAlphas, Sigma, Beta, zx);
    end
end
%plotfunc3d(f(x, b_q1), x = -5..5, b_q1 = 0..1);
figure;
surf(x, b_q1, z);
xlabel('x', 'FontSize', figurefontsize); ylabel('b(q=0,x)', 'FontSize', figurefontsize); zlabel('J(b)', 'FontSize', figurefontsize);
%title('Value function', 'FontSize', figurefontsize);
set(gca,'FontSize', figurefontsize);
savepath = [savedir 'ValueFunction.png']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);


save valuefunction.mat x b_q1 z;
end
%%
if(0)
load valuefunction.mat
figure('Position', [0 0 1024 512]);
surf(x, b_q1, z);
xlabel('x', 'FontSize', figurefontsize); ylabel('b(q=0,x)', 'FontSize', figurefontsize); zlabel('J(b)', 'FontSize', figurefontsize);
%title('Value function', 'FontSize', figurefontsize);
set(gca,'FontSize', figurefontsize);
savepath = [savedir 'ValueFunction.png']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);


plotStyle = 'ymcrgbkymcrgbkymcrgbkymcrgbk';
figure('Position', [0 0 1024 1024]);
for i = 1:7
    plot(b_q1(:, (i-1)*8+1), z(:, (i-1)*8+1), plotStyle(i),  'LineWidth', figurelinewidth);hold on;
    str = sprintf('x = %f', x(1, (i-1)*8+1));
    legendInfo{i} = str;
end
legend(legendInfo, 'Location', 'SouthEast');
%hleg = legend('Human state', 'Observed state', 'Location', [.8,.75,.1,.2]);
xlabel('b(q=0, x)', 'FontSize', figurefontsize); ylabel('J(b)', 'FontSize', figurefontsize);
%title('Value function', 'FontSize', figurefontsize);hold on;
set(gca,'YLim', [1500 2000], 'FontSize', figurefontsize);
savepath = [savedir 'ValueFunctionFixedx.png']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);
hold off;
end
%%
% Step = 100000;
% 
% MatlabSimulationfile = fopen('../../problems/DrowsyDriverModel/OutFiles/MatlabSimulationfile.txt', 'r');
% SimulatedData = fscanf(MatlabSimulationfile, '%f', [2 1]);
% figure
% for i = 1:1000
%     i
%     if(~feof(MatlabSimulationfile))
%         SimulatedData = fscanf(MatlabSimulationfile, '%f', [2 Step]);
%         %plot(SimulatedData(1, :), SimulatedData(2, :)); hold on;
%         u_t = SimulatedData(2, :)*(-0.5).*(mod(control(ceil(SimulatedData(1, :))), 2)==0)';
%         plot(SimulatedData(1, :), u_t); hold on;
%     else
%         break;
%     end
% end
% xlabel('t', 'FontSize', figurefontsize); ylabel('u', 'FontSize', figurefontsize);
% %title('x(t)', 'FontSize', figurefontsize);hold on;
% set(gca,'YLim',[-6 6], 'FontSize', figurefontsize);
% savepath = [savedir 'u_t.png']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);
% hold off;
% fclose(MatlabSimulationfile);






