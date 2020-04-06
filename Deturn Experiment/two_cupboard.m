%运行该程序以获取V1 V2  并且打出相应的图片;
 
 D=[0 0 0; 1 0 0; 1 1 0; 0 1 0; 0 0 1; 1 0 1; 1 1 1; 0 1 1; 0 0 2; 1 0 2; 1 1 2; 0 1 2];
 D1=D;
 D1(:,2)=D1(:,2)+1.5;
 D1=camturn(D1,pi/3,[1 1 0]);
 D=[D;D1];
 cam1=setcam(4,4,3,'cart');
 V10=Dloc2vcam(D,cam1);
 V10=camturn(V10,0,[0.2 0]);
 V20=V10;  V20(:,2)=V20(:,2)-1; V20(:,1)=V20(:,1)-1;
 V20=camturn(V20,0.1,[0.1 0.1]);


 V1=vunit(V10);
 V2=vunit(V20);


mn1=vcam2mn(V10,cam1);
mn2=vcam2mn(V20,cam1);
 
 
order1=[1 2 3 4 1 5 6 7 8 5 9 10 11 12 9];
order2=order1+12;

setfigure photo
plot(mn1(order1,1),mn1(order1,2));
plot(mn1(order2,1),mn1(order2,2));

setfigure photo
plot(mn2(order1,1),mn2(order1,2));
plot(mn2(order2,1),mn2(order2,2));

clear D D1  V10 V20 order mn1 mn2