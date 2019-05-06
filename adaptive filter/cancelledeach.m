%%load('r10_edfm.mat')
load('r04_edfm (2).mat')
ntr=50000;
Wopt=[5.57784015265975;-6.28603568117296;-0.0703474695419573;2.27029772639617;1.04657583831914;-0.772278925353362;-1.29441861789246;-0.391721845120419;0.634143271842731;0.745997374049239;0.192084628323812;-0.557933821198503;-0.635994019110740;-0.200190604683712;0.300716412667157;0.299399796540797;-0.0311515875453097;-0.522787532953998;-0.552079627231478;-0.240143564682512;0.150692781851831;0.292147927004862;0.0291829523870319;-0.257394676923013;-0.374059982765402;-0.162568428836948;0.169109222480188;0.328643587920055;0.355299787735021;0.0933444075221814;-0.767906479642335;-0.0138534101183723;0.157706861226416;0.313256635311745;0.121609047153470;-0.170362027426563;-0.382781356837995;-0.348463856131275;0.0668676308669092;0.323588622861081;0.338846085506702;-0.0366977678177136;-0.355684752688603;-0.309495113289813;0.232750667498294;0.658632154787483;0.601122070189376;-0.120764199475161;-0.817257917232382;-0.453141411475372;0.816677416518360;1.74694830913359;0.0480614499101648;-4.44114644589718;4.06576313800179];
%Wopt=[2.47444106226483;-3.36285037757698;0.0661685597180757;1.05947558299799;0.427683434994236;-0.402174485429583;-0.530890316891457;-0.0685402482555020;0.394021929842491;0.320584590601548;-0.0829359779992842;-0.285266837378572;0.157343510360249];
%%Wopt=[3.96736184122509 -3.94290383161196 -0.513644404316160 1.00090297231596 0.848199004203405 0.0216515260524499 -0.504672974060220 -0.426071960685718 -0.0392995490223900 0.184511401355550 0.182963090096195 0.201289046134605 -0.322411928396832]';
L = 55;
excessMSE = zeros(1,ntr);

muhat=0.02;
bet=0.01;
sig = 0.1;
rho = 0.9;

for k=1:1

%%W = Wopt+randn(L,1);
W=zeros(L,1);
X = zeros(L,1);
dhat = zeros(1,ntr);
e = zeros(1,ntr);
x = zeros(1,ntr);
ll = 1:L-1;
llp1 = ll+1;
Wtot = zeros(L,ntr);
d=[zeros(1,30) val(5,1:ntr-30)];
%%x = x(1,101:ntr+100);
x = [val(2,1:ntr)];
for i=1:ntr
    X(llp1) = X(ll);
    X(1) = x(i);
    dhat(i) = W'*X;
    e(i) =  d(i)-dhat(i);
    W = W + muhat/(bet+X'*X)*e(i)*X;
    Wtot(:,i) = W;
    V = W-Wopt;
    excessMSE(i) = excessMSE(i) + (V'*X)^2;    
end

end


figure(1)
semilogy(1:ntr,excessMSE/1000,'-b','LineWidth',3);
figure(2)
%subplot(2,1,1)
t = (1:ntr)/1000;
plot(t,d,t,x,t,e);
%plot(t,e,t,d);
%legend('Desired','Input','Error')
m=val(1,1:ntr);
legend('Desired','Input','Error')
%figure(3)
%plot(t,e)

%plot(t,m,t,e)