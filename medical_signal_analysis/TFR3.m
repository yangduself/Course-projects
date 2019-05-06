clc;
N = 1024;
%Parabolic frequency modulated signal
z=fmpar(1024,[1 0.05],[500 0.1],[1000 0.45]);
%original signal
figure(1)
semilogy((z))
figure(2)
%Spectrogram time-frequency distribution
tfrsp(z,[1:N],N,hamming(odd(128)));
%Wigner distribution
figure(3)
tfrwv(z,[1:N],N);