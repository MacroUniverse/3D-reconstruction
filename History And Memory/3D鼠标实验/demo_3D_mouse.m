%3D mouse实验


%读取数据
load mntri3Dm3
load Ptri3Dm3

cam=setcam;
Ntri=size(Ptri,3);

%猜测的Pcam
guess=[ 2.461944632308177   6.616788346476625  13.045745802752219];

Pcam=zeros(Ntri,3);
for n=1:Ntri
    %1.求ang12,ang23,ang31
    mn=mntri(:,:,n);
    ang12=mn22ang(mn(1,:),mn(2,:),cam);
    ang23=mn22ang(mn(2,:),mn(3,:),cam);
    ang31=mn22ang(mn(3,:),mn(1,:),cam);
    %2.合并pmd0
    pmd0=[Ptri(:,:,n);[ang12 ang23 ang31]];
    
    %求解Pcam
    [Px,Py,Pz]=ntpmd(pmd0,guess);
    Pcam(n,:)=[Px,Py,Pz];
end

setfigure('3D');
scatter3(Ptri(:,1,1),Ptri(:,2,1),Ptri(:,3,1));
scatter3(Ptri(:,1,2),Ptri(:,2,2),Ptri(:,3,2));
scatter3(Ptri(:,1,3),Ptri(:,2,3),Ptri(:,3,3));
scatter3(Pcam(:,1),Pcam(:,2),Pcam(:,3),20,'filled');

Pcam=Pstd(Pcam);


vori=[Ptri(1,:,1)-Pcam; Ptri(2,:,1)-Pcam];

mnori=[mntri(1,:,1); mntri(2,:,1)];

cam=ori(vori,mnori,cam);
cam(4,:)=Pcam;
showcam(cam,5)
