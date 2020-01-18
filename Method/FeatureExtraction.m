% Feature Extraction

function [Features, windowLength] = FeatureExtraction(sample, fs, win, overlap)

windowLength = round(win * fs);
overlap = round(overlap * fs);

curPos = 1;
L = length(sample);


numOfFrames = floor((L-windowLength)/overlap) + 1;

numOfFeatures = 7;
Features = zeros(numOfFrames, numOfFeatures);
Ham = window(@hamming, windowLength);

for i=1:numOfFrames
    
    frame  = sample(curPos:curPos+windowLength-1);
     % Filter
    alpha = 0.98;
    frame = filter( [1 -alpha], 1, frame);
    
    % Windowing
    frame  = frame .* Ham;
    
    frameFFT = getDFT(frame, fs);
    frameFFTPrev = frameFFT;
    
        if (sum(abs(frame))>eps)
            % hitung Time-Domain Features:
            Features(i,1) = feature_energy(frame);
            Features(i,2) = feature_energy_entropy(frame, 10);
            Features(i,3) = feature_zcr(frame);

            % hitung Frequency-Domain Features: 
            if (i==1) 
                frameFFTPrev = frameFFT; 
            end
            [Features(i,4),Features(i,5)] = feature_spectral_centroid(frameFFT, fs);
            Features(i,6) = feature_spectral_flux(frameFFT, frameFFTPrev);
            Features(i,7) = feature_spectral_rolloff(frameFFT, 0.90);    
        else
            Features(i,:) = zeros(1, numOfFeatures);
        end
    curPos = curPos + overlap;
    frameFFTPrev = frameFFT;
end