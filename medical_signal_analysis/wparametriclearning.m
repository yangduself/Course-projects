clc;

N= 16;
n = [0, N-1];

x = cos(0.4*pi*n) + cos(0.45*pi*n);

for K=0:9
   z = (sqrt(0.0001)* rand(1,N); 
   m = x+z;
   figure(1)
   Pxx0 = periodogram(m);
   semilogy(Pxx0);
   hold on
   Pxx1 = pyulear(m, 4);
   semilogy(Pxx1, 'r');
   hold on
   Pxx2 = pcov(m, 4);
   semilogy(Pxx2, 'g');
end

  