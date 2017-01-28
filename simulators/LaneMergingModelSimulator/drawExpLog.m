function drawExpLog(filename)

load(filename)


t_sim = belief.data(:, belief.numSignals);
b_q  = belief.data(:, 1:(belief.numSignals-1));
q_sim = u_out.data(:, 1) - 1;
u_real = u_out.data(:, 2);
control = u_out.data(:, 3) - 1;
x_sim = u_out.data(:, 4:7);

mode = {'oblivious', 'aggressive', 'courteous', 'reasonable'};
driver_mode = mode{floor(q_sim(1)/3)+1}

%%
figureposition = [0 500 2048 300]; figurelinewidth = 1.5; figurefontsize = 20; markersize = 8;
savedir = './figures/';

% draw (x_t(1) - x_t(3))
figure('Position', figureposition)
plot(t_sim, x_sim(:, 1) - x_sim(:, 3), 'k', 'LineWidth', figurelinewidth+0.5); hold on;
%plot(x_sim(:, 3), 'b', 'LineWidth', figurelinewidth+0.5); hold on;
xlabel('t', 'FontSize', figurefontsize);
ylabel('Position', 'FontSize', figurefontsize);
%title('x(t)', 'FontSize', figurefontsize);hold on;
%legend('x_1(t)', 'x_2(t)', 'Location', [.9,.7,.1,.2]);
set(gca, 'FontSize', figurefontsize);   
savepath = [savedir 'positions_HMSHS_' driver_mode '.png'];
set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

% draw (x_t(2), x_t(4))
figure('Position', figureposition)
plot(t_sim, x_sim(:, 2), 'b', 'LineWidth', figurelinewidth+0.5); hold on;
plot(t_sim, x_sim(:, 4), 'k', 'LineWidth', figurelinewidth+0.5);
xlabel('t', 'FontSize', figurefontsize); ylabel('Velocities', 'FontSize', figurefontsize);
%title('v(t)', 'FontSize', figurefontsize);hold on;
legend('v_1(t)', 'v_2(t)', 'Location', [.9,.7,.1,.2]);
set(gca, 'FontSize', figurefontsize);
savepath = [savedir 'velocities_HMSHS_' driver_mode '.png'];
set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

% draw sigma(t)
figure('Position', figureposition)
control = (control == 0)*0 + (control == 1)*1 + (control == 2)*(-1);
plot(t_sim, u_real, 'b', 'LineWidth', figurelinewidth);
xlabel('t', 'FontSize', figurefontsize); ylabel('sigma_1', 'FontSize', figurefontsize);
%title('\sigma (t)', 'FontSize', figurefontsize);hold on;
% set(gca,'YLim',[-0.5 2.5], 'FontSize', figurefontsize, ...
%     'YTick',[0 1 2], 'YTickLabel',['u = 0 '; 'u = 1 '; 'u = -1']);
savepath = [savedir 'sigmas_HMSHS_' driver_mode '.png'];
set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

%draw P(t);
figure('Position', figureposition)
plot(t_sim, sum(b_q(:, 1:3), 2), 'k', 'LineWidth', figurelinewidth); hold on;
plot(t_sim, sum(b_q(:, 4:6), 2), 'b', 'LineWidth', figurelinewidth);
plot(t_sim, sum(b_q(:, 7:9), 2), 'r', 'LineWidth', figurelinewidth);
plot(t_sim, sum(b_q(:, 10:12), 2), 'm', 'LineWidth', figurelinewidth);
xlabel('t', 'FontSize', figurefontsize); ylabel('P_t', 'FontSize', figurefontsize-5);
%title('P(q=0, t)', 'FontSize', figurefontsize);hold on;
legend('Oblivious', 'Aggressive', 'Courteous', 'Reasonable', 'Location', [.9,.6,.1,.2]);
set(gca,'YLim',[0 1], 'FontSize', figurefontsize);
savepath = [savedir 'P_t_HMSHS_' driver_mode '.png'];
set(gcf,'PaperPositionMode','auto'); print(gcf, '-dpng', savepath);

%%
if(1)
    
figure('Position', figureposition)
change_lane_pos = -50;
left_most_pos = -510;
% savepath = [savedir 'LaneMergingSim_HMSHS_' driver_mode '.avi'];
% LaneMergingVideo = VideoWriter(savepath);
% LaneMergingVideo.FrameRate = 20;
% open(LaneMergingVideo);
for i = 1:size(x_sim, 1)
    plot([left_most_pos, change_lane_pos], [0, 0], 'k', 'LineWidth', figurelinewidth + 3); hold on;
    plot([left_most_pos, 50], [2, 2], 'k', 'LineWidth', figurelinewidth + 3);
    plot([left_most_pos, change_lane_pos], [-2, -2], 'k', 'LineWidth', figurelinewidth + 3);
    plot([change_lane_pos, 0], [-2, 0], 'k', 'LineWidth', figurelinewidth + 3);
    plot([0, 50], [0, 0], 'k', 'LineWidth', figurelinewidth + 3);
    title(['A ' driver_mode ' driver vs our policy.'], 'FontSize', figurefontsize);
    set(gca,'XLim', [left_most_pos 50], 'FontSize', figurefontsize);
    length_car = 7;
    width_car = 0.4;
    
    rectangle('Position', [x_sim(i, 1) - length_car*0.5, 1 - width_car*0.5, length_car, width_car], ...
        'FaceColor', 'b');
    if(x_sim(i, 3) < change_lane_pos)
        rectangle('Position', [x_sim(i, 3) - length_car*0.5, -1 - width_car*0.5, length_car, width_car], ...
            'FaceColor', 'k');
    elseif(x_sim(i, 3) >= change_lane_pos && x_sim(i, 3) < 0)
        y_tmp = - 2 / change_lane_pos * (x_sim(i, 3) - change_lane_pos/2);
        rectangle('Position', [x_sim(i, 3) - length_car*0.5, y_tmp - width_car*0.5, length_car, width_car], ...
            'FaceColor', 'k');
    else 
        rectangle('Position', [x_sim(i, 3) - length_car*0.5, 1 - width_car*0.5, length_car, width_car], ...
            'FaceColor', 'k');
    end
    hold off;
%     frame = getframe(gcf);
    pause(0.05);
%    writeVideo(LaneMergingVideo, frame);
end





end