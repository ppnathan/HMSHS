clear all; close all;

load('processeddata.mat');


%policyfile_noobs = fopen('../../problems/NoObsDrivingModel/OutFiles/policyfile.txt','r');
%policyfile_obs = fopen('../../problems/ObsDrivingModel/OutFiles/policyfile.txt','r');

policyfile_noobs = fopen('policyfile_noobs.txt','r');
policyfile_obs = fopen('policyfile_obs.txt','r');

nAlphas_noobs = fscanf(policyfile_noobs, '%d', [1 1]);
num_qq_noobs = 4;
num_zq_noobs = 3;
num_cstate_noobs = 1;
num_coeff_noobs = 3;

nAlphas_obs = fscanf(policyfile_obs, '%d', [1 1]);
num_qq_obs = 8;
num_zq_obs = 3;
num_cstate_obs = 2;
num_coeff_obs = 6;

Sigma_noobs = zeros(nAlphas_noobs, 1);
Localx_noobs = zeros([nAlphas_noobs num_cstate_noobs]);
Beta_noobs = zeros([num_qq_noobs num_coeff_noobs nAlphas_noobs]);

Sigma_obs = zeros(nAlphas_obs, 1);
Localx_obs = zeros([nAlphas_obs num_cstate_obs]);
Beta_obs = zeros([num_qq_obs num_coeff_obs nAlphas_obs]);

for i=1:nAlphas_noobs
    Sigma_noobs(i) = fscanf(policyfile_noobs, '%d', [1 1])+1;
    Localx_noobs(i, :) = fscanf(policyfile_noobs, '%f', num_cstate_noobs);
    Betatmp_noobs = fscanf(policyfile_noobs, '%f', [num_coeff_noobs num_qq_noobs]);
    Beta_noobs(:, :, i) = Betatmp_noobs';
end
	
for i=1:nAlphas_obs
    Sigma_obs(i) = fscanf(policyfile_obs, '%d', [1 1])+1;
    Localx_obs(i, :) = fscanf(policyfile_obs, '%f', num_cstate_obs);
    Betatmp_obs = fscanf(policyfile_obs, '%f', [num_coeff_obs num_qq_obs]);
    Beta_obs(:, :, i) = Betatmp_obs';
end


fclose(policyfile_noobs);
fclose(policyfile_obs);

thresholddist_noobs = 1;
thresholddist_obs = 1;

IsInLeftLaneNoObstacle = IsInLeftLane & (frontObj(1, :)==0)';
IsInRightLaneNoObstacle = IsInRightLane & (frontObj(1, :)==0)';
InLeftLaneNoObstacle_idx = find(IsInLeftLaneNoObstacle);
InRightLaneNoObstacle_idx = find(IsInRightLaneNoObstacle);

isfrontLeftObj = (frontObj(8, :)==1);
isfrontRightObj= (frontObj(8, :)==2);

isfrontLeftObj_idx = find(isfrontLeftObj);
isfrontRightObj_idx = find(isfrontRightObj);

%%
SameLaneWithObj = (isfrontLeftObj & IsInLeftLane') | (isfrontRightObj & IsInRightLane');
DiffLaneWithObj = (isfrontLeftObj & IsInRightLane') | (isfrontRightObj & IsInLeftLane');

SameLaneWithObj_idx = find(SameLaneWithObj);
DiffLaneWithObj_idx = find(DiffLaneWithObj);

datalen = length(x);
control = zeros(datalen, 1);
control_rulebased = zeros(datalen, 1);
x_to_middle = zeros(datalen, 1);
d_to_frontobs = zeros(datalen, 1);
zq = ones(datalen, 1);
b_q_noobs = zeros(1, num_qq_noobs); 
b_q_noobs = repmat(b_q_noobs, datalen, 1);
b_q_obs = zeros(1, num_qq_obs); 
b_q_obs = repmat(b_q_obs, datalen, 1);

