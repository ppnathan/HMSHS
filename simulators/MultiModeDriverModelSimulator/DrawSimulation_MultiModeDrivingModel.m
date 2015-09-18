close all; clear all;

load('processeddata.mat');
datalen = length(x);

%q_sim = ones(SimTime, 1);
%x_sim = zeros(SimTime, 1);
%b_q = repmat([1 0], SimTime+1, 1);
%control = zeros(SimTime, 1);

MatlabSimfile_Discrete = fopen('./OutFiles/MatlabSimfile_Discrete.txt', 'r');

SimData_discrete = fscanf(MatlabSimfile_Discrete, '%f', [14 inf]);
mode_sim = SimData_discrete(1, :)';
x_to_middle_sim = SimData_discrete(2, :)';
d_to_frontobs_sim = SimData_discrete(3, :)';

b_q  = SimData_discrete(4:11, :)';
zq = SimData_discrete(12, :)';
control = SimData_discrete(13, :)';
control_rulebased = SimData_discrete(14, :)'; %'
Warning = (control>2)+1;
Intervention = (mod(control, 2)==1)*1+(mod(control, 2)==0)*2;
datalen = length(mode_sim);


%%


figureposition = [0 500 2048 300]; figurelinewidth = 1.5; figurefontsize = 20; markersize = 8;
deltaT = 0.025;
T_start = 21800; T_end = 29000;
T_shift4drawing = (T_start-1)*deltaT;
%savedir = '/Users/ppnathan/Documents/Research/ECC2015/figures/';
savedir = './OutFiles/';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%-----------------------draw x_to_middle, d_to_front, warning and intervention---------------------------%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
barwidth = 15;

modediffidx = find(diff(mode_sim(T_start:T_end))~=0) + T_start-1;
driverstate_diffidx = find(diff(driver_state(T_start:T_end))~=0) + T_start-1;
WarningDiffIdx = find(diff(Warning(T_start:T_end))~= 0) + T_start - 1;
InterventionDiffIdx = find(diff(Intervention(T_start:T_end))~=0) + T_start -1;
RuleBasedCtrlDiffIdx = find(diff(control_rulebased(T_start:T_end))~=0) + T_start - 1;

figure('Position', figureposition);

annostart = T_start;
for(i = 1:length(driverstate_diffidx)+1)
	if (i ~= length(driverstate_diffidx)+1)
		annoend = driverstate_diffidx(i);
	else
		annoend = T_end;
	end
	if(driver_state(annoend) == 1)
		handle_b = plot((annostart:annoend)*deltaT - T_shift4drawing, x_to_middle_sim(annostart:annoend), 'b', 'LineWidth', 3.5); hold on;
	elseif(driver_state(annoend) == 2)
		handle_y = plot((annostart:annoend)*deltaT - T_shift4drawing, x_to_middle_sim(annostart:annoend), 'y', 'LineWidth', 3.5); hold on;
	else
		handle_r = plot((annostart:annoend)*deltaT - T_shift4drawing, x_to_middle_sim(annostart:annoend), 'r', 'LineWidth', 3.5); hold on;
    end
    
	annostart = annoend+1;
end
legend([handle_y, handle_r, handle_b], 'Phone rings','Texting','Otherwise', 'Location', 'southeast');

if(0)
annostart = T_start;
for(i = 1:length(modediffidx)+1)
	if (i ~= length(modediffidx)+1)
		annoend = modediffidx(i);
	else
		annoend = T_end;
	end
	if(mode_sim(annoend) == 1)
		plot((annostart:annoend)*deltaT - T_shift4drawing, x_to_middle_sim(annostart:annoend), 'b', 'LineWidth', figurelinewidth); hold on;
	else
		plot((annostart:annoend)*deltaT - T_shift4drawing, x_to_middle_sim(annostart:annoend), 'r', 'LineWidth', figurelinewidth); hold on;
	end
	annostart = annoend+1;
end
end

if(0)
annostart = T_start;
for(i = 1:length(modediffidx)+1)
	if (i ~= length(modediffidx)+1)
		annoend = modediffidx(i);
	else
		annoend = T_end;
	end
	if(mode_sim(annoend) == 1)
		plot((annostart:annoend)*deltaT - T_shift4drawing, 4*ones(1, length(annostart:annoend)), 'g', 'LineWidth', barwidth);
	else
		plot((annostart:annoend)*deltaT - T_shift4drawing, 4*ones(1, length(annostart:annoend)), 'k', 'LineWidth', barwidth);
	end
	annostart = annoend+1;
end
end
	
annostart = T_start;
for(i = 1:length(WarningDiffIdx)+1)
	if (i ~= length(WarningDiffIdx)+1)
		annoend = WarningDiffIdx(i);
	else
		annoend = T_end;
	end
	if(Warning(annoend) == 1)
