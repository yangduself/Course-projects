clc;
load 'eeg_plus_noise.mat';
M = eeg_plus_noise;
Fs = 200;

figure(1)
plot(M);

figure(2)
pwelch(M, [], [], [], Fs); %show 60hz noise

Omega_o = 60/(Fs/2);
BW = Omega_o/35;
[b, a] = iirnotch(Omega_o, BW);
figure(3)
freqz(b,a);

figure(4)
y = filter(b, a, M);
plot(y);

figure(5)
pwelch(y, [], [], [], Fs);

w1 = 1/(Fs/2);
w2 = 70/(Fs/2);

[d,c] = butter(5, [w1 w2], 'bandpass');
figure(6)
freqz(d,c)

figure(7)
y2 = filter(d, c, y);
plot(y2);

figure(8)
pwelch(y2, [], [], [], Fs);

figure(9)
[f, e] = fir1(150, [w1 w2], 'bandpass');
freqz(f, e);

figure(10)
y3 = filter(f, e, y);
plot(y3);

figure(11)
pwelch(y3, [], [], [], Fs);

f=[0,w1,w2,1];
a=[0,1,1,0];
b1=firpm(150,f,a);
figure(12)
freqz(b1,1)
Z4=filter(b1,1,Z1)
figure(13)
plot(Z4)

