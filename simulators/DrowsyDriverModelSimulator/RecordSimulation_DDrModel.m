close all; clear all;

SimTime = 600;
NumBeliefs = 100;

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


Step = 100000;
MatlabSimulationfile = fopen('../../problems/DrowsyDriverModel/OutFiles/MatlabSimulationfile.txt', 'r');
SimulatedData = fscanf(MatlabSimulationfile, '%f', [2 1]);
SimulatedData = fscanf(MatlabSimulationfile, '%f', [2 inf]);
u_t = SimulatedData(2, :)*(-0.5).*(mod(control(ceil(SimulatedData(1, :))), 2)==0)';

%%

figureposition = [0 500 2048 300]; figurelinewidth = 1.5; figurefontsize = 32; markersize = 8;
savedir = './figures/';

RecordTime = 300;

savepath = [savedir 'Combinedplot.avi'];
writerObj = VideoWriter(savepath); writerObj.FrameRate = 15; open(writerObj);
fig = figure('Position', [0 0 2048 1024]);
for i = 1:RecordTime
    subplot(4, 1, 1);
    plot(x_sim(1:i), 'b', 'LineWidth', figurelinewidth);
    ylabel('x', 'FontSize', figurefontsize);
    set(gca,'YLim',[-6 6], 'XLim',[0 RecordTime], 'FontSize', figurefontsize);
    
    subplot(4, 1, 2);
    plot((q_sim(1:i)>2)+1, 'b', 'LineWidth', figurelinewidth);
    ylabel('q', 'FontSize', figurefontsize);
    set(gca,'YLim',[0.5 2.5], 'XLim',[0 RecordTime], 'FontSize', figurefontsize, 'YTick',[1 2], 'YTickLabel',['Awake ';'Drowsy']);
    
    subplot(4, 1, 3);
    plot((control(1:i)>2)+1, 'b', 'LineWidth', figurelinewidth);
    ylabel('\sigma_1', 'FontSize', figurefontsize);
    set(gca,'YLim',[0.5 2.5], 'XLim',[0 RecordTime], 'FontSize', figurefontsize, 'YTick',[1 2], 'YTickLabel',['Off';'On ']);
    
    subplot(4, 1, 4);
    numdataplot = max(find(SimulatedData(1, :)<=i));
    plot(SimulatedData(1, 1:numdataplot), u_t(1:numdataplot), 'b', 'LineWidth', figurelinewidth);
    xlabel('t', 'FontSize', figurefontsize); ylabel('u', 'FontSize', figurefontsize);
    set(gca,'YLim',[-3 3], 'XLim',[0 RecordTime], 'FontSize', figurefontsize);

    %plot((mod(control(1:i), 2)==1)*1+(mod(control(1:i), 2)==0)*2, 'b', 'LineWidth', figurelinewidth);
    %xlabel('t', 'FontSize', figurefontsize); ylabel('\sigma_2', 'FontSize', figurefontsize);
    %set(gca,'YLim',[0.5 2.5], 'XLim',[0 RecordTime], 'FontSize', figurefontsize, 'YTick',[1 2], 'YTickLabel',['C_1';'C_2']);
    
    frame = getframe(fig);
    writeVideo(writerObj,frame);
end
close(fig);
close(writerObj);

% % record x(t)
% savepath = [savedir 'x_t.avi'];
% writerObj = VideoWriter(savepath); writerObj.FrameRate = 15; open(writerObj);
% fig = figure('Position', figureposition);
% for i = 1:RecordTime
%     plot(x_sim(1:i), 'b', 'LineWidth', figurelinewidth);
%     xlabel('t', 'FontSize', figurefontsize); ylabel('x', 'FontSize', figurefontsize);
%     set(gca,'YLim',[-6 6], 'XLim',[0 RecordTime], 'FontSize', figurefontsize);
%     frame = getframe(fig);
%     writeVideo(writerObj,frame);
% %    aviobj = addframe(aviobj, frame);
% end
% close(fig);
% close(writerObj);
% 
% % draw q(t)
% savepath = [savedir 'q_t.avi'];
% writerObj = VideoWriter(savepath); writerObj.FrameRate = 15; open(writerObj);
% fig = figure('Position', figureposition);
% for i = 1:RecordTime
%     plot((q_sim(1:i)>2)+1, 'b', 'LineWidth', figurelinewidth);
%     xlabel('t', 'FontSize', figurefontsize); ylabel('q', 'FontSize', figurefontsize);
%     set(gca,'YLim',[0.5 2.5], 'XLim',[0 RecordTime], 'FontSize', figurefontsize, 'YTick',[1 2], 'YTickLabel',['Awake ';'Drowsy']);
%     frame = getframe(fig);
%     writeVideo(writerObj,frame);
% end
% close(fig);
% close(writerObj);
% 
% % draw sigma_1(t)
% savepath = [savedir 'sigma1_t.avi'];
% writerObj = VideoWriter(savepath); writerObj.FrameRate = 15; open(writerObj);
% fig = figure('Position', figureposition);
% for i = 1:RecordTime
%     plot((control(1:i)>2)+1, 'b', 'LineWidth', figurelinewidth);
%     xlabel('t', 'FontSize', figurefontsize); ylabel('\sigma_1', 'FontSize', figurefontsize);
%     set(gca,'YLim',[0.5 2.5], 'XLim',[0 RecordTime], 'FontSize', figurefontsize, 'YTick',[1 2], 'YTickLabel',['Off';'On ']);
%     frame = getframe(fig);
%     writeVideo(writerObj,frame);
% end
% close(fig);
% close(writerObj);
% 
% 
% % draw sigma2(t)
% savepath = [savedir 'sigma2_t.avi'];
% writerObj = VideoWriter(savepath); writerObj.FrameRate = 15; open(writerObj);
% fig = figure('Position', figureposition);
% for i = 1:RecordTime
%     plot((mod(control(1:i), 2)==1)*1+(mod(control(1:i), 2)==0)*2, 'b', 'LineWidth', figurelinewidth);
%     xlabel('t', 'FontSize', figurefontsize); ylabel('\sigma_2', 'FontSize', figurefontsize);
%     set(gca,'YLim',[0.5 2.5], 'XLim',[0 RecordTime], 'FontSize', figurefontsize, 'YTick',[1 2], 'YTickLabel',['C_1';'C_2']);
%     frame = getframe(fig);
%     writeVideo(writerObj,frame);
% end
% close(fig);
% close(writerObj);
% 
% % draw P(q==1, t);\
% savepath = [savedir 'P_t.avi'];
% writerObj = VideoWriter(savepath); writerObj.FrameRate = 15; open(writerObj);
% fig = figure('Position', figureposition);
% for i = 1:RecordTime
%     plot(b_q((1:i), 1)+b_q((1:i), 2), 'b', 'LineWidth', figurelinewidth);
%     xlabel('t', 'FontSize', figurefontsize); ylabel('P(q=0)', 'FontSize', figurefontsize);
%     set(gca,'YLim',[0 1], 'XLim',[0 RecordTime], 'FontSize', figurefontsize);
%     frame = getframe(fig);
%     writeVideo(writerObj,frame);
% end
% close(fig);
% close(writerObj);
