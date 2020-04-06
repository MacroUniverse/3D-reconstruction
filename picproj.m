%从一个plane33定义的平面上的点(px,py)投影到相片上的点(m,n)
%plane33格式:[单位矢量i; 单位矢量j; 原点位置p]

function [m,n]=picproj(xp,yp,plane33,cam)

i=plane33(1,:);  j=plane33(2,:); p=plane33(3,:);
i=vloc2vcam(i,cam); 
j=vloc2vcam(j,cam);
p=vloc2vcam(p-cam(4,:),cam);
xi=cam(6,3);

temp=xp*i(3)+yp*i(3)+p(3);
m=xi*(xp*i(1)+yp*j(1)+p(1))./temp;
n=xi*(xp*i(2)+yp*j(2)+p(2))./temp;

end