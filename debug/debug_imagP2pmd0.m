%imagP2Pcam的调试
cam=setcam;
P=[0 0 0; 2 0 0; 3 3 0; 0 3 0; 1 0 0; 3 2 0];
Pcam=imagP2Pcam('格子纸1.png',P,cam);

xs=P(:,1);
ys=P(:,2);
zs=P(:,3);
A=[1 2 3 1];B=[4 5 6 4];
figure;
hold on;
plot3(xs(A),ys(A),zs(A));
plot3(xs(B),ys(B),zs(B));
