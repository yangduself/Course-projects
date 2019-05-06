clc;
Fs = 256;
load('chb01_03_edfm (2)_new.mat');
a = val(1000:4000);
b = val(8000:11360);

figure(1)
pwelch(a)
figure(2)
pwelch(b)

figure(3)
pwelch(a,hanning(128),[], Fs)
figure(4)
pwelch(b, hanning(128), [], Fs)

figure(5)
Pxxa = periodogram(a)
semilogy(Pxxa)
figure(6)
Pxxb = periodogram(b)
semilogy(Pxxb)
