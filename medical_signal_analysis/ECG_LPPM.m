clear 
load x_hp.mat
%B coefficients of B(z)
N = 201;
Fs = 250;
fp = 60/125; %=60/(250/2) 250/2 = analysis freq
fs = 70/125;
%F defines passband [0 fp] and stopband [fs 1]
%A is the ideal filter gain here
F = [0 fp fs 1];
A = [1  1  0  0];
B=firpm(N,F,A);
figure(2)
freqz(B, 1);
%FIR filtering second argument is "1"
y = filter(B, 1, x_hp);
figure(3)
subplot(2,1,1)
plot(x_hp(1:5000));
subplot(2,1,2)
plot(y(1:5000));
