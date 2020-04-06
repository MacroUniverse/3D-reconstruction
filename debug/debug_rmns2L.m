cam=setcam;
names={'1.jpg','2.jpg'};
%rmns=imag2rmns(names,cam,1,1);
load rmns
L=rmns2L(rmns,cam);
[R,h]=L22P(L{1},L{2});
figure
hold on
grid on
axis equal

plotL3(L{1},5);
plotL3(L{2},5);

scatter3(R(:,1),R(:,2),R(:,3));