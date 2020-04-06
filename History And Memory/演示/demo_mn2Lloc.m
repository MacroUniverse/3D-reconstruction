%演示,在屏幕上面用鼠标取n点,在3D坐标系中演示出对应射线

cam=setcam;

figure;
axis equal;
axis([-1/2 1/2 -1/2 1/2]);
grid on;
hold on;
N=21;
mn=ginput(N);

figure;
grid on;
hold on;
for n=1:N
L=mn2Lloc(mn(n,:),cam);
plotL3(L,10);
end
axis equal