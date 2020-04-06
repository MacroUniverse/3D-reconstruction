%厨房地板砖演示
%结果...反而beta误差-1.9%...


load Pmntrik3
load Pmnk3
mul=1+0.003;
%mul=1-0.003;%适用k2
%mul=1-0.019;%适用k1
Pmntri(:,5,:)=Pmntri(:,5,:)*mul;
Pmn(:,5)=Pmn(:,5)*mul;
%Pmntri(:,4,:)=Pmntri(:,4,:)+Pmntri(:,5,:)*0.003;%适用k2

cam=setcam;
%cam(6,3)=cam(6,3)-0.3;

Ntri=size(Pmntri,3);

%猜测的Pcam
guess=[1.5 1.5 5];

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
for n=1:4
    scatter3([Pmntri(:,1,n);Pcam(n,1)],[Pmntri(:,2,n);Pcam(n,2)],[Pmntri(:,3,n);Pcam(n,3)],10,'filled');
end
%scatter3(Pcam(:,1),Pcam(:,2),Pcam(:,3),20,'filled');

Pcam=Pstd(Pcam);
cam(4,:)=Pcam;

cam=ori(Pmn([1 7],:),cam);
cam(4,:)=Pcam;
showcam(cam,5)

%view([0 90]);
%axis([.5 1.5 1.4 2]);
