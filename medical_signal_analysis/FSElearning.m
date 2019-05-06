clc;
Fs = 256;
load('chb01_03_edfm_none_seizure.mat');
a = val(1, :);
b = val(3, :);
c = val(12,:);
figure(1)
pwelch(a,hamming(512),40,[],Fs)
figure(2)
pwelch(b,hamming(512),40,[],Fs)
figure(3)
pwelch(c,hamming(512),40,[],Fs)

load('chb01_03_edfm_seizure.mat');
d = val(1, :);
e = val(3, :);
f = val(12,:);

figure(4)
pwelch(d,hamming(512),40,[],Fs)
figure(5)
pwelch(e,hamming(512),40,[],Fs)
figure(6)
pwelch(f,hamming(512),40,[],Fs)

