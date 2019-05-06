clear all;
clc;
load('eeg_plus_noise.mat');
Z=eeg_plus_noise;
Fs=200;%sample frequency= 200
 
%%%%%%% plot original eeg signal %%%%%%%
figure(1)
plot(Z)
 
%%%%% caculate the power spectral density estimation(PSD) %%%%
figure(2)
pwelch(Z,[],[],[],Fs)
 
%%%%%%%%%%%% notch filter (60Hz)  %%%%%%%%%%%%%%%%%
 
Omega_o = 60/(Fs/2)
BW = Omega_o/30;
[b,a] = iirnotch(Omega_o,BW);
figure(3)
freqz(b,a)
title('frequency response of 60Hz notch filter')
 
%%%%%% plot the signal after notch filter %%%%%%
 
 
Z1=filter(b,a,Z)
figure(4)
plot(Z1)
figure(13)
pwelch(Z1,[],[],Fs)
%%%%%%% IIR BLT bandpass filter %%%%%%%
w1=0.5/(Fs/2)
w2=60/(Fs/2)
 
wn = [w1,w2]
[B A]=butter(5,wn,'bandpass')
figure(5)
freqz(B,A)
Z2=filter(B,A,Z1)
figure(6)
plot(Z2)
title('denoise ecg signal by IIR method')
 
%%%%%% calculate the PSD after IIR BLT method %%%%%%
figure(7)
pwelch(Z2,[],[],[],Fs)
 
%%%%% FIR windowing  bandpass filter %%%%%%%%
figure(8)
[B1 A1]=fir1(150,wn,'bandpass')
freqz(B1,A1)
Z3=filter(B1,A1,Z1)
figure(9)
plot(Z3)
title('denoise ecg signal by FIR windowing method')
 
%%%%%% calculate the PSD after FIR windowing %%%%%%
figure(10)
pwelch(Z3,[],[],[],Fs)
 
%%%%%% FIR Parks-McClelland  bandpass filter %%%%%%%
f=[0,w1,w2,1];
a=[0,1,1,0];
b1=firpm(50,f,a);
figure(11)
freqz(b1,1)
Z4=filter(b1,1,Z1)
figure(12)
plot(Z4)
