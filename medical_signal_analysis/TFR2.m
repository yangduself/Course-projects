%%Generate a linear chirp signal of lengthN= 1024 that passes through (n= 1, f= 0.05)and (n= 1000, f= 0.45), wherefcorresponds to normalized frequency (0.5 representshalf the sampling frequency).  Compare and contrast the spectrogram and the Wignerdistribution in this case.
clc;
N = 1024;
n = N-1;

x = fmlin(N, 0.05, 0.45);
figure(1)
plot(x);
figure(2)
m = (hilbert(x));
tfrsp(m);
hold on
tfrsp(x)

figure(3)
tfrwv(x, [1:N], N)
hold on
tfrwv(m, [1:N], N)

