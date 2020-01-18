% Proses Data Doorknock (Frame Analysis, Windowed-Frame, Ekstraksi Ciri)
[matrixFrameDoor, nDoor, fsDoor] = potongDataAudio('401-Doorknock.wav', 5);

% Potong Audio dan Ekstrak Ciri
[FeaturesDoor, windowLengthDoor] = FeatureExtraction(nDoor, fsDoor, 0.02, 0.018);

% Hitung Statistik
[statisticFeaturesDoor] = ...
    hitungStatistic(FeaturesDoor, fsDoor, windowLengthDoor, 5, 5, {'mean', 'std', 'stdbymean'});
