%相机修正实验
%从没有误差的模拟相片逆推


load Pmntrimo
load Pmnmo

Pmntri(:,[4 5],:)=mnmodi(Pmntri(:,[4 5],:));
Pmn(:,[4 5])=mnmodi(Pmn(:,[4 5]));


cam=setcam;
%cam(6,3)=cam(6,3)-0.3;

Ntri=size(Pmntri,3);

%猜测的Pcam
guess=[4.5 4.5 20];

Pcam=zeros(Ntri,3);
for n=1:Ntri
    %1.求ang12,ang23,ang31
    mn=Pmntri(:,[4 5],n);
    ang12=mn22ang(mn(1,:),mn(2,:),cam);
    ang23=mn22ang(mn(2,:),mn(3,:),cam);
    ang31=mn22ang(mn(3,:),mn(1,:),cam);
    %2.合并pmd0
    pmd0=[Pmntri(:,1:3,n);[ang12 ang23 ang31]];
    
    %求解Pcam
    [Px,Py,Pz]=ntpmd(pmd0,guess);
    Pcam(n,:)=[Px,Py,Pz];
end

setfigure('3D');
for n=1:Ntri
    scatter3([Pmntri(:,1,n);Pcam(n,1)],[Pmntri(:,2,n);Pcam(n,2)],[Pmntri(:,3,n);Pcam(n,3)],10,'filled');
end
%scatter3(Pcam(:,1),Pcam(:,2),Pcam(:,3),20,'filled');

Pcam=Pstd(Pcam);
cam(4,:)=Pcam;

cam=ori(Pmn([1 7],:),cam);
cam(5,:)=vloc2vcam(-Pcam,cam);

showcam(cam,5)

%view([0 90]);
%axis([.5 1.5 1.4 2]);
