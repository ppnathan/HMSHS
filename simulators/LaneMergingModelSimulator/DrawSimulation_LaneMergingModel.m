close all; clear all;

SimTime = 500;

MatlabSimfile_Discrete = fopen('../../problems/LaneMergingModel/OutFiles/simResultFile.txt', 'r');
% BestValueFile = fopen('../../problems/TwoDModel/OutFiles/BestValue.txt');
% NumBeliefs = 5000;
% BestValueFileData = fscanf(BestValueFile, '%f', [NumBeliefs+1 inf]);
% BestValueData = BestValueFileData(1:NumBeliefs, :);
% NumAlphasFn = BestValueFileData(NumBeliefs+1, :);
SimData_discrete = fscanf(MatlabSimfile_Discrete, '%f', [19 inf]);
fclose(MatlabSimfile_Discrete);
q_sim = SimData_discrete(1, :)';
x_sim = SimData_discrete(2:5, :)';
b_q  = SimData_discrete(6:17, :)';
zq = SimData_discrete(18, :)';
control = SimData_discrete(19, :)';

q_sim(1)

%%

figureposition = [0 500 2048 300]; figurelinewidth = 1.5; figurefontsize = 40; markersize = 8;
savedir = './figures/';

% draw (x_t(1) - x_t(3))
figure('Position', figureposition)
plot(x_sim(:, 1) - x_sim(:, 3), 'k', 'LineWidth', figurelinewidth+0.5); hold on;
%plot(x_sim(:, 3), 'b', 'LineWidth', figurelinewidth+0.5); hold on;
xlabel('t', 'FontSize', figurefontsize);
ylabel('Position', 'FontSize', figurefontsize);
%title('x(t)', 'FontSize', figurefontsize);hold on;
%legend('x_1(t)', 'x_2(t)', 'Location', [.9,.7,.1,.2]);
set(gca, 'FontSize', figurefontsize);
savepath = [savedir 'positions.png'];
set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

% draw (x_t(2), x_t(4))
figure('Position', figureposition)
plot(x_sim(:, 2), 'k', 'LineWidth', figurelinewidth+0.5); hold on;
plot(x_sim(:, 4), 'b', 'LineWidth', figurelinewidth+0.5);
xlabel('t', 'FontSize', figurefontsize); ylabel('Velocities', 'FontSize', figurefontsize);
%title('v(t)', 'FontSize', figurefontsize);hold on;
legend('v_1(t)', 'v_2(t)', 'Location', [.9,.7,.1,.2]);
set(gca, 'FontSize', figurefontsize);
savepath = [savedir 'velocities.png'];
set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

% draw q(t)
% figure('Position', figureposition)
% plot((q_sim>2)+1, 'b', 'LineWidth', figurelinewidth);
% xlabel('t', 'FontSize', figurefontsize); ylabel('q_1', 'FontSize', figurefontsize);
% %title('q(t)', 'FontSize', figurefontsize);
% hold on;
% plot(zq, 'ko', 'MarkerSize', markersize, 'LineWidth', figurelinewidth); hold off;
% legend('Actual q_1(t)', 'Observation z^q(t)', 'Location', [.8,.7,.1,.2]);
% set(gca,'YLim',[0.5 2.5], 'FontSize', figurefontsize, 'YTick',[1 2], 'YTickLabel',['Attentive ';'Distracted']);
% savepath = [savedir 'q_t_2D.png']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

% draw sigma(t)
figure('Position', figureposition)
plot(control, 'b', 'LineWidth', figurelinewidth);
xlabel('t', 'FontSize', figurefontsize); ylabel('sigma_1', 'FontSize', figurefontsize);
%title('\sigma (t)', 'FontSize', figurefontsize);hold on;
set(gca,'YLim',[-0.5 2.5], 'FontSize', figurefontsize, ...
    'YTick',[0 1 2], 'YTickLabel',['u = 0 '; 'u = 1 '; 'u = -1']);
