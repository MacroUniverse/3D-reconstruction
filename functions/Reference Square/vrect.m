%根据参照正方形在底片上面的投影建立
%输入正方形rect数组,相机参数cam数组(只需用到xi,cam(6,3))
%输出cam

function cam=vrect(rect,cam)

mn1=rect(1,2:3);mn2=rect(2,2:3);mn3=rect(3,2:3);mn4=rect(4,2:3); %1 2 3 4点的位置
Len13=rect(1,1);%1 3 边的长度
Len24=rect(2,1);%2 4 边的长度

%四条线
kb1=d22kb(mn1,mn2);
kb2=d22kb(mn2,mn3);
kb3=d22kb(mn3,mn4);
kb4=d22kb(mn4,mn1);

mn13=kb22mn(kb1,kb3);%1 3线的交点
mn24=kb22mn(kb2,kb4);%2 4线的交点

x=mn2vcam(mn13,cam);%x单位矢量
if vrect_modify(mn1,mn2,mn13)==0 %校正x矢量方向为1指向2
x=-x;
end

y=mn2vcam(mn24,cam);%y单位矢量
if vrect_modify(mn1,mn4,mn24)==0 %校正y矢量方向为1指向4
y=-y;
end

z=cross(x,y);%z单位矢量

%指向1 2 4点的矢量
v1=mn2vcam(mn1,cam);
v2=mn2vcam(mn2,cam);
v4=mn2vcam(mn4,cam);

ang12=vang(v1,v2);
ang2x=vang(v2,x);
ang14=vang(v1,v4);
ang4y=vang(v4,y);


if ang12>=ang14
    magPloc=Len13*sin(ang2x)/sin(ang12);
    
else
    magPloc=Len24*sin(ang4y)/sin(ang14);

end
cam33=[x(:),y(:),z(:)];
Ploc=v1*magPloc;
Pcam=vcam2vloc(-Ploc,cam33);
cam(1:5,:)=[cam33;Pcam;Ploc];

end