%		plot((annostart:annoend)*deltaT - T_shift4drawing, -3*ones(1, length(annostart:annoend)), 'g', 'LineWidth', barwidth);
	else
		if(annostart == annoend)
			annoend = annoend+1;
		end
		plot((annostart:annoend)*deltaT - T_shift4drawing, -3*ones(1, length(annostart:annoend)), 'r', 'LineWidth', barwidth);
	end
	annostart = annoend+1;
end

if(1)
annostart = T_start;
for(i = 1:length(InterventionDiffIdx)+1)
	if (i ~= length(InterventionDiffIdx)+1)
		annoend = InterventionDiffIdx(i);
	else
		annoend = T_end;
	end
	if(Intervention(annoend) == 1)
%		plot((annostart:annoend)*deltaT - T_shift4drawing, -4*ones(1, length(annostart:annoend)), 'g',...
%		'Marker', 's', 'MarkerFaceColor', 'auto', 'MarkerSize', 'markersize');
	else
		if(annostart == annoend)
			annoend = annoend+1;
		end
		plot((annostart:annoend)*deltaT - T_shift4drawing, -4*ones(1, length(annostart:annoend)), 'r-',...
			'LineWidth', barwidth);
	end
	annostart = annoend+1;
end
end

annostart = T_start;
for(i = 1:length(RuleBasedCtrlDiffIdx)+1)
	if (i ~= length(RuleBasedCtrlDiffIdx)+1)
		annoend = RuleBasedCtrlDiffIdx(i);
	else
		annoend = T_end;
	end
	if(control_rulebased(annoend) == 1)
%		plot((annostart:annoend)*deltaT - T_shift4drawing, -5*ones(1, length(annostart:annoend)), 'g',...
%		'Marker', 's', 'MarkerFaceColor', 'auto', 'MarkerSize', 'markersize');
	else
		if(annostart == annoend)
			annoend = annoend+1;
		end
		plot((annostart:annoend)*deltaT - T_shift4drawing, -5*ones(1, length(annostart:annoend)), 'r',...
			'LineWidth', barwidth);
	end
	annostart = annoend+1;
end


dist2obs_fordrawing = d_to_frontobs_sim(T_start:T_end)' +(d_to_frontobs_sim(T_start:T_end)'<1)*50;
imagesc([(T_start*deltaT - T_shift4drawing) (T_end*deltaT - T_shift4drawing)], [4 4], dist2obs_fordrawing, [10 50]);
colormap(gray);

YTickLabelString = ['  Rule-Based';'Intervention';'     Warning';'          -2';'          -1';
                    '           0';'           1';'           2';'           3';'    Obstacle'];
set(gca,'XLim', [(T_start*deltaT - T_shift4drawing) (T_end*deltaT - T_shift4drawing)], 'YLim',[-5.5 4.5], 'FontSize', figurefontsize,...
 'YTick',[-5 -4 -3 -2 -1 0 1 2 3 4], 'YTickLabel', YTickLabelString);
xlabel('t (s)', 'FontSize', figurefontsize); ylabel('x(t)', 'FontSize', figurefontsize);

savepath = [savedir 'ExpResult_MMD.eps']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-depsc2', savepath);


%%---------------------- draw P(Attentive)--------------------------------------------
if(1)
P_attentive = sum(b_q(:, 1:2), 2).*(mode_sim == 1) + sum(b_q(:, 1:4), 2).*(mode_sim == 2);
figure('Position', figureposition)
plot((T_start:T_end)*deltaT - T_shift4drawing, P_attentive(T_start:T_end), 'b', 'LineWidth', figurelinewidth);
xlabel('t', 'FontSize', figurefontsize); ylabel('P(Attentive)', 'FontSize', figurefontsize-5);
%title('P(q=0, t)', 'FontSize', figurefontsize);hold on;
set(gca,'XLim', [(T_start*deltaT - T_shift4drawing) (T_end*deltaT - T_shift4drawing)], 'YLim',[0 1], 'FontSize', figurefontsize);
savepath = [savedir 'P_attentive_MMD.eps']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-depsc2', savepath);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% draw the trajectory in the course-------------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
if(0)
T_end = 26600;
driverstate_diffidx = find(diff(driver_state(T_start:T_end))~=0) + T_start-1;

figure;
annostart = T_start;
for(i = 1:length(driverstate_diffidx)+1)
	if (i ~= length(driverstate_diffidx)+1)
		annoend = driverstate_diffidx(i);
	else
		annoend = T_end;
	end
	if(driver_state(annoend) == 1)
		plot(x(annostart:annoend), y(annostart:annoend), 'b-', 'LineWidth', figurelinewidth); hold on;
	elseif(driver_state(annoend) == 2)
		plot(x(annostart:annoend), y(annostart:annoend), 'y-', 'LineWidth', figurelinewidth); hold on;
	else
		plot(x(annostart:annoend), y(annostart:annoend), 'r-', 'LineWidth', figurelinewidth); hold on;
	end
	annostart = annoend+1;
