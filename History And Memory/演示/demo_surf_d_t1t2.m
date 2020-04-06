%探索两条直线的近似交点
%演示两条直线上两点距离,关于t1 t2的函数

T1=-10:0.1:10;
T2=T1;
N1=numel(T1);
N2=numel(T2);

L1=[0 0 0 1 0 0];
L2=[0 0 1 cos(pi/6) sin(pi/6) 0];

dist=zeros(N1,N2);

for ii=1:N1
   for jj=1:N2
   dist(ii,jj)=dist_t1t2(L1,L2,T1(ii),T2(jj));
   end
end
[t1,t2]=ndgrid(T1,T2);
surf(t1,t2,dist);

shading interp
light


