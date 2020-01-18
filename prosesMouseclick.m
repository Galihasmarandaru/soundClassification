% Proses Data Mouseclick (Frame Analysis, Windowed-Frame, Ekstraksi Ciri)
[matrixFrameMouse, nMouse, fsMouse] = potongDataAudio('402-Mouseclick.wav', 5);

% Potong Audio dan Ekstrak Ciri
[FeaturesMouse, windowLengthMouse] = FeatureExtraction(nMouse, fsMouse, 0.02, 0.018);

% Hitung Statistik
[statisticFeaturesMouse] = ...
    hitungStatistic(FeaturesMouse, fsMouse, windowLengthMouse, 5, 5, {'mean', 'std', 'stdbymean'});