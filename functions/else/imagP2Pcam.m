%根据若干已知点和包含这些点的图片(手动取点)求出相机的位置

function Pcam=imagP2Pcam(imagname,P,cam)

NP=size(P,1);
if mod(NP,3)~=0
    error('mod(NP,3)~=0');
end

%name=imagname;
%h=imread(name);
%xmax=size(h,2); ymax=size(h,1);
%imshow(h);
%xy=ginput(NP);
%mn=ginput2mn(xy,xmax,ymax,cam);
load mn3

Pcam=zeros(NP/3,3);
for n=1:3:NP
    mn1=mn(n,:);mn2=mn(n+1,:);mn3=mn(n+2,:);
    ang123=mn22ang([mn1; mn2; mn3],[mn2; mn3; mn1],cam)';
    [Pcam((n+2)/3,1),Pcam((n+2)/3,2),Pcam((n+2)/3,3)]=ntpmd([P(n:n+2,:); ang123],[5.06 5.23 5.00]);
end

Pcam=Pcam(isfinite(Pcam(:,1)),:);

end

