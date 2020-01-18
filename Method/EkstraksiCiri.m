function Features = EkstraksiCiri(Fs, frameW, overlap, numFrames)

curPos = 1;

% jumlah features yang akan dihitung
numOfFeatures = 6;
Features = zeros(numOfFeatures, numFrames);

for i=1:numFrames
    % memanggil frame yang tersimpan
    frameFFT = getDFT(frameW, Fs);
    
    if (sum(abs(frameW))>eps)
        % hitung Time-Domain Features:
        Features(1,i) = feature_energy(frameW);
        Features(2,i) = feature_energy_entropy(frameW, 10);
        Features(3,i) = feature_zcr(frameW);

        % hitung Frequency-Domain Features: 
        if (i==1) 
            frameFFTPrev = frameFFT; 
        end
        Features(4,i) = feature_spectral_centroid(frameFFT, Fs);
        Features(5,i) = feature_spectral_flux(frameFFT, frameFFTPrev);
        Features(6,i) = feature_spectral_rolloff(frameFFT, 0.90);
        
    else
        Features(:,i) = zeros(numOfFeatures, 1);
    end    
    curPos = curPos + overlap;
    frameFFTPrev = frameFFT;
end
