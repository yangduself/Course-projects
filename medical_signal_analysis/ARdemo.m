%this progam demos the use of the autocorrelation and the
%covariance methods
%four poles of AR model
p1 = 0.9*exp(j*0.3*pi);
p2 = 0.9*exp(-j*0.3*pi);
p3 = 0.95*exp(j*0.7*pi);
p4 = 0.95*exp(-j*0.7*pi);
%get A(z)
a = poly([p1 p2 p3 p4]);
figure(1)
%get ideal PSD
freqz(1, a)
%get white noise
w = randn(32,1);
%filter will all-pole filter 1/A(z)
x = filter(1,a,w);
figure(2)
hold off
pyulear(x,4)
figure(3)
Pxx = pcov(x,4);
semilogy(Pxx);