end
%timeindicator = 800:800:(T_end-T_start);
for(i = (0:800:(T_end-T_start-800))) %800 means 20s
	strtmp = sprintf('%d s', i*deltaT);
	text(laneRight0X(T_start+i), laneRight0Y(T_start+i)+10, strtmp);
end
	
plot(laneLeft0X(T_start:T_end), laneLeft0Y(T_start:T_end), 'k-', 'MarkerSize', 3); hold on;
plot(laneRight0X(T_start:T_end), laneRight0Y(T_start:T_end), 'k-', 'MarkerSize', 3); hold on;
plot((laneLeft0X(T_start:T_end)+laneRight0X(T_start:T_end))/2, (laneLeft0Y(T_start:T_end)+laneRight0Y(T_start:T_end))/2, 'k-', 'MarkerSize', 3);
plot(x(T_start), y(T_start), 'rx', 'MarkerSize', 15);
savepath = [savedir 'ExpCourseView.eps']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-depsc2', savepath);
end

	


% draw q(t)
if(0)
figure('Position', figureposition)
plot(driver_state, 'b', 'LineWidth', figurelinewidth);
xlabel('t', 'FontSize', figurefontsize); ylabel('Cell phone', 'FontSize', figurefontsize);
%title('Cell phone', 'FontSize', figurefontsize);
set(gca,'YLim',[0.5 3.5], 'FontSize', figurefontsize, 'YTick',[1 2 3], 'YTickLabel',['No ring'; 'Ringing'; 'Texting']);
savepath = [savedir 'cellphone_MMD.eps']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-depsc2', savepath);
end
	

% In no obstacle mode: Warning
if(0)
NoObsWarning = ((control == 3)|(control ==4)) & (mode_sim == 1);
NoObsWarningIdx = find(NoObsWarning);

if(~isempty(NoObsWarningIdx))
	k_warn = 100;
	if(NoObsWarningIdx(k_warn)-50 >0) 
		T_start = NoObsWarningIdx(k_warn)-50; 
	else 
		T_start = 0; 
	end
	if(NoObsWarningIdx(k_warn)+50 > datalen)
		T_end = datalen; 
	else
		T_end  = NoObsWarningIdx(k_warn)+50;
	end
	
	figure;
	plot(x(T_start:T_end), y(T_start:T_end), 'b.'); hold on;
	plot(x(T_start), y(T_start), 'rx'); hold on;
	plot(laneLeft0X(T_start:T_end), laneLeft0Y(T_start:T_end), 'k.'); hold on;
	plot(laneRight0X(T_start:T_end), laneRight0Y(T_start:T_end), 'k.'); hold on;
	plot((laneLeft0X(T_start:T_end)+laneRight0X(T_start:T_end))/2, (laneLeft0Y(T_start:T_end)+laneRight0Y(T_start:T_end))/2, 'k.');
	for(i = T_start:T_end)
		if(NoObsWarning(i)==1)
			plot(x(i), y(i), 'ro');
		end
		if(driver_state(i)==1)
			plot(x(i), y(i), 'b.');
		elseif(driver_state(i)==2)
			plot(x(i), y(i), 'y.');
		else
			plot(x(i), y(i), 'r.');
		end
	end
	title('Example of warning in no obstacle scenario');
end
end
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
% In no obstacle mode: Intervention----------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
if(1)  
samplingtimeexpand = 100;
NoObsIntervention = ((Intervention == 2)) & (mode_sim == 1);
NoObsInterventionIdx = find(NoObsIntervention);
if(~isempty(NoObsInterventionIdx))
	k_warn = 1;
	if(NoObsInterventionIdx(k_warn)-samplingtimeexpand >0) 
		T_start = NoObsInterventionIdx(k_warn)-samplingtimeexpand; 
	else 
		T_start = 0; 
	end
	if(NoObsInterventionIdx(k_warn)+samplingtimeexpand > datalen)
		T_end = datalen; 
	else
		T_end  = NoObsInterventionIdx(k_warn)+samplingtimeexpand;
	end
	
	figure;
