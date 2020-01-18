% Hitung Statistic

function [statisticFeatures] = ...
    hitungStatistic(Features, fs, windowLength, Win, ovr, listOfStatistics)

[numOfWindowFrames, numOfFeatures] = size(Features);

window = Win * fs;
windowFrame = (window/windowLength); 

windowOverlap = ovr * fs;
overlap = (windowOverlap/windowLength); 

curPos = 1;

% compute the total number of mid-term frames:
numOfMidFrames = ceil((numOfWindowFrames) / overlap);


statisticFeatures = zeros(numOfMidFrames, numOfFeatures * length(listOfStatistics));
if (nargout==2)
    shortFeaturesCell = cell(numOfMidFrames, 1);
end


for i=1:numOfMidFrames 
    % get current frame:
    N1 = curPos; 
    N2 = curPos+windowFrame-1; 
    if (N2>size(Features,1)) 
        N2 = size(Features,1); 
    end
    
    CurStFeatures  = Features(N1:N2, :);
    if (nargout==1)
        shortFeaturesCell{i} = CurStFeatures;
    end
    for j=1:length(listOfStatistics) 
        statisticFeatures(i, (j-1)*numOfFeatures + 1: j*numOfFeatures) = ...
            computeStatistic(CurStFeatures, listOfStatistics{j});
    end
    curPos = curPos + overlap; 
end
    
 