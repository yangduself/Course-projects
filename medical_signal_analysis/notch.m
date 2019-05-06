clear all;
load('x_60Hz-1.mat')

Fs = 250;%sampling frequency
T = 1/Fs;%sampling interval
Omega = 0.1; %-3 dB bandwidth

omega_o = 2*pi*60*T %discrete-time notch frequency (60 Hz)
k1 = -cos(omega_o);
k2 = (1 - tan(Omega/2))/(1 + tan(Omega/3));
B = [k2 k1*(1+k2) 1];
A = [1 k1*(1+k2) k2];
%notch filter is 0.5*(1 + B/A)
B1 = (B + A)/2;
figure(1)
freqz(B1, A);
y = filter(B1, A, x_60Hz);
figure(2)
plot(x_60Hz)
figure(3)
plot(y)




