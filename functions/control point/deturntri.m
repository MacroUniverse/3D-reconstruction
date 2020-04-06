function E=deturntri(V1,V2,theta,Axy)

%特殊转动函数(相机自旋,镜头偏向)
V2=acamturn(V2,theta,Axy);
Len=length(V1);
half=floor(Len/2);
quarter=floor(half/2);
dir=zeros(half,3);
for n=1:half%用三矢矢积判断共面
    A=V1(n,:); B=V2(n,:); C=V1(n*2,:); D=V2(n*2,:);
    tempt=det([C;D;A])*B-det([C;D;B])*A;
    dir(n,:)=vunit(tempt);
end
    tempt=(dot(dir(1:quarter,:)',dir(quarter+1:2*quarter,:)')).^2;
    E=mean(tempt);
    E=1-E;
    
end