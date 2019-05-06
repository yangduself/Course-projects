%This script implements an FIR filter
%define filter coefficients
q = 8;
b = fir1(q, 0.25);
figure(1)
freqz(b, 1);
figure(2)
xdat = randn(1,128);
plot(xdat,'r');
hold on
%use filter function to check our code
y1 = filter(b, 1, xdat);
plot(y1, 'b');
x = zeros(1,q+1);
hold on
%main filtering loop
for n = 1:length(xdat)
    %shift tapped delay line
    x(2:q+1)= x(1:q); 
    x(1) = xdat(n);
    y2(n) = x*b'; %this would have to be implemented in a for loop if using "C".
end

