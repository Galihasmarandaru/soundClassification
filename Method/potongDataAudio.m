function [matrinAudioFrame, n, fs] =  potongDataAudio(wavFile, timeAudio)

% Features, Statistic, 


[n,fs] = audioread(wavFile);

windowFrame = round(timeAudio * fs); % 80.000
curPos = 1;
L = length(n); % 3.200.000

numFrames = floor((L-windowFrame)/windowFrame) + 1; % 40

matrinAudioFrame = zeros(windowFrame,numFrames); % 80.000 n 40

for i=1:numFrames % 40
    
    frame  = n(curPos:curPos+windowFrame-1);

    for j=1:windowFrame % 80.000
        matrinAudioFrame(j,i) = frame(j);
    end
    
    curPos = curPos + windowFrame;  
end