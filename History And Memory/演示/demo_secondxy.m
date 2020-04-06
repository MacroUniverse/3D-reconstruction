%secondxy 画图
%参数请在secondxy内部修改
x=linspace(-10,10,100);
y=linspace(-10,10,100);
[X,Y]=ndgrid(x,y);
Z=secondxy(X,Y);
surf(X,Y,Z);


