%模拟相片扭曲
%x, y size 相同即可
function [x1,y1]=simutort(x,y,tol)
if nargin==2
    tol=1/100;
end
r=sqrt(x.^2+y.^2);
r(r==0)=eps;
dx=tol*sin(r)./r;
x1=x+dx;
y1=y;
end
