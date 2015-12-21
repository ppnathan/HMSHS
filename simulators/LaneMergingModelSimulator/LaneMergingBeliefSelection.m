clear all; close all;

Beliefsfile = fopen('../../problems/LaneMergingModel/OutFiles/samplerecords.txt','r');
RawBeliefsData = fscanf(Beliefsfile, ...
    '%d %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %d %d', [19 inf]);
fclose(Beliefsfile);

BeliefsData = RawBeliefsData([2 4], :)';

nData = size(BeliefsData, 1);

BeliefsData = BeliefsData - repmat(mean(BeliefsData), nData, 1);

% for i=1:nData
%     BeliefsData(i, :) = BeliefsData(i, :)/norm(BeliefsData(i, :));
% end

K = 30;
opts = statset('MaxIter',1000);
[IDX, C] = kmeans(BeliefsData, K, 'Options',opts);


for i = 1:K
    findidx{i} = find(IDX == i);
end

nSelection = 50000;
selectedIdx = zeros(nSelection, 1);


clusteridx = 1;
i = 1;

while( i<=nSelection)
    if(~isempty(findidx{clusteridx}))
        r = randi(length(findidx{clusteridx}), 1);
        selectedIdx(i) = findidx{clusteridx}(r);
        findidx{clusteridx}(r) = [];
        i = i+1;
    end
    
    if (clusteridx == K)
        clusteridx = 1;
    else
        clusteridx = clusteridx+1;
    end
end

figure;
plot(RawBeliefsData(2, selectedIdx(1:10000)), RawBeliefsData(4, selectedIdx(1:10000)), '.');

count = 0;
BeliefsSelectionFile = fopen('../../problems/LaneMergingModel/OutFiles/BeliefsSelection.txt', 'w');
for i = 1:nSelection
    fprintf(BeliefsSelectionFile, ...
    '%f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f  %f\n', ...
        RawBeliefsData(2, selectedIdx(i)), RawBeliefsData(3, selectedIdx(i)), ...
        RawBeliefsData(4, selectedIdx(i)), RawBeliefsData(5, selectedIdx(i)), ...
        RawBeliefsData(6, selectedIdx(i)), RawBeliefsData(7, selectedIdx(i)), ...
        RawBeliefsData(8, selectedIdx(i)), RawBeliefsData(9, selectedIdx(i)), ...
        RawBeliefsData(10, selectedIdx(i)), RawBeliefsData(11, selectedIdx(i)), ...
        RawBeliefsData(12, selectedIdx(i)), RawBeliefsData(13, selectedIdx(i)), ...
        RawBeliefsData(14, selectedIdx(i)), RawBeliefsData(15, selectedIdx(i)), ...
        RawBeliefsData(16, selectedIdx(i)), RawBeliefsData(17, selectedIdx(i)));
%     if (max(RawBeliefsData(2, selectedIdx(i)), RawBeliefsData(4, selectedIdx(i))) > 0 )
%         if (abs(RawBeliefsData(2, selectedIdx(i)) - RawBeliefsData(4, selectedIdx(i))) < 15)
%             i
%             RawBeliefsData(:, selectedIdx(i))
%             count = count +1;
%         end
%     end
end

fclose(BeliefsSelectionFile);

closePositionIdx = find(abs(RawBeliefsData(2, selectedIdx) - RawBeliefsData(4, selectedIdx))< 10 & ...
    RawBeliefsData(2, selectedIdx) > -30);
% RawBeliefsData(2:5, selectedIdx(1))
% for i = 1:nSelection
%     if norm(RawBeliefsData(2:5, selectedIdx(i)) - RawBeliefsData(2:5, selectedIdx(1))) < 6
%         i
%         RawBeliefsData(2:5, selectedIdx(i))
%     end
% end