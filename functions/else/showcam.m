%画出相机在loc系中的位置及方向
%在setfigure('3D')函数生成的坐标系中画

function showcam(cam,size)

alpha=cam(6,1);
beta=cam(6,2);
Pcam=cam(4,:);

Xc=390.34801; 
Yc=289.71811;%这里设置spatial系中相片中心的位置(H50参数),每次校准相机后都要修改
Xc=Xc-alpha/2; Yc=Yc-beta/2;

%画出ij矢量方向
Li=[Pcam,cam(1,:)];
Lj=[Pcam,cam(2,:)];
plotL3(Li,size/3,2);
plotL3(Lj,size/3,2);

%画出投影范围(四棱锥)
mn=[-alpha/2,-beta/2; alpha/2,-beta/2; alpha/2,beta/2; -alpha/2,beta/2]-[Xc,Yc;Xc,Yc;Xc,Yc;Xc,Yc];
L=mn2Lloc(mn,cam);
P=zeros(5,3);
vz=cam(3,:);
for ii=1:4
v=L(ii,4:6);
Len=size/dot(v,vz);
P(ii,:)=L(ii,1:3)+L(ii,4:6)*Len;
end
P(5,:)=P(1,:);
for ii=1:4
temp=[Pcam; P(ii,:); P(ii+1,:)];
X=temp(:,1); Y=temp(:,2); Z=temp(:,3);
fill3(X,Y,Z,'r');
end

X=P(1:4,1);
Y=P(1:4,2);
Z=P(1:4,3);
fill3(X,Y,Z,'b');
    
end