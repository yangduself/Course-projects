clear all;
clc;
%%%seizure signal
load ('chb01_03_01edfm.mat')
%%%non-seizure signal
load('val222')
x=val;
y=val22;
figure(1)
plot(x)
%seizure signal
z1=x(1,767800:780900)
figure(2)
plot(z1)
N=100;
for k = 1:40
[A sigmaw2] = arcov(z1,k);
aic1(k) = N*log(sigmaw2) + 2*k;
fpe1(k) = ((N+k)/(N-k))*sigmaw2
end
figure(3)
stem(aic1)
figure(4)
stem(fpe1)
% model order=18 for seizure signal
% model order=16 for non-seizure signal
z2=y(767800:780900)
figure(6)
plot(z2)
%nonseizure signal
for k = 1:40
[B sigmaw4] = arcov(z2,k);
aic2(k) = N*log(sigmaw4) + 2*k;
fpe2(k) = ((N+k)/(N-k))*sigmaw4
end
figure(7)
stem(aic2)
figure(8)
stem(fpe2)
[A sigmaw2] = arcov(z1,18);
[B sigmaw4] = arcov(z2,12);
a = -1.8:0.2:1.8
b = -1.2:0.2:1.2
figure(9)
scatter(A,a,'r')
hold on
scatter(B,b,'b')
figure(10)
pxx1=periodogram(z1)
plot(pxx1)
figure(11)
pxx2=periodogram(z2)
plot(pxx2)