clc;
load('X_1.mat');
load('classes_1.mat');
gscatter(X(:, 1), X(:, 2), classes);
load('testX_1.mat');
testvec = X;
%%line(testvec(1),testvec(2),'marker','+','color','k','markersize',10,'linewidth',2);
[n,d] = knnsearch(X,testvec,'k',4);
line(X(n,1),X(n,2),'color',[.5 .5 .5],'marker','o','linestyle','none','markersize',10)

%tabulate results
load('classes_1.mat')
tabulate(classes)