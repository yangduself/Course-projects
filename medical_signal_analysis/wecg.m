clc;

load('ecg_plus_noise.mat');
s= ecg;
Fs = 360;

x = s(:,1);
y = s(:,2);
figure(1)
plot(x, y);
title('original_ecg_signal');

figure(2) %shows 60, 120, 180 hz noise
pwelch(y, [], [], [], Fs);

Omega_o = 60/(Fs/2)
BW = Omega_o/35;
[b,a] = iirnotch(Omega_o, BW);
figure(3)
freqz(b,a)
title('frequency response of notch 60hz');

y1 = filter(b,a,y);
figure(4)
plot(y1(1:21600));
title('remove 60hz')

Omega_o1 = 120/(Fs/2)
BW = Omega_o1/35;
[d, c] = iirnotch(Omega_o1, BW);
figure(5)
freqz(d, c)
title('frequency response of notch 120hz');

y2 = filter(d,c,y1);
figure(6)
plot(y2);
title('remove 120hz');

figure(7)
pwelch(y2, [], [], [], Fs);

%%%%%%  IIR BLT method Highpass filter %%%%%
Omega_o3 = 1/(Fs/2);

[e, f] = butter(3, Omega_o3, 'high');
figure(8)
freqz(e, f);
figure(9)
y3 = filter(e, f, y2);
plot(y3);

figure(10)
pwelch(y3, [], [], [], Fs);

%%%%%%% FIR windowing  highpass filter %%%%%%
Omega_o4 = 5/(Fs/2);

[g, h] = fir1(180, Omega_o4, 'high');
figure(11)
freqz(g, h);

figure(12)
y4 = filter(g, h, y3);
plot(y4);

figure(13)
pwelch(y4, [], [], [], Fs);

Omega_o5=5/(Fs/2)
N = 150;
f1=[0,0.001,Omega_o5,1];
a1=[0,0.001,0.9,1]
b1=firpm(N, f1, a1);
figure(14)
freqz(b1,1)
title('frequency response of FIRpm highpass filter')
y5=filter(b1,1,y2);  
figure(15)
plot(x,y5);



