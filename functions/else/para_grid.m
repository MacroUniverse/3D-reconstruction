%由平行四边形的四个顶点生成网格

function [xg yg]=para_grid(xy4,m,n)

x1=linspace(xy4(1,1),xy4(2,1),m+1);
y1=linspace(xy4(1,2),xy4(2,2),m+1);
x2=linspace(xy4(4,1),xy4(3,1),m+1);
y2=linspace(xy4(4,2),xy4(3,2),m+1);


xg=zeros(m+1,n+1);
yg=xg;

for ii=1:m+1
   xg(ii,:)=linspace(x1(ii),x2(ii),n+1);
   yg(ii,:)=linspace(y1(ii),y2(ii),n+1);
end


end