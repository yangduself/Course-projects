clear all;
load('ecg_plus_noise (1).mat');
 
M=ecg;
Fs=360;%sample frequency=360
%%%%%%plot original ecg signal%%%
t=M(:,1); %column 1
y=M(:,2); %column 2 power of the ecg signal with noise
figure(1)
plot(t,y)
title('original ecg signal')
 
%%%%%%caculate the power spectral density (PSD) estimation%%%%
figure(2)
pwelch(y,[],[],[],Fs)  
 
%%%%% notch filter eliminate 60Hz noise %%%%%
Omega_o = 60/(Fs/2)
BW = Omega_o/30;
[b,a] = iirnotch(Omega_o,BW);
figure(3)
freqz(b,a)
title('frequency response of 60Hz notch filter')
 
%%%%%% plot signal after notch filter %%%%
figure(4)
y1 = filter(b,a,y)
 
%%%%%% notch filter eliminate 120Hz noise %%%%%
Omega_o2 = 120/(Fs/2)
BW2 = Omega_o2/30;
[d,c] = iirnotch(Omega_o2,BW2);
figure(4)
freqz(d,c)
title('frequency response for 120Hz notch filter')
 
%%%%% plot ecg signal after eliminate 120Hz noise %%%%%
y2 = filter(d,c,y1)
 
%%%%%%  IIR BLT method Highpass filter %%%%%
Omega_o=5/(Fs/2)
[B A]=butter(5,Omega_o,'high')
figure(5)
freqz(B,A)
y3=filter(B,A,y2)
figure(6)
plot(t,y3)
title('after notch filtering ecg signal by IIR notch method')
%%%%%%% REcalculate the PSD of the signal %%%%%%%
figure(7)
pwelch(y3,[],[],[],Fs)
 
%%%%%%% FIR windowing  highpass filter %%%%%%
Omega_o=1/(Fs/2)
[B1 A1]=fir1(150,Omega_o,'high')
figure(8)
freqz(B1,A1)
%%%%%%%% plot FIR1 highpass filter %%%%%%%
y4=filter(B1,A1,y2)
figure(9)
plot(t,y4)
%%%%%%% RE-REcalculate the PSD after FIR windowing %%%%%%%
figure(10)
pwelch(y4,[],[],[],Fs)
 
%%%%%%% fir notch filter design%%%%%%%
Omega_o=5/(Fs/2)
figure(11)
f1=[0,0.001,Omega_o,1];
a1=[0,0.001,0.9,1]
b1=firpm(150,f1,a1);
freqz(b1,1)
title('frequency response of FIRpm highpass filter')
y5=filter(b1,1,y2)  
figure(12)
plot(t,y5)
