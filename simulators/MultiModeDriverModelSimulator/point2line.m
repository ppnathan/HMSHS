function dist = point2line(targetpt, pointsinline)

%targetpt: [x_coordinate, y_coordinate];

% pointsinline:[x1, y1;
%               x2, y2;
%               x3, y3;
%                 ...];


% Determine the line by least square:

if(sum(diff(pointsinline(:, 1))<1e-10) == size(pointsinline, 1)-1)
	if(sum(diff(pointsinline(:, 2))<1e-10) == size(pointsinline, 1)-1)
		dist = sqrt((targetpt(1) - pointsinline(1, 1))^2+ (targetpt(2) - pointsinline(1, 2))^2);
	else
		dist = abs(targetpt(1) - pointsinline(1, 1));
	end
else
	y = pointsinline(:, 2);
	x = [pointsinline(:, 1), ones(size(pointsinline, 1), 1)];

	beta = (x'*x)\(x'*y);

	dist = abs(beta(1)*targetpt(1) - targetpt(2) + beta(2))/sqrt(beta(1)*beta(1)+1);
end


end