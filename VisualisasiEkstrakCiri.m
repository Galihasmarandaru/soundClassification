% Visualisasi Ekstraksi Ciri

% Load data
load('door.mat'); 
load('mouse.mat');
load('keyboard.mat');

% AUDIO-DATA
    figure;
    hold on
    % Signal Awal
    subplot(2,2, [1 2]);
    plot(matrixFrameDoor(:,1));
    title('Signal Awal (t = 5 s)')
    xlabel('Sample')
    ylabel('Frekuensi')
    % Time-Domain Features
    subplot(2,2,3);
    plot(FeaturesDoor(:,1:3));
    title('Time-Domain Features')
    xlabel('Jumlah Frame')
    ylabel('Feature')
    % Frequency-Domain Features
    subplot(2,2,4);
    plot(FeaturesDoor(:,4:7));
    title('Frequency-Domain Features')
    xlabel('Jumlah Frame')
    ylabel('Feature')
% % STATISTIK-FEATURES
% % % 1. Buat Label
L1=ones(45,1);
L2=(ones(45,1)*2);
L3=(ones(45,1)*3);
% % 2. Gabung Feature Statistik S, Gabung Label L
dataThings=[statisticFeaturesDoor; statisticFeaturesMouse; statisticFeaturesKeyboard];
labelThings=[L1; L2; L3];

% Parallel Coordinate Plot
        jenis=ismember(labelThings,[1 2 3]);
        jenis2=ismember(labelThings,[1 2 3]);
        figure;
        hold on;
        parallelcoords(dataThings(jenis,:), 'group', labelThings(jenis), 'standardize', 'on', 'quantile', .25);
        title('Parallel Coordinate Plot')
% Andrew's Plot
        figure;
        hold on;
        andrewsplot(dataThings(jenis,:), 'group', labelThings(jenis), 'standardize', 'on')
        title('Andrew is Plot')
% Glyph Plot
        A=statisticFeaturesDoor(1:3,:);
        B=statisticFeaturesMouse(1:3,:);
        C=statisticFeaturesKeyboard(1:3,:);
        Sampel=[A;B;C];
        label={'doorknock','doorknock','doorknock','mouseclick','mouseclick','mouseclick','keyboard','keyboard','keyboard'};
        figure, h = glyphplot(Sampel, 'glyph','star','obslabels',label);
        hold on;
        set(h(:,3),'FontSize',8);
        title('Glyph Plot')