%演示以正方形为参考物通过两张相片取点

%生成两张模拟相片(正方形与正方形外一点)


clf;clear;clc;

cam1=setcam(0,0,5,'sph');%第一张相片的相机参数
cam2=setcam(0,0,6,'sph');%第二张相片的相机参数

Dloc=[0 0 0; 1 0 0; 1 1 0; 0 1 0; 1 1 1];% 正方形的四个顶点+正方形外一点
L=1;
mn1=Dloc2mn(Dloc,cam1);% 五个点在相片1上的投影
mn2=Dloc2mn(Dloc,cam2);% 五个点在相片2上的投影

%画出第一张模拟相片
figure;
hold on
grid on
axis([-0.5,0.5,-0.5,0.5]);
axis equal

plot(mn1([1 2 3 4  1],1),mn1([1 2 3 4 1],2));
scatter(mn1(end,1),mn1(end,2));

hold off

%画出第二张模拟相片
figure;
hold on
grid on
axis([-0.5,0.5,-0.5,0.5]);
axis equal

plot(mn2([1 2 3 4  1],1),mn2([1 2 3 4 1],2));
scatter(mn2(end,1),mn2(end,2));

hold off




%真正的还原程序

cam3(6,:)=[pi/3,pi/3,sqrt(3)/2];% 设置 xi
rmns1=[[L;L;0;0],mn1(1:4,:)];% 在第一张相片上面取点
rmns2=[[L;L;0;0],mn2(1:4,:)];% 在第二张相片上面取点

cam1_=vrect(rmns1,cam3);% 还原第一张相片的cam
cam2_=vrect(rmns2,cam3);% 还原第二张相片的cam

L1=mn2Lloc(mn1(5,:),cam1_);% 还原第一条射线
L2=mn2Lloc(mn2(5,:),cam2_);% 还原第二条射线
[R,h,t1,t2]=L22P(L1,L2);% 求交点

figure;
hold on;
grid on;
axis equal;

plotL3(L1,t1+1);% 画出第一条直线
plotL3(L2,t2+1);% 画出第二条直线
scatter3(L1(1),L1(2),L1(3));% 标出第一个相机位置
scatter3(L2(1),L2(2),L2(3));% 标出第二个相机位置
scatter3(R(1),R(2),R(3)); % 标出交点位置
plot3(Dloc([1:4 1],1),Dloc([1:4 1],2),Dloc([1:4 1],3));% 画出正方形








