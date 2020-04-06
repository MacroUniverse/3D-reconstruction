%本地点投影到相机平面
%vloc支持size=[N,3]
%输出mn对应size=[N,2]

%mn已经更新为新格式

function mn=Dloc2mn(Dloc, cam)
N=size(Dloc,1);
if N==1
vloc=Dloc-cam(4,:);
vcam=vloc2vcam(vloc,cam);
mn=vcam2mn(vcam,cam);
elseif N>1
Pcam=cam(4,:);
Pcam=repmat(Pcam,N,1);
vloc=Dloc-Pcam;
vcam=vloc2vcam(vloc,cam);
mn=vcam2mn(vcam,cam);
end

end