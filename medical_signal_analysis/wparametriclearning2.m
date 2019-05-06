clc;


N= 64;
n = [0:N-1];

x = cos(0.4*pi*n) + cos(0.45*pi*n);

for K =1:32
    [A sigmaw2]=aryule(x,K);
    AIC1(K) = N*log(sigmaw2) + 2*K;
    FPE1(K) = ((N+K)/(N-K))*sigmaw2  
    figure(1)
    stem(AIC1)
    hold on
    figure(2)
    stem(FPE1)
    hold on
end

for k = 1:32
    [B sigmaw3]=arcov(x,k)
    AIC2(k) = N*log(sigmaw3) + 2*k;
    FPE2(k) = ((N+k)/(N-k))*sigmaw3
    figure(3)
    stem(AIC2)
    hold on
    figure(4)
    stem(FPE2)
    hold on
end

