%地板砖程序


%读取数据
load mntritile 
load Ptritile
load P0tile
load mn0tile

cam=setcam;
Ntri=size(Ptri,3);

%猜测的Pcam
guess=[1 1 3];

Pcam=zeros(Ntri,3);
for n=1:Ntri
    %1.求ang12,ang23,ang31
    mn=mntri(:,:,n);
    mn=ginput2mn(mn,cam,826,619);
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
scatter3(P0(:,1),P0(:,2),P0(:,3));
scatter3(Pcam(:,1),Pcam(:,2),Pcam(:,3),20,'filled');

Pcam=Pstd(Pcam);

Pori1=1; Pori2=10; %这里修改用于定向的两点


vori=[P0(Pori1,:)-Pcam; P0(Pori2,:)-Pcam];

mnori=ginput2mn([mn0(Pori1,:); mn0(Pori2,:)],cam,826,619);

cam=ori(vori,mnori,cam);
cam(4,:)=Pcam;
showcam(cam,1)
