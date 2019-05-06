clear 
load x_hp.mat
%B coefficients of B(z)
N = 201;
Fs = 250;
fc = 65/125;
fs = 70/(250/2);
B=fir1(N,);
figure(3)
freqz(B, 1);
%FIR filtering second argument is "1"
y = filter(B, 1, x_hp);
figure(4)
subplot(2,1,1)
plot(x_hp(1:5000));
subplot(2,1,2)
plot(y(1:5000));
