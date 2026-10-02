clc; clear; close all;

% ----- Define three signals -----
n1 = 0:9;
x1 = cos(2*pi*n1/10);     % Period = 10 samples

n2 = 0:19;
x2 = cos(2*pi*n2/20);     % Period = 20 samples

n3 = 0:29;
x3 = cos(2*pi*n3/30);     % Period = 30 samples

% ----- Addition -----
% To add, all must have same length → use 30 samples from each
x1p = [x1, zeros(1,20)];     % pad x1 to 30
x2p = [x2, zeros(1,10)];     % pad x2 to 30
x_add = x1p + x2p + x3;      % elementwise addition

% ----- Concatenation -----
x_concat = [x1 x2 x3];

% ----- FFT parameters -----
N1 = 2048;
F = (0:N1-1)/N1;    % normalized frequency

X_add = abs(fft(x_add, N1));
X_concat = abs(fft(x_concat, N1));

% ----- Plot Time Domain -----
figure('Name','Time Domain Comparison','NumberTitle','off');

subplot(2,1,1);
plot(0:length(x_add)-1, x_add, 'LineWidth', 1.2);
xlabel('n');
ylabel('Amplitude');
title('x_{add}[n] = x1 + x2 + x3');
grid on;

subplot(2,1,2);
plot(0:length(x_concat)-1, x_concat, 'LineWidth', 1.2);
xlabel('n');
ylabel('Amplitude');
title('x_{concat}[n] = [x1 x2 x3]');
grid on;

% ----- Plot Frequency Domain -----
figure('Name','Frequency Domain Comparison','NumberTitle','off');

subplot(2,1,1);
plot(F(1:N1/2), X_add(1:N1/2), 'LineWidth', 1.2);
xlabel('Normalized Frequency');
ylabel('|X_{add}(f)|');
title('Spectrum of Added Signal');
grid on;

subplot(2,1,2);
plot(F(1:N1/2), X_concat(1:N1/2), 'LineWidth', 1.2);
xlabel('Normalized Frequency');
ylabel('|X_{concat}(f)|');
title('Spectrum of Concatenated Signal');
grid on;
