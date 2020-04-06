%由cam1, cam2得到标准的deturn答案用于检验
%在cam1系中表示cam2
function [theta, x, y]=deturnans(cam1,cam2)

vcam2=vloc2vcam(cam2(1:3,:),cam1);
x2=vcam2(1,:);
y2=vcam2(2,:);
z2=vcam2(3,:);
mag=vmag(z2);
x=z2(1)/z2(3);
y=z2(2)/z2(3);
x1=camturn([1 0 0],0,[x,y] );
sgn=sign(det([x1;x2;z2]));
theta=sgn*vang(x1,x2);

end