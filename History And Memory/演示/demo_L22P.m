L1=[-1 0 0 1 0 0 ];
L2=[0 -1 1 0 1 0];

hold on
grid on

plotL3(L1,4);
plotL3(L2,4);
[R,t1,t2,h]=L22P(L1,L2);
scatter3(R(1),R(2),R(3));
hold off
