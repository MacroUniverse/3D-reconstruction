%纸质格子纸实验(新增Pmn格式数组,从3Dm demo程序修改


load Pmntrigrid4
load Pmngrid4

%更新mn数据格式
cam=setcam('N97');
Pmn(:,[4 5])=mn_old2new(Pmn(:,[4 5]),cam);
for ii=1:size(Pmntri,3)
    Pmntri(:,[4 5],ii)=mn_old2new(Pmntri(:,[4 5],ii),cam);
end

mul=1.019;%0.016 0.022
Pmntri(:,5,:)=Pmntri(:,5,:)*mul;
Pmn(:,5)=Pmn(:,5)*mul;


%cam(6,3)=cam(6,3)-0.3;

Ntri=size(Pmntri,3);

%猜测的Pcam
guess=[-2 0.9 26];

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

cam=ori(Pmn([1 46],:),cam);
cam(4,:)=Pcam;
showcam(cam,5)