%	plot(x(T_start:T_end), y(T_start:T_end), 'b.'); hold on;
%	plot(x(T_start), y(T_start), 'rx', 'MarkerSize', 15); hold on;
	plot(laneLeft0X(T_start:T_end), laneLeft0Y(T_start:T_end), 'k-'); hold on;
	plot(laneRight0X(T_start:T_end), laneRight0Y(T_start:T_end), 'k-'); hold on;
	plot((laneLeft0X(T_start:T_end)+laneRight0X(T_start:T_end))/2, (laneLeft0Y(T_start:T_end)+laneRight0Y(T_start:T_end))/2, 'k-');
	for(i = T_start:T_end)
		if(NoObsIntervention(i)==1)
			plot(x(i), y(i), 'ro','MarkerSize', 15, 'MarkerFaceColor', 'r');
			%strtmp = sprintf('%d s', i*deltaT);
			text(x(i)-13, y(i)+7, 'Intervention', 'Color', 'k', 'FontSize', 18);
		end
		
		if(driver_state(i)==1)
			plot(x(i), y(i), 'b.');
		elseif(driver_state(i)==2)
			plot(x(i), y(i), 'y.');
		else
			plot(x(i), y(i), 'r.');
		end
			
		if(mod(i, 40) == 0)
			strtmp = sprintf('%ds', floor(i*deltaT-T_shift4drawing));
			text(x(i)+3, y(i), strtmp, 'FontSize', 18);
		end
    end
    set(gca,'xtick',[]); set(gca,'xticklabel',[]); set(gca,'ytick',[]); set(gca,'yticklabel',[]);
    set(gca, 'FontSize', 18);
%	title('Example of intervention in no obstacle scenario');
	savepath = [savedir 'OffLaneIntervention.eps']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-depsc2', savepath);
end
end
	

% In obstacle mode: Warning
if(0)
ObsWarning = ((Warning==2)) & (mode_sim == 2);
ObsWarningIdx = find(ObsWarning);

if(~isempty(ObsWarningIdx))
	k_warn = 1;
	if(ObsWarningIdx(k_warn)-50 >0) 
		T_start = ObsWarningIdx(k_warn)-50; 
	else 
		T_start = 0; 
	end
	if(ObsWarningIdx(k_warn)+50 > datalen)
		T_end = datalen; 
	else
		T_end  = ObsWarningIdx(k_warn)+50;
	end
	
	figure;
	plot(x(T_start:T_end), y(T_start:T_end), 'b.'); hold on;
	plot(x(T_start), y(T_start), 'rx'); hold on;
	plot(laneLeft0X(T_start:T_end), laneLeft0Y(T_start:T_end), 'k.'); hold on;
	plot(laneRight0X(T_start:T_end), laneRight0Y(T_start:T_end), 'k.'); hold on;
	plot((laneLeft0X(T_start:T_end)+laneRight0X(T_start:T_end))/2, (laneLeft0Y(T_start:T_end)+laneRight0Y(T_start:T_end))/2, 'k.');
	for(i = T_start:T_end)
		if(ObsWarning(i)==1)
			plot(x(i), y(i), 'ro');
		end
		if(frontObj(1, i)>0)
			plot(frontObj(6, i), frontObj(7, i), 'g.');
		end
		if(driver_state(i)==1)
			plot(x(i), y(i), 'b.');
		elseif(driver_state(i)==2)
			plot(x(i), y(i), 'y.');
		else
			plot(x(i), y(i), 'r.');
		end
	end
	title('Example of warning in obstacle scenario');
end
end
	
% In obstacle mode: Intervention
if(0)
ObsIntervention = ((control == 2)|(control ==4)) & (mode_sim == 2);
ObsInterventionIdx = find(ObsIntervention);
if(~isempty(ObsInterventionIdx))
	k_warn = 50;
	if(ObsInterventionIdx(k_warn)-50 >0) 
		T_start = ObsInterventionIdx(k_warn)-50; 
	else 
		T_start = 1; 
	end
	if(ObsInterventionIdx(k_warn)+50 > datalen)
		T_end = datalen; 
	else
		T_end  = ObsInterventionIdx(k_warn)+50;
	end
	
	figure;
	plot(x(T_start:T_end), y(T_start:T_end), 'b.'); hold on;
	plot(x(T_start), y(T_start), 'rx'); hold on;
	plot(laneLeft0X(T_start:T_end), laneLeft0Y(T_start:T_end), 'k.'); hold on;
	plot(laneRight0X(T_start:T_end), laneRight0Y(T_start:T_end), 'k.'); hold on;
	plot((laneLeft0X(T_start:T_end)+laneRight0X(T_start:T_end))/2, (laneLeft0Y(T_start:T_end)+laneRight0Y(T_start:T_end))/2, 'k.');
	for(i = T_start:T_end)
		if(ObsIntervention(i)==1)
			plot(x(i), y(i), 'ro');
		end
		if(frontObj(1, i)>0)
			plot(frontObj(6, i), frontObj(7, i), 'g.');
		end
		if(driver_state(i)==1)
			plot(x(i), y(i), 'b.');
		elseif(driver_state(i)==2)
			plot(x(i), y(i), 'y.');
		else
			plot(x(i), y(i), 'r.');
		end
	end
	title('Example of intervention in obstacle scenario');
