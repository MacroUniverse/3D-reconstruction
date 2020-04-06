
cam2=cam;

%cam2(4,:)=cam(4,:)+[0.01  -0.00  0.05];%适用于k3

cam2=ori(Pmn([13 15],:),cam2);

mn=Dloc2mn(Pmn(:,1:3) ,cam2);
setfigure photo
scatter(mn(:,1),mn(:,2))
scatter(Pmn(:,4),Pmn(:,5),10,'filled')
