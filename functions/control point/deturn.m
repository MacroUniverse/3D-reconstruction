%除去转动,只保留平移
%V1,V2,v2满足size=[N,3];
function [theta,x,y]=deturn(V1,V2,guess)

derr=1e-7;%偏微分极限
err=1e-6;%deturn1的最大误差
x=guess(1); y=guess(2); z=guess(3);
step=0.1;

%调试画图(画出路径)
setfigure 3D
xl=x; yl=y; zl=z;
%以上为调试

for n=1:100000
    %调试用画图(画出路径)
    if n==3000
    1;
    end
    plot3([xl x], [yl y], [zl z]);
    xl=x; yl=y; zl=z;
    %以上调试用画图
    
    f=deturntri(V1,V2,z,[x,y]);
    fx=(deturntri(V1,V2,z,[x+derr,y])-f)/derr;%求x偏导
    fy=(deturntri(V1,V2,z,[x,y+derr])-f)/derr;%求y偏导
    fz=(deturntri(V1,V2,z+derr,[x,y])-f)/derr;%求z偏导
    dir=-vunit([fx,fy,fz]); %梯度方向
    L=[x,y,z,dir];%确定射线
    t=deturn1(L,V1,V2,step,err);%求射线上的最小值
    if 0%t<err
        theta=z; return
    end
    x=x+dir(1)*t; y=y+dir(2)*t; z=z+dir(3)*t; %前进到最小值处
end


error('too much loop');


end