clear all;
load('chb01_03_edfm_seizure.mat');
z=val;
Fs=256;
x0=z(1, :);
figure(1)
pwelch(x0,boxcar(512),40,[],Fs)
figure(2)
pwelch(x0,hamming(512),40,[],Fs)
figure(3)
pwelch(x0,hanning(512),40,[],Fs)
figure(4)
pwelch(x0,bartlett(512),40,[],Fs)