end	
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
%% draw a case in obstacle mode where our policy gave warning first and then intervention later, but the rule based only gave intervention at last.%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
T_start_case1 = 25000; T_end_case1 = 25250;

WarningInCase1Idx = find(Warning(T_start_case1:T_end_case1)==2)+T_start_case1-1;
InterventionInCase1Idx = find(Intervention(T_start_case1:T_end_case1)==2) + T_start_case1-1;
RuleBasedCtrlInCase1Idx = find(control_rulebased(T_start_case1:T_end_case1)==2) + T_start_case1-1;
	
	figure;
%	plot(x(T_start_case1:T_end_case1), y(T_start_case1:T_end_case1), 'b.'); hold on;
%	plot(x(T_start), y(T_start), 'rx', 'MarkerSize', 15); hold on;
	plot(laneLeft0X(T_start_case1:T_end_case1), laneLeft0Y(T_start_case1:T_end_case1), 'k-'); hold on;
	plot(laneRight0X(T_start_case1:T_end_case1), laneRight0Y(T_start_case1:T_end_case1), 'k-'); hold on;
	plot((laneLeft0X(T_start_case1:T_end_case1)+laneRight0X(T_start_case1:T_end_case1))/2,...
		 (laneLeft0Y(T_start_case1:T_end_case1)+laneRight0Y(T_start_case1:T_end_case1))/2, 'k-');

		
	for(i = T_start_case1:T_end_case1)
%		if(NoObsIntervention(i)==1)
%			plot(x(i), y(i), 'ro','MarkerSize', 15, 'MarkerFaceColor', 'r');
			%strtmp = sprintf('%d s', i*deltaT);
