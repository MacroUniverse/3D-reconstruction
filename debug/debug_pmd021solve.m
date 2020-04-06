% pmd021solve函数的调试
data=9;
N=1; %第N个解



pmd0=pmddatabase(data); %数据库第几个棱锥

xdom=pmd02xdom(pmd0);
X=linspace(xdom(1),xdom(2),10001);
Y=zeros(size(X));

figure;

for n=1:numel(X)
    Y(n)=pmdtrial(pmd0,X(n),N);
end
plot(X,Y);
grid on

tic;
L123=pmd021solve(pmd0,N);
t=toc;
inte=pmd021inte(pmd0,N);
inte1=onesolveinte(inte,pmd0,N);

disp('数据库中的pmd序号')
disp(data)
disp('第N个函数的区间')
disp(N)
disp(inte)
disp('其中有解的区间为')
disp(inte1)
disp('解为')
disp(L123(1))
disp('对应的棱长为')
disp(L123)
disp('用时')
disp(t)


