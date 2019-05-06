%this script tests out Matlab code for a Direct Form II implementation
%of an IIR filter
clear
p = 8;
[b a] = butter(p, 0.25);%butter does Butterworth analog followed by BLT
xdat = randn(1,128);
%use filter function to check our code
figure(1)
y1 = filter(b, a, xdat);
plot(y1);
figure(2)
freqz(b,a);
%tapped delay line (ripple buffer):
w = zeros(1,p);

%main filtering loop
for n = 1:length(xdat)
    %shift tapped delay line
    w(2:p+1)= w(1:p); 
    w(1) = xdat(n) - w(2:p+1)*a(2:p+1)'; %this is the 1/A part
    y2(n) = w*b'; %this is the B part
end
figure(3)
plot(y2);
