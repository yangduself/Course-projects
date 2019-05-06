clc
clear all;
clc;
N=16;
%AR mode order estimation
n=[0:N-1];
%generate noise sequence
z=(sqrt(0.0001))*randn(1,N);
figure(1)
plot(z)
figure(2)
hold off
for K = 1:10
z=(sqrt(0.0001))*randn(1,N);
x=cos(0.4*pi*n)+cos(0.45*pi*n)+z;
pxx0=periodogram(x)
semilogy(pxx0,'r')
hold on
pxx1= pyulear(x,4)
semilogy(pxx1)
hold on
pxx2=pcov(x,4)
semilogy(pxx2,'g')
hold on
end