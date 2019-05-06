%% Analyze a 1.024-second time series consisting of two pulses occurring at 0.45 and 0.55
%%sec and two sinusoids having frequencies of 100 Hz and 400 Hz. Use the STFT (spectrogram)
%%and the Continuous Wavelet Transform (scalogram). Assume a sampling
%%frequency of 1000 samples per second. Discuss in your writeup the ¡°tilings¡± of the
%%time-frequency plane that result from using the STFT and the CWT and indicate how
%%these are manifested in your experimental results. A detailed reference guide to the
%%Time Frequency Toolbox is found here.
clc;
N = 1024;
Fs = 1000;
t = 1/1000:1/1000:1024/1000;
n= N-1;

x = cos(0.1*pi*[0:n]) + cos(0.4*pi*[0:n]);
a = round((0.45/1.024)*1000);
b = round((0.55/1.024)*1000);
x(a) = x(a)+25;
x(b) = x(b)+25;
figure(1)
plot(t, x);

%%H = hilbert(x);
%%Ht = transpose(H);
figure(2)
tfrsp(transpose(x), [1:N],N,hamming(odd(256)));

figure(3)
tfrsp(transpose(x), [1:N],N,hamming(odd(16)))