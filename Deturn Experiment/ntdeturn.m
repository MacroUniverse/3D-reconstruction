%牛顿法解deturn程序
function [theta, x, y]=ntdeturn(V1,V2,guess)
derr=1e-8;
x=guess(1); y=guess(2); z=guess(3);

%调试画图(画出路径)
setfigure 3D
xl=x; yl=y; zl=z;
%以上为调试
for ii=1:30

%调试用画图(画出路径)
    if ii==3000
    1;
    end
    plot3([xl x], [yl y], [zl z]);
    xl=x; yl=y; zl=z;
    %以上调试用画图
    
%各阶偏导
[fx,fy,fz]=f1(V1,V2,x,y,z);
[fx1,fy1,fz1]=f1(V1,V2,x+derr,y,z);
[fx2,fy2,fz2]=f1(V1,V2,x,y+derr,z);
[fx3,fy3,fz3]=f1(V1,V2,x,y,z+derr);
fxx=(fx1-fx)/derr; fxy=(fx2-fx)/derr; fxz=(fx3-fx)/derr;
fyx=(fy1-fy)/derr; fyy=(fy2-fy)/derr; fyz=(fy3-fy)/derr;
fzx=(fz1-fz)/derr; fzy=(fz2-fz)/derr; fzz=(fz3-fz)/derr;

Det=[fxx fxy fxz; fyx fyy fyz; fzx fzy fzz];

if det(Det)==0
    error('Det=0');
end

Cons=[-fx; -fy; -fz];
solution=Det\Cons;
xn=solution(1)+x; yn=solution(2)+y; zn=solution(3)+z;
x=xn; y=yn; z=zn;
end

theta=z;
end

function [fx,fy,fz]=f1(V1,V2,x,y,z)
    derr=1e-10;
    fx=(deturntrial(V1,V2,z,[x+derr,y])-deturntrial(V1,V2,z,[x-derr,y]))/derr/2;
    fy=(deturntrial(V1,V2,z,[x,y+derr])-deturntrial(V1,V2,z,[x,y-derr]))/derr/2;
    fz=(deturntrial(V1,V2,z+derr,[x,y])-deturntrial(V1,V2,z-derr,[x,y]))/derr/2;
end