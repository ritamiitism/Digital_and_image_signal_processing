load handel.mat
filename = 'handel.wav';
audiowrite(filename,y,Fs);
clear y Fs
[y,Fs] = audioread('handel.wav');
soundsc(y,Fs);
load handel.mat

filename = 'handel.flac';
audiowrite(filename,y,Fs);
samples = [1,2*Fs];
clear y Fs
[y,Fs] = audioread(filename,samples);
sound(y,Fs);
[S, F, T, P] = spectrogram(y, 1024, 512, 1024, Fs);
figure;
waterfall(T, F, P);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
zlabel('Power (dB)');
title('3D Waterfall Spectrogram of Handel');
colormap jet;
grid on;
view(45, 30);