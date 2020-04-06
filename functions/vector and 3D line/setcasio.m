%相机参数初始化
%以下是默认值,第二行适用于Nokia N97主相机
%phi=pi/5; theta=pi/5; dist=5;
%alpha=1; beta=0.75; xi=1;

function cam=setcasio(phi,theta,r,sph_cart)


if nargin==0 %如果没有输入,phi,theta,r取默认,转到球坐标法计算cam33,Pcam
    phi=pi/5;
    theta=pi/6;
    r=5;
    sph_cart='sph';
end

if strcmp(sph_cart,'cart') %直角坐标计算cam33,Pcam
    if phi==0&&theta==0
    i=[0 -1 0];
    else
    i=vunit([theta,-phi,0]);
    end
    k=vunit([-phi,-theta,-r]);
   
    j=cross(k,i);
    cam33=[i(:)';j(:)';k(:)'];
    Pcam=[phi,theta,r];
    
elseif strcmp(sph_cart,'sph') %球坐标计算cam33,Pcam
   k=zeros(1,3);
   [k(1),k(2),k(3)]=sph2cart(theta,pi/2-phi,1);
   k=-k;
   i=[sin(theta), -cos(theta), 0];
   j=cross(k,i);
   cam33=[i(:)';j(:)';k(:)'];
    Pcam=-cam33(3,:)*r;
end
    
   
    Ploc=vloc2vcam(-Pcam,cam33);
    alpha=1;   %相片水平尺寸,casio
    beta=3/4;    %相片垂直尺寸,casio
    xi=0.928205478006073;  %casio;
    
    %按格式合并
    cam=[cam33;Pcam;Ploc;alpha,beta,xi];
end