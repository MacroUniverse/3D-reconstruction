%vtrans调用的试探函数
function E=deturntrial(V1,V2,theta,Axy)
err=0;
%特殊转动函数(相机自旋,镜头偏向)
V2=acamturn(V2,theta,Axy);
%trans criteria 纯平移判定函数
Vn=cross(V1,V2);
E=0;

for n=1:3:length(Vn)-2%用三矢矢积判断共面
    %E=abs(det(Vn(n:n+2,:)))+E;
    E=det(Vn(n:n+2,:))^2+E;

end


E=E-err;
end 