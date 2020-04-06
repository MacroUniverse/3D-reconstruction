%调试脚本,验证vrect函数是否正确

disp('该程序先由3D点投影到2D平面上,再将其还原成3D')
disp('计算四个坐标,分别是正方形的四个顶点')

%相机参数设置
cam=setcam;

%参考正方形
Dloc=[0 0 0; 1 0 0; 1 1 0; 0 1 0];
L=1;
%投影到相机
mn=Dloc2mn(Dloc,cam);

%画出相片
scatter(mn(:,1),mn(:,2));
hold on
grid on
a=[1 2 3 4 1];
plot(mn(a,1),mn(a,2));
axis equal
axis([-0.5,0.5,-0.5,0.5]);
hold off

%生成rect数组
rect=[[L;L;0;0],mn];

%还原相机方位
cam1=vrect(rect,cam);

disp('下面是计算结果')
disp('计算值为')
cam1(1:5,:)
disp('理论值为')
comp2=cam;
cam(1:5,:)
disp('最大误差为')
max(max(cam1(1:5,:)-cam(1:5,:)))




