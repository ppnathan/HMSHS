clear all; close all;

Beliefsfile = fopen('../../problems/SimpleModel/OutFiles/samplerecords.txt','r');

RawBeliefsData = fscanf(Beliefsfile, '%d %f %f %f %d %d', [6 inf]);
BeliefsData = RawBeliefsData(2:3, :)';

nData = size(BeliefsData, 1);

BeliefsData= BeliefsData - repmat(mean(BeliefsData), nData, 1);

% for i=1:nData
%     BeliefsData(i, :) = BeliefsData(i, :)/norm(BeliefsData(i, :));
% end

K = 10;
opts = statset('MaxIter',1000);
[IDX, C] = kmeans(BeliefsData(:, 1), K, 'Options',opts);

fclose(Beliefsfile);

for i = 1:K
    findidx{i} = find(IDX==i);
end

nSelection = 10000;
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


% for i=1:nSelection
%     if(~isempty(findidx{clusteridx}))
%         r = randi(length(findidx{clusteridx}), 1);
%         selectedIdx(i) = findidx{clusteridx}(r);
%         findidx{clusteridx}(r) = [];
%     end
%     
%     if (clusteridx == 10)
%         clusteridx = 1;
%     else
%         clusteridx = clusteridx+1;
%     end
% end

BeliefsSelectionFile = fopen('../../problems/SimpleModel/OutFiles/BeliefsSelection.txt','w');
for i = 1:nSelection
    fprintf(BeliefsSelectionFile, '%f  %f  %f\n', RawBeliefsData(2, selectedIdx(i)), RawBeliefsData(3, selectedIdx(i)), RawBeliefsData(4, selectedIdx(i)));
end
% 
% for i = 1:nSelection
%     fprintf(BeliefsSelectionFile, '%f  %f  %f\n', RawBeliefsData(2, i), RawBeliefsData(3, i), RawBeliefsData(4, i));
% end

fclose(BeliefsSelectionFile);