savepath = [savedir 'sigmas.png'];
set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

% draw P(t);\
figure('Position', figureposition)
plot(sum(b_q(:, 1:3), 2), 'k', 'LineWidth', figurelinewidth); hold on;
plot(sum(b_q(:, 4:6), 2), 'b', 'LineWidth', figurelinewidth);
plot(sum(b_q(:, 7:9), 2), 'r', 'LineWidth', figurelinewidth);
plot(sum(b_q(:, 10:12), 2), 'm', 'LineWidth', figurelinewidth);
xlabel('t', 'FontSize', figurefontsize); ylabel('P_t', 'FontSize', figurefontsize-5);
%title('P(q=0, t)', 'FontSize', figurefontsize);hold on;
legend('Oblivious', 'Impatient', 'Courteous', 'Reasonable', 'Location', [.9,.6,.1,.2]);
set(gca,'YLim',[0 1], 'FontSize', figurefontsize);
savepath = [savedir 'P_t.png'];
set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

% % draw best value
% figure('Position', [0 0 1024 512]);
% for i = 1:size(BestValueData, 1);
%     plot(BestValueData(i, :),  'b', 'LineWidth', figurelinewidth); hold on;
% end
% %errorbar(1:size(BestValueData, 2),mean(BestValueData),std(BestValueData));
% xlabel('Iteration', 'FontSize', figurefontsize); ylabel('J(b)', 'FontSize', figurefontsize);
% %title('Value function in value iteration', 'FontSize', figurefontsize);hold on;
% set(gca,'XLim',[0 100], 'FontSize', figurefontsize);
% savepath = [savedir 'BestValue_2D.png']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);
% %boxplot(BestValueData);
% hold off;

% figure('Position', [0 0 1024 512]);
% plot(NumAlphasFn,'b', 'LineWidth', figurelinewidth);
% xlabel('Iteration', 'FontSize', figurefontsize); ylabel('Number of \alpha-functions', 'FontSize', figurefontsize);
% set(gca,'XLim',[0 100], 'FontSize', figurefontsize);
% savepath = [savedir 'NumberAlphaFn_2D.png']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

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
if(1)
    
figure('Position', figureposition)
change_lane_pos = -50;
left_most_pos = -510;
for i = 1:size(x_sim, 1)
    plot([left_most_pos, change_lane_pos], [0, 0], 'k--', 'LineWidth', figurelinewidth + 3); hold on;
    plot([left_most_pos, 50], [2, 2], 'k--', 'LineWidth', figurelinewidth + 3);
    plot([left_most_pos, change_lane_pos], [-2, -2], 'k--', 'LineWidth', figurelinewidth + 3);
    plot([change_lane_pos, 0], [-2, 0], 'k--', 'LineWidth', figurelinewidth + 3);
    plot([0, 50], [0, 0], 'k--', 'LineWidth', figurelinewidth + 3);
    set(gca,'XLim', [left_most_pos 50]);
    length_car = 7;
    width_car = 0.4;
    
    rectangle('Position', [x_sim(i, 1) - length_car*0.5, 1 - width_car*0.5, length_car, width_car], ...
        'FaceColor', 'b');
    if(x_sim(i, 3) < change_lane_pos)
        rectangle('Position', [x_sim(i, 3) - length_car*0.5, -1 - width_car*0.5, length_car, width_car], ...
            'FaceColor', 'r');
    elseif(x_sim(i, 3) >= change_lane_pos && x_sim(i, 3) < 0)
        y_tmp = - 2 / change_lane_pos * (x_sim(i, 3) - change_lane_pos/2);
        rectangle('Position', [x_sim(i, 3) - length_car*0.5, y_tmp - width_car*0.5, length_car, width_car], ...
            'FaceColor', 'r');
    else 
        rectangle('Position', [x_sim(i, 3) - length_car*0.5, 1 - width_car*0.5, length_car, width_car], ...
            'FaceColor', 'r');
    end
    hold off;
    pause(0.05);
end
    
    
end





