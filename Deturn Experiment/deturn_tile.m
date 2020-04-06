%地板砖deturn实验
x=3:-1:-3;
y=-3:3;
[x,y]=ndgrid(x,y);
xy=[x(:),y(:)];
xy(end,3)=0;

