%反camturn函数(输入camturn一样的参数,还原camturn的效果
function V1=acamturn(V,theta,xy)
vx=V(:,1); vy=V(:,2); vz=V(:,3);
[vx,vy,vz]=turn(vx,vy,vz,[0 0 1],[-xy(1), -xy(2),1]);
[x1,y1,z1]=turn(vx,vy,vz,[0 0 1],-theta);
V1=[x1,y1,z1];
end