%			text(x(i)-13, y(i), 'Intervention', 'Color', 'r', 'FontSize', 14);
%		end
		
		if(driver_state(i)==1)
			plot(x(i), y(i), 'b.');
		elseif(driver_state(i)==2)
			plot(x(i), y(i), 'y.');
		else
			plot(x(i), y(i), 'r.');
		end
			
		if(frontObj(1, i)>0)
			plot(frontObj(6, i), frontObj(7, i), 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');			
		end
		
		if(mod(i, 40) == 0)
			strtmp = sprintf('%ds', floor(i*deltaT-T_shift4drawing));
			text(laneRight0X(i)+1, laneRight0Y(i), strtmp, 'FontSize', 18);
		end
	end

	text(frontObj(6, 25100)-20, frontObj(7, 25100)-3, 'Obstacle', 'Color', 'k', 'FontSize', 18);
		
	plot(x(WarningInCase1Idx), -110*ones(length(WarningInCase1Idx), 1), 'r.', 'MarkerSize', 15);
	plot(x(InterventionInCase1Idx), -120*ones(length(InterventionInCase1Idx), 1), 'r.', 'MarkerSize', 15);
	plot(x(RuleBasedCtrlInCase1Idx), -130*ones(length(RuleBasedCtrlInCase1Idx), 1), 'r.', 'MarkerSize', 15);
    
    WarningChangeInCase1Idx = find(diff(Warning(T_start_case1:T_end_case1))~=0)+T_start_case1-1;
    InterventionChangeInCase1Idx = find(diff(Intervention(T_start_case1:T_end_case1))~=0) + T_start_case1-1;
    RuleBasedCtrlChangeInCase1Idx = find(diff(control_rulebased(T_start_case1:T_end_case1))~=0) + T_start_case1-1;
    for i=1:length(WarningChangeInCase1Idx)
        line([x(WarningChangeInCase1Idx(i)), x(WarningChangeInCase1Idx(i))], [-110, y(WarningChangeInCase1Idx(i))], 'LineStyle','--');
    end
%     for i=1:length(InterventionChangeInCase1Idx)
%         line([x(InterventionChangeInCase1Idx(i)), x(InterventionChangeInCase1Idx(i))], [-120, y(InterventionChangeInCase1Idx(i))], 'LineStyle','--');
%     end
    for i=1:length(RuleBasedCtrlChangeInCase1Idx)
        line([x(RuleBasedCtrlChangeInCase1Idx(i)), x(RuleBasedCtrlChangeInCase1Idx(i))], [-130, y(RuleBasedCtrlChangeInCase1Idx(i))], 'LineStyle','--');
    end
    
	%grid on; grid minor;
%	title('Example of intervention in no obstacle scenario');

	YTickLabelString = ['  Rule-Based';'Intervention';'     Warning';'            ';'            ';
                        '            ';'            ';'            ';'            '];
	set(gca, 'YLim',[-140 0], 'FontSize', 18,...
 	   	'YTick',[-130 -120 -110 -100 -80 -60 -40 -20 0], 'YTickLabel', YTickLabelString);
    set(gca,'xtick',[]); set(gca,'xticklabel',[]);
	savepath = [savedir 'WarningAndInterventionExample.eps']; set(gcf,'PaperPositionMode','auto'); print(gcf, '-depsc2', savepath);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
%                       count number of times                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
T_start = 1; T_end = datalen;
modediffidx = find(diff(mode_sim(T_start:T_end))~=0) + T_start-1;
driverstate_diffidx = find(diff(driver_state(T_start:T_end))~=0) + T_start-1;
WarningDiffIdx = find(diff(Warning(T_start:T_end))~= 0) + T_start - 1;
InterventionDiffIdx = find(diff(Intervention(T_start:T_end))~=0) + T_start -1;
RuleBasedCtrlDiffIdx = find(diff(control_rulebased(T_start:T_end))~=0) + T_start - 1;


%% One way to count number
NoObsDrState1Count = sum((mode_sim ==1) & (driver_state==1));
NoObsDrState2Count = sum((mode_sim ==1) & (driver_state==2));
NoObsDrState3Count = sum((mode_sim ==1) & (driver_state==3));
ObsDrState1Count = sum((mode_sim ==2) & (driver_state==1));
ObsDrState2Count = sum((mode_sim ==2) & (driver_state==2));
ObsDrState3Count = sum((mode_sim ==2) & (driver_state==3));	
TotalNumber = [NoObsDrState1Count, NoObsDrState2Count, NoObsDrState3Count, ObsDrState1Count, ObsDrState2Count, ObsDrState3Count]*0.025

WarningCount = CountTimes(mode_sim, driver_state, x_to_middle_sim, d_to_frontobs_sim, Warning, 'ExcludeSafeAndUnsafe')
InterventionCount = CountTimes(mode_sim, driver_state, x_to_middle_sim, d_to_frontobs_sim, Intervention, 'ExcludeSafeAndUnsafe')
RuleBasedCtrlCount = CountTimes(mode_sim, driver_state, x_to_middle_sim, d_to_frontobs_sim, control_rulebased, 'ExcludeSafeAndUnsafe')	


%% Count number including x<1.7 and d<20	
NoObsDrState1SafeCount = sum((mode_sim ==1)   & (driver_state==1) & (abs(x_to_middle_sim)<1.7));
NoObsDrState1UnsafeCount = sum((mode_sim ==1) & (driver_state==1) & (abs(x_to_middle_sim)>1.7));
NoObsDrState2SafeCount = sum((mode_sim ==1)   & (driver_state==2) & (abs(x_to_middle_sim)<1.7));
NoObsDrState2UnsafeCount = sum((mode_sim ==1) & (driver_state==2) & (abs(x_to_middle_sim)>1.7));
NoObsDrState3SafeCount = sum((mode_sim ==1)   & (driver_state==3) & (abs(x_to_middle_sim)<1.7));
NoObsDrState3UnsafeCount = sum((mode_sim ==1) & (driver_state==3) & (abs(x_to_middle_sim)>1.7));

ObsDrState1SafeCount = sum((mode_sim ==2)   & (driver_state==1) & (d_to_frontobs_sim>20));
ObsDrState1UnsafeCount = sum((mode_sim ==2) & (driver_state==1) & (d_to_frontobs_sim<20));
ObsDrState2SafeCount = sum((mode_sim ==2)   & (driver_state==2) & (d_to_frontobs_sim>20));
ObsDrState2UnsafeCount = sum((mode_sim ==2) & (driver_state==2) & (d_to_frontobs_sim<20));
ObsDrState3SafeCount = sum((mode_sim ==2)   & (driver_state==3) & (d_to_frontobs_sim>20));
ObsDrState3UnafeCount = sum((mode_sim ==2)  & (driver_state==3) & (d_to_frontobs_sim<20));	
	
TotalNumber = [NoObsDrState1SafeCount, NoObsDrState1UnsafeCount, NoObsDrState2SafeCount, NoObsDrState2UnsafeCount,NoObsDrState3SafeCount,NoObsDrState3UnsafeCount
             ObsDrState1SafeCount, ObsDrState1UnsafeCount, ObsDrState2SafeCount,ObsDrState2UnsafeCount, ObsDrState3SafeCount, ObsDrState3UnafeCount]*0.025
		
WarningCount = CountTimes(mode_sim, driver_state, x_to_middle_sim, d_to_frontobs_sim, Warning, 'IncludeSafeAndUnsafe')
InterventionCount = CountTimes(mode_sim, driver_state, x_to_middle_sim, d_to_frontobs_sim, Intervention, 'IncludeSafeAndUnsafe')
RuleBasedCtrlCount = CountTimes(mode_sim, driver_state, x_to_middle_sim, d_to_frontobs_sim, control_rulebased, 'IncludeSafeAndUnsafe')

%% Another way to count
%Count Warning
if(0)
NoObsDrState1Count = 0;
NoObsDrState2Count = 0;
NoObsDrState3Count = 0;
ObsDrState1Count = 0;
ObsDrState2Count = 0;
ObsDrState3Count = 0;
%count 
annostart = T_start;
for(i = 1:length(WarningDiffIdx)+1)
	if (i ~= length(WarningDiffIdx)+1)
		annoend = WarningDiffIdx(i);
	else
		annoend = T_end;
	end
	if(Warning(annoend) == 2)
		if(ismember(1, mode_sim(annostart:annoend)) && ismember(1,driver_state(annostart:annoend)))
			NoObsDrState1Count = NoObsDrState1Count+1;
		end
	    if(ismember(1, mode_sim(annostart:annoend)) && ismember(2,driver_state(annostart:annoend)))
			NoObsDrState2Count = NoObsDrState2Count+1;
		end	
	    if(ismember(1, mode_sim(annostart:annoend)) && ismember(3,driver_state(annostart:annoend)))
			NoObsDrState3Count = NoObsDrState3Count+1;
		end
	    if(ismember(2, mode_sim(annostart:annoend)) && ismember(1,driver_state(annostart:annoend)))
			ObsDrState1Count = ObsDrState1Count+1;
		end	
	    if(ismember(2, mode_sim(annostart:annoend)) && ismember(2,driver_state(annostart:annoend)))
			ObsDrState2Count = ObsDrState2Count+1;
		end
	    if(ismember(2, mode_sim(annostart:annoend)) && ismember(3,driver_state(annostart:annoend)))
			ObsDrState3Count = ObsDrState3Count+1;
		end	
	end
	annostart = annoend+1;
end
WarningCount = [NoObsDrState1Count, NoObsDrState2Count, NoObsDrState3Count, ObsDrState1Count, ObsDrState2Count, ObsDrState3Count]
end
	
	

% Count Intervention
if(0)
NoObsDrState1Count = 0;
NoObsDrState2Count = 0;
NoObsDrState3Count = 0;
ObsDrState1Count = 0;
ObsDrState2Count = 0;
ObsDrState3Count = 0;

annostart = T_start;
for(i = 1:length(InterventionDiffIdx)+1)
	if (i ~= length(InterventionDiffIdx)+1)
		annoend = InterventionDiffIdx(i);
	else
		annoend = T_end;
	end
	if(Intervention(annoend) == 2)
		if(ismember(1, mode_sim(annostart:annoend)) && ismember(1,driver_state(annostart:annoend)))
			NoObsDrState1Count = NoObsDrState1Count+1;
		end
	    if(ismember(1, mode_sim(annostart:annoend)) && ismember(2,driver_state(annostart:annoend)))
			NoObsDrState2Count = NoObsDrState2Count+1;
		end	
	    if(ismember(1, mode_sim(annostart:annoend)) && ismember(3,driver_state(annostart:annoend)))
			NoObsDrState3Count = NoObsDrState3Count+1;
		end
	    if(ismember(2, mode_sim(annostart:annoend)) && ismember(1,driver_state(annostart:annoend)))
			ObsDrState1Count = ObsDrState1Count+1;
		end	
	    if(ismember(2, mode_sim(annostart:annoend)) && ismember(2,driver_state(annostart:annoend)))
			ObsDrState2Count = ObsDrState2Count+1;
		end
	    if(ismember(2, mode_sim(annostart:annoend)) && ismember(3,driver_state(annostart:annoend)))
			ObsDrState3Count = ObsDrState3Count+1;
		end	
	end
	annostart = annoend+1;
end
InterventionCount = [NoObsDrState1Count, NoObsDrState2Count, NoObsDrState3Count, ObsDrState1Count, ObsDrState2Count, ObsDrState3Count]
end


% Count RuleBasedControl
if(0)
NoObsDrState1Count = 0;
NoObsDrState2Count = 0;
NoObsDrState3Count = 0;
ObsDrState1Count = 0;
ObsDrState2Count = 0;
ObsDrState3Count = 0;

annostart = T_start;
for(i = 1:length(RuleBasedCtrlDiffIdx)+1)
	if (i ~= length(RuleBasedCtrlDiffIdx)+1)
		annoend = RuleBasedCtrlDiffIdx(i);
	else
		annoend = T_end;
	end
	if(control_rulebased(annoend) == 2)
		if(ismember(1, mode_sim(annostart:annoend)) && ismember(1,driver_state(annostart:annoend)))
			NoObsDrState1Count = NoObsDrState1Count+1;
		end
	    if(ismember(1, mode_sim(annostart:annoend)) && ismember(2,driver_state(annostart:annoend)))
			NoObsDrState2Count = NoObsDrState2Count+1;
		end	
	    if(ismember(1, mode_sim(annostart:annoend)) && ismember(3,driver_state(annostart:annoend)))
			NoObsDrState3Count = NoObsDrState3Count+1;
		end
	    if(ismember(2, mode_sim(annostart:annoend)) && ismember(1,driver_state(annostart:annoend)))
			ObsDrState1Count = ObsDrState1Count+1;
		end	
	    if(ismember(2, mode_sim(annostart:annoend)) && ismember(2,driver_state(annostart:annoend)))
			ObsDrState2Count = ObsDrState2Count+1;
		end
	    if(ismember(2, mode_sim(annostart:annoend)) && ismember(3,driver_state(annostart:annoend)))
			ObsDrState3Count = ObsDrState3Count+1;
		end	
	end
	annostart = annoend+1;
end
RuleBasedCtrlCount = [NoObsDrState1Count, NoObsDrState2Count, NoObsDrState3Count, ObsDrState1Count, ObsDrState2Count, ObsDrState3Count]
end

%UnsafeCaseCount
NoObsUnsafeCount = sum((mode_sim ==1) & (driver_state==3) & (abs(x_to_middle_sim)>1.7));
NoObsUnsafeWarningCount = sum((mode_sim ==1) & (driver_state==3) & (abs(x_to_middle_sim)>1.7) & (Warning ==2));
NoObsUnsafeInterventionCount = sum((mode_sim ==1) & (driver_state==3) & (abs(x_to_middle_sim)>1.7) & (Intervention ==2));
NoObsUnsafeRuleBasedCtrlCount = sum((mode_sim ==1) & (driver_state==3) & (abs(x_to_middle_sim)>1.7) & (control_rulebased ==2));
NoObsUnsafeAndCtrlCount = [NoObsUnsafeCount, NoObsUnsafeWarningCount, NoObsUnsafeInterventionCount, NoObsUnsafeRuleBasedCtrlCount]

ObsUnsafeCount = sum((mode_sim ==2) & (driver_state==3) & (d_to_frontobs_sim<20));
ObsUnsafeWarningCount = sum((mode_sim ==2) & (driver_state==3) & (d_to_frontobs_sim<20) & (Warning ==2));
ObsUnsafeInterventionCount = sum((mode_sim ==2) & (driver_state==3) & (d_to_frontobs_sim<20) & (Intervention ==2));
ObsUnsafeRuleBasedCtrlCount = sum((mode_sim ==2) & (driver_state==3) & (d_to_frontobs_sim<20) & (control_rulebased ==2));
ObsUnsafeAndCtrlCount = [ObsUnsafeCount, ObsUnsafeWarningCount, ObsUnsafeInterventionCount, ObsUnsafeRuleBasedCtrlCount]
	
% SafeCount
NoObsSafeCount = sum((mode_sim ==1) & (driver_state==1) & (abs(x_to_middle_sim)<1.7));
NoObsSafeWarningCount = sum((mode_sim ==1) & (driver_state==1) & (abs(x_to_middle_sim)<1.7) & (Warning ==2));
NoObsSafeInterventionCount = sum((mode_sim ==1) & (driver_state==1) & (abs(x_to_middle_sim)<1.7) & (Intervention ==2));
NoObsSafeRuleBasedCtrlCount = sum((mode_sim ==1) & (driver_state==1) & (abs(x_to_middle_sim)<1.7) & (control_rulebased ==2));
NoObsSafeAndCtrlCount = [NoObsSafeCount, NoObsSafeWarningCount, NoObsSafeInterventionCount, NoObsSafeRuleBasedCtrlCount]

ObsSafeCount = sum((mode_sim ==2) & (driver_state==1) & (d_to_frontobs_sim>20));
ObsSafeWarningCount = sum((mode_sim ==2) & (driver_state==1) & (d_to_frontobs_sim>20) & (Warning ==2));
ObsSafeInterventionCount = sum((mode_sim ==2) & (driver_state==1) & (d_to_frontobs_sim>20) & (Intervention ==2));
ObsSafeRuleBasedCtrlCount = sum((mode_sim ==2) & (driver_state==1) & (d_to_frontobs_sim>20) & (control_rulebased ==2));
ObsSafeAndCtrlCount = [ObsSafeCount, ObsSafeWarningCount, ObsSafeInterventionCount, ObsSafeRuleBasedCtrlCount]
	



%%---------------------------------------------------






