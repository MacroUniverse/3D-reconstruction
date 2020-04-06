%一种旋转相机射线束的直观方法
function V1=camturn(V,theta,xy)
vx=V(:,1); vy=V(:,2); vz=V(:,3);
[vx,vy,vz]=turn(vx,vy,vz,[0 0 1],theta);%先绕z轴旋转theta角
[x1,y1,z1]=turn(vx,vy,vz,[0 0 1],[xy(1),xy(2),1]);%在改变z轴
V1=[x1,y1,z1];
end