% deturn1 的调试


%画出L所在的面的函数
x=linspace(0,.2,100);%-0.3:0.005:-0.2;
y=linspace(0,.2,100);%-0.3:0.005:-0.2;
z=linspace(-.1,.1,10);
E=zeros(numel(x),numel(y));
for ii=1:numel(x)
    for jj=1:numel(y)
        E(ii,jj)=deturntrial(V1,V2, 0.1,[x(ii),y(jj)]);
    end
end

%[x,y]=ndgrid(x,y);
maxi=10;
E(E>maxi)=nan;
[x,y]=ndgrid(x,y);
figure
surf(x,y,E);


%画出一根L的单变量
L=[0.17 0.17 0.1 vunit([-1 -1 0])];
xy0=L(1:2); theta0=L(3); exy=L(4:5); etheta=L(6);
t=linspace(0,0.3,300);
E=size(t);
for ii=1:length(t)
    xy=xy0+exy*t(ii); theta=theta0+etheta*t(ii);
    E(ii)=deturntrial(V1,V2,theta,xy);
end
figure
plot(t,E);

t=deturn1(L,V1,V2,0.05,1e-6);

