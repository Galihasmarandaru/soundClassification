% Proses Data Keyboardtyping (Frame Analysis, Windowed-Frame, Ekstraksi Ciri)
[matrixFrameKeyboard, nKeyboard, fsKeyboard] = potongDataAudio('403-Keyboardtyping.wav', 5);

% Potong Audio dan Ekstrak Ciri
[FeaturesKeyboard, windowLengthKeyboard] = FeatureExtraction(nKeyboard, fsKeyboard, 0.02, 0.018);

% Hitung Statistik
[statisticFeaturesKeyboard] = ...
    hitungStatistic(FeaturesKeyboard, fsKeyboard, windowLengthKeyboard, 5, 5, {'mean', 'std', 'stdbymean'});