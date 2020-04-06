Pcam=sum(Pcam([3 4 9],:))/3;
v=[P0(1,:)-Pcamave; P0(10,:)-Pcamave];
load mn0tile
mn=ginput2mn(mn0([1,10],:),826,619,cam);
cam=ori(v,mn,cam);
cam(4,:)=Pcam;
cam(5,:)=vloc2vcam(-cam(4,:),cam);
%cam=setcamP2P([-0.5330, -1.1769, 2.5276], [1.2,0.8,0]);


mn=Dloc2mn(P0,cam);

setfigure('photo');
scatter(mn(:,1),mn(:,2))
