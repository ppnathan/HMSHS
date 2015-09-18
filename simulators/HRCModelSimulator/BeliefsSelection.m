clear all; close all;

Beliefsfile = fopen('../../problems/HRCModel/OutFiles/samplerecords.txt','r');

numCStateVar = 4;
numDState = 4;


RawBeliefsData = fscanf(Beliefsfile, '%d %f %f %f %f %f %f %f %f %d %d', [11 inf]);
BeliefsData = RawBeliefsData(2:(numCStateVar+numDState), :)';

nData = size(BeliefsData, 1);

BeliefsData= BeliefsData - repmat(mean(BeliefsData), nData, 1);

figure;
plot(RawBeliefsData(2, :), RawBeliefsData(3, :), 'bx');
figure;
plot(RawBeliefsData(4, :), RawBeliefsData(5, :), 'bx');

for i=1:nData
    BeliefsData(i, :) = BeliefsData(i, :)/norm(BeliefsData(i, :));
end

K = 50;
opt = statset('MaxIter',1000);
[IDX, C] = kmeans(BeliefsData(:, 1:numCStateVar), K, 'Options', opt);

fclose(Beliefsfile);

for i = 1:K
    findidx{i} = find(IDX==i);
end

nSelection = 500;
selectedIdx = zeros(nSelection, 1);


clusteridx = 1;


for i=1:nSelection
    if(~isempty(findidx{clusteridx}))
        r = randi(length(findidx{clusteridx}), 1);
        selectedIdx(i) = findidx{clusteridx}(r);
        findidx{clusteridx}(r) = [];
    end
    
    if (clusteridx == K)
        clusteridx = 1;
    else
        clusteridx = clusteridx+1;
    end
end

BeliefsSelectionFile = fopen('../../problems/HRCModel/OutFiles/BeliefsSelection.txt','w');
for i = 1:nSelection
    for j = 1:(numCStateVar+numDState)
        fprintf(BeliefsSelectionFile, '%f  ', RawBeliefsData(j+1, selectedIdx(i)));
        if(j == (numCStateVar+numDState) )
            fprintf(BeliefsSelectionFile, '\n');
        end
    end
end

fclose(BeliefsSelectionFile);