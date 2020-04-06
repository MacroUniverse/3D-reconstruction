%把一条近似直线的曲线段沿着x轴横置, 并给出若干信息

%1.线性拟合出直线
%2.求出直线上距离曲线第一点最近的点D
%3.平移曲线,使该点移动到原点
%4.旋转曲线,使拟合出的直线水平.



function [xy1,D,e,L]=layline(xy)

p=polyfit(xy(:,1),xy(:,2),1); k=p(1);b=p(2);
x1=xy(1,1); y1=xy(1,2);

D(1,2)=(k^2*y1+k*x1+b)/(1+k^2);
D(1,1)=(x1+k*y1-k*b)/(1+k^2);%直线上距离(x1,y1) 最近的点的公式

xy(:,1)=xy(:,1)-D(1);
xy(:,2)=xy(:,2)-D(2);

theta=atan(k);
e=[cos(theta) sin(theta)];
[x1,y1]=turn2(xy(:,1), xy(:,2), -theta);
xy1=[x1 y1];
L=xy1(end,1);

end