%建立10*10*10立方体的三面点阵


[p1, p2]=ndgrid(0:8,0:8);
h=ones(size(p1))*9;
y1=p1;
z1=p2;
x1=h;
x2=p1;
z2=p2;
y2=h;
x3=p1;
y3=p2;
z3=h;
P=[x1(:), y1(:), z1(:); x2(:), y2(:), z2(:); x3(:), y3(:), z3(:)];


cam1=setcam(35,2,8,'cart','H50');
cam2=setcam(35,4,8,'cart','H50');

V10=Ploc2vcam(P,cam1);
V1=vunit(V10);
V20=Ploc2vcam(P,cam2);
%V20=camturn(V20,0.2, -0.05,pi/30);%理论解
V2=vunit(V20);



mn1=vcam2mn(V1,cam1);
mn2=vcam2mn(V2,cam2);

cam33=[0 1 0; 0 0 -1;-1 0 0];
cam11=cam1; cam22=cam2;
cam11(1:3,:)=cam33; cam22(1:3,:)=cam33;
mn11=Ploc2mn(P,cam11);
mn22=Ploc2mn(P,cam22);




if 0 %画图开关
    
setfigure 3D
scatter3(P(:,1), P(:,2), P(:,3),5,'filled');
showcam(cam1,5);
showcam(cam2,5);

setfigure H50;
scatter(mn1(:,1),mn1(:,2),5,'filled');

setfigure H50;
scatter(mn2(:,1),mn2(:,2),5,'filled');

setfigure H50;
Scatter(mn11,3,'filled');
Scatter(mn22,3,'filled');

end

[Mn1,Mn2]=rectify(mn1,mn2,[480,848]);
setfigure H50
Scatter(Mn1,3,'filled');
Scatter(Mn2,3,'filled');
P=rectified2P(Mn1,Mn2);
setfigure 3D
Scatter3(P);

if 0
cam11=ori([P([1 9],:),Mn1([1 9],:)],cam1);
cam22=ori([P([1 9],:),Mn2([1 9],:)],cam2);
mn11=Ploc2mn(P,cam11);
mn22=Ploc2mn(P,cam22);
setfigure H50;title('1');
Scatter(Mn1); Scatter(mn11);
setfigure H50;title('2');
Scatter(Mn2); Scatter(mn22);
end

