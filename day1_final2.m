clc; close all; clear all

Fs = 8000;            % Sampling frequency (Hz)
T = 1/Fs;             % Sampling period
t = 0:T:1-T;          % 1 second duration

f1 = 440;      
f2 = 880; 

x1 = sin(2*pi*f1*t);  % First sine wave
x2 = sin(2*pi*f2*t);  % Second sine wave
x_sum = x1 + x2;      % Add the two signals

%% --- FFT of the added signal ---
N = length(x_sum);
X_sum = fft(x_sum);
f = (0:N-1)*(Fs/N);   % Frequency vector
subplot(2,2,1);
plot(t, x_sum);
xlabel('Time (s)'); ylabel('Amplitude');
title('Time Domain: Added Signal');
grid on;

subplot(2,2,2);
[S, F, T, P]=spectrogram(x_sum, 1024, 512, 1024, Fs);
waterfall(T, F, P);

% Play the mixed sound
soundsc(x_sum, Fs);
pause(2);

%% --- Concatenate the two signals ---
x_concat = [x1 x2];   % end-to-end
t_concat = 0:T:(length(x_concat)-1)*T;  % time vector for 2-second signal

N2 = length(x_concat);
X_concat = fft(x_concat);
f2_axis = (0:N2-1)*(Fs/N2);

subplot(2,2,3);
plot(t_concat, x_concat);
xlabel('Time (s)'); ylabel('Amplitude');
title('Time Domain: Concatenated Signal');
grid on;

subplot(2,2,4);
[S1, F1, T1, P1]=spectrogram(x_concat, 1024, 512, 1024, Fs);
waterfall(T1, F1, P1);