Fs = 1024;
N = 1024;
x = randn(1,N);
%generate white noise, Gaussian, zero mean variance 1.

omega = [0:N/2]*pi/(N/2); %=lenght/2
Pxx = periodogram(x);
figure(1)
semilogy(omega,Pxx)
xlabel('\omega')
ylabel('Periodogram(\omega)')
var(Pxx)
axis([0 pi 1e-4 10])



figure(2)
Pw = pwelch(x);
w = [0:length(Pw)-1]/(length(Pw)-1)*pi; % = length its self
semilogy(w,Pw)
var(Pw)
axis([0 pi 1e-4 10])
ylabel('pwelch')
xlabel('\omega')

s = cos(0.3*pi*[0:N-1]) + cos(0.32*pi*[0:N-1]);
Pxx = periodogram(s);
figure(3)
semilogy(omega,Pxx)
axis([0 pi 1E-10 1E5])
ylabel('periodogram')
xlabel('\omega')

figure(4)
Pw = pwelch(s);
w = [0:length(Pw)-1]/(length(Pw)-1)*pi;
semilogy(w,Pw)
var(Pw)
axis([0 pi 1E-10 1E5])
ylabel('pwelch')
xlabel('\omega')




