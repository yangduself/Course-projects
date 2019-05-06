%Write a paragraph or two describing the origin of the phonocardiogram signal, its
%various components (including frequencies present), and its importance in diagnosing
%cardiac disease. Please state your source(s) of information. Next, download the following
%phonocardiogram WAV audio file. Plot the time domain signal (label the time
%axis), then analyze the signal using the Welch averaged periodogram and the spectrogram.
%Compare these and based on your analysis predict the type of cardiac pathology
%present in the phonocardiogram. Additional information on the phonocardiogram can
%be found here. The WAV file has been sampled at 44,100 samples per second. The
%left channel contains ECG data, the right channel contains the phonocardiogram data.
%Use the Matlab function ¡°wavread¡± to import the file into Matlab. You will need to
%rename the phonocardiogram file so that it has a ¡°.wav¡± extension (¡°phono1.wav¡±).
clc;
audioread('phono1');
ECG = ans(:, 1);
PCG = ans(:, 2);
L = length(ECG);
Fs = 44100;
t = [1:L]/Fs;
figure(1)
plot(t, ECG);
figure(2)
plot(t, PCG)

figure(3)
pwelch(PCG,[], [], [], Fs);
figure(4)
PCG2 = decimate(PCG, 8);
pwelch(PCG2,[], [], [], Fs);
figure(5)
tfrsp(PCG(1:2^13));

figure(6)
tfrsp(PCG2(1:2^13));