MatlabSimfile_Discrete = fopen('./OutFiles/MatlabSimfile_Discrete.txt', 'w');
	
	
for i = 1:datalen
	i
	[dist2middleline, idx_tmp] = pdist2(MiddleLine', [x(i), y(i)], 'euclidean', 'Smallest',1); %'
	if(IsInLeftLane(i))
		[x_to_middle(i), idx_tmp] = pdist2(LeftLaneMiddle', [x(i), y(i)], 'euclidean', 'Smallest',1); %'
	else
       	[x_to_middle(i), idx_tmp] = pdist2(RightLaneMiddle', [x(i), y(i)], 'euclidean', 'Smallest',1); %'
	end	
	if(dist2middleline>1.8)
		x_to_middle(i) = -x_to_middle(i);
	end	

	if(0)
	if((i>1) && (i < (datalen-1)))
		if(IsInLeftLane(i))
			lanemiddleX = 0.75*laneLeft0X(i-1:i+1) + 0.25*laneRight0X(i-1:i+1);
			lanemiddleY = 0.75*laneLeft0Y(i-1:i+1) + 0.25*laneRight0Y(i-1:i+1);
		else
        	lanemiddleX = 0.25*laneLeft0X(i-1:i+1) + 0.75*laneRight0X(i-1:i+1);
        	lanemiddleY = 0.25*laneLeft0Y(i-1:i+1) + 0.75*laneRight0Y(i-1:i+1);
		end
			
		MiddleLineX = (laneLeft0X(i-1:i+1)+laneRight0X(i-1:i+1))/2;
		MiddleLineY = (laneLeft0Y(i-1:i+1)+laneRight0Y(i-1:i+1))/2;
		%dist2middleline = point2line([x(i), y(i)], [MiddleLineX', MiddleLineY']);
		[dist2middleline, idx_tmp] = pdist2(MiddleLine', [x(i), y(i)], 'euclidean', 'Smallest',1); %'
		if(dist2middleline<1.8)
			x_to_middle(i) = point2line([x(i), y(i)], [lanemiddleX', lanemiddleY']);
		else
			x_to_middle(i) = -point2line([x(i), y(i)], [lanemiddleX', lanemiddleY']);
		end
		
	else
		if(IsInLeftLane(i))
			lanemiddleX = 0.75*laneLeft0X(i) + 0.25*laneRight0X(i);
			lanemiddleY = 0.75*laneLeft0Y(i) + 0.25*laneRight0Y(i);
		else
        	lanemiddleX = 0.25*laneLeft0X(i) + 0.75*laneRight0X(i);
        	lanemiddleY = 0.25*laneLeft0Y(i) + 0.75*laneRight0Y(i);
		end	
		MiddleLineX = (laneLeft0X(i)+laneRight0X(i))/2;
		MiddleLineY = (laneLeft0Y(i)+laneRight0Y(i))/2;
		dist2middleline = sqrt((x(i) - MiddleLineX)^2 + (y(i)-MiddleLineY)^2);	
		if(dist2middleline<1.8)
			x_to_middle(i) = sqrt((x(i) - lanemiddleX)^2 + (y(i)-lanemiddleY)^2);
		else
			x_to_middle(i) = -sqrt((x(i) - lanemiddleX)^2 + (y(i)-lanemiddleY)^2);
		end
	end
	end
	%TwoLaneWidth = sqrt((laneLeft0X(i) - laneRight0X(i))^2+ (laneLeft0Y(i) - laneRight0Y(i))^2);
	
	if(SameLaneWithObj(i) ~= 1)
		
%		[dist2middleline, idx_tmp] = pdist2(MiddleLine', [x(i), y(i)], 'euclidean', 'Smallest',1); %'		
%		dist2middleline = sqrt((x(i) - MiddleLineX)^2 + (y(i)-MiddleLineY)^2);		
%		if(dist2middleline<1.8)
%			x_to_middle(i) = sqrt((x(i) - lanemiddleX)^2 + (y(i)-lanemiddleY)^2);
%		else
%			x_to_middle(i) = -sqrt((x(i) - lanemiddleX)^2 + (y(i)-lanemiddleY)^2);
%		end
		
		zq = driver_state(i);
		
		ctrl = 1;
		
		if(i==1)
			b_q_noobs(1, 1) = 1;
			control(1) = 1;
			control_rulebased(i) = 1;
		else
		
			if(SameLaneWithObj(i-1) ~=1)
				b_q_noobs(i, :) = CalBelief_noobs(x_to_middle(i), x_to_middle(i-1), zq, ctrl, b_q_noobs(i-1, :));
			else
				b_q_noobs(i, 1) = b_q_obs(i-1, 1)+b_q_obs(i-1, 2)+b_q_obs(i-1, 3)+b_q_obs(i-1, 4);
				b_q_noobs(i, 3) = b_q_obs(i-1, 5)+b_q_obs(i-1, 6)+b_q_obs(i-1, 7)+b_q_obs(i-1, 8);%<---may be something wrong, should be b_q_noobs(i, 5)?
			end
			control(i) = calpolicy_noobs(x_to_middle(i), b_q_noobs(i, :), nAlphas_noobs, Sigma_noobs, Localx_noobs, Beta_noobs, thresholddist_noobs);
			control_rulebased(i) = RuleBasedPolicy_noobs(x_to_middle(i), 1.7);
		end
	    
		str = sprintf('mode = %d, x = %f, bq = (%f, %f, %f, %f), zq = %d, sigma = %d', 1, x_to_middle(i), b_q_noobs(i, 1), b_q_noobs(i, 2),...
			 b_q_noobs(i, 3), b_q_noobs(i, 4), zq, control(i));
	    disp(str);
	    fprintf(MatlabSimfile_Discrete, '%d  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %d  %d  %d\n', 1, x_to_middle(i), d_to_frontobs(i),...
			 b_q_noobs(i, 1), b_q_noobs(i, 2), b_q_noobs(i, 3), b_q_noobs(i, 4), 0, 0, 0, 0, zq, control(i), control_rulebased(i));
		
		
	else

%		[dist2middleline, idx_tmp] = pdist2(MiddleLine', [x(i), y(i)], 'euclidean', 'Smallest',1); % '
%		dist2middleline = sqrt((x(i) - MiddleLineX)^2 + (y(i)-MiddleLineY)^2);	
%		if(dist2middleline<(0.25*TwoLaneWidth))
%			x_to_middle(i) = sqrt((x(i) - lanemiddleX)^2 + (y(i)-lanemiddleY)^2);
%		else
%			x_to_middle(i) = -sqrt((x(i) - lanemiddleX)^2 + (y(i)-lanemiddleY)^2);
%		end

		d_to_frontobs(i) = frontObj(2, i);
		zq = driver_state(i);
		
		ctrl = 1;
		
		if(i ==1)
			b_q_obs(1, 1) = 1;
			control(1) = 1;
			control_rulebased(i) = 1;
		else
		
			if(SameLaneWithObj(i-1) ==1)
				b_q_obs(i, :) = CalBelief_obs([x_to_middle(i), d_to_frontobs(i, :)], [x_to_middle(i-1), d_to_frontobs(i-1, :)], zq, ctrl, b_q_obs(i-1, :));
			else
				b_q_obs(i, 1) = b_q_noobs(i-1, 1)+b_q_noobs(i-1, 2);
				b_q_obs(i, 5) = b_q_noobs(i-1, 3)+b_q_noobs(i-1, 4);
			end

			control(i) = calpolicy_obs([x_to_middle(i), d_to_frontobs(i)], b_q_obs(i, :), nAlphas_obs, Sigma_obs, Localx_obs, Beta_obs, thresholddist_obs);
			control_rulebased(i) = RuleBasedPolicy_obs([x_to_middle(i), d_to_frontobs(i)], 20);
		end
			
	    str = sprintf('mode = %d, x = (%f, %f), bq = (%f, %f, %f, %f, %f, %f, %f, %f), zq = %d, sigma = %d', ...
						2, x_to_middle(i), d_to_frontobs(i), b_q_obs(i, 1), b_q_obs(i, 2), b_q_obs(i, 3), b_q_obs(i, 4), b_q_obs(i, 5),...
							 b_q_obs(i, 6), b_q_obs(i, 7), b_q_obs(i, 8), zq, control(i));
	    disp(str);
	    fprintf(MatlabSimfile_Discrete, '%d  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %d  %d  %d\n', 2, x_to_middle(i), d_to_frontobs(i),...
			 b_q_obs(i, 1), b_q_obs(i, 2), b_q_obs(i, 3), b_q_obs(i, 4),  b_q_obs(i, 5), b_q_obs(i, 6), b_q_obs(i, 7), b_q_obs(i, 8),...
				  zq, control(i), control_rulebased(i));
    
	end	

end




