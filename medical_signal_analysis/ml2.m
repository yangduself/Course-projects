clear all;
load('X_2.mat');
load('testX_2.mat');
%get LDA model
A = X;
gscatter(A(:,1),A(:,2),classes)
cls = ClassificationDiscriminant.fit(X,classes);
hold on
K = cls.Coeffs(1,2).Const;
L = cls.Coeffs(1,2).Linear;
f = @(x1,x2) K + L(1)*x1 + L(2)*x2;
h2 = ezplot(f, [0 12 0 12]);
set(h2,'Color','r','linewidth',2)
%define and draw new test vector
load('testX_2.mat');%load('testclasses_1.mat')
b=X;
testvec = b;
line(testvec(1),testvec(2),'marker','+','color','k','markersize',10,'linewidth',2)
testclass = predict(cls, testvec)