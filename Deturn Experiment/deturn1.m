%自创的步长二分法求一元函数的最小值
%这个完全可以用导数的二分法代替...有时间吧...
function t=deturn1(L,V1,V2,step,err)

derr=1e-6;

xy0=L(1:2); theta0=L(3); 
exy=L(4:5); etheta=L(6);


t=0; 

E=deturntrial(V1,V2,theta0,xy0); Elast=E;
pm=-sign(deturntrial(V1,V2,theta0+etheta*derr,xy0+exy*derr)-E); pmlast=pm;
if pm==0
    t=0; return
end

for n=1:20
    %求方向
    if E~=Elast
        pm=-sign(deturntrial(V1,V2,theta0+etheta*(t+derr),xy0+exy*(t+derr))-E);
        if pm==0
            return
        end
        Elast=E;
        if pm==-pmlast;
            step=step/2; pmlast=pm;
        end
    end
    
    t1=t+pm*step;
    xy=xy0+exy*t1;  theta=theta0+etheta*t1;%求原自变量1
    E1=deturntrial(V1,V2,theta,xy);%求值1
    if E1>=E %值1>现值
        step=step/2; %步长减半,重新求值1
    else %值1<现值
        step2=step/2; %试探一半步长的值2
        t2=t+pm*step2;
        xy=xy0+exy*t2;  theta=theta0+etheta*t2;
        E2=deturntrial(V1,V2,theta,xy); %值2
        if E2<E1 %值2<值1
            step=step2; t=t2; %设置当前步长,当前位移
            E=E2; %设置当前值
        else %值2>值1
            t=t1; %设置当前位移
            E=E1; %设置当前值
        end
    end
    if step<err
        return
    end
end

error('too much loop');
end