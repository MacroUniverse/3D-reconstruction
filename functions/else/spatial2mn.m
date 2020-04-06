%由spacial坐标转换到mn坐标
%注意!:加入了H50中心偏移(CC)矫正

function varargout=spatial2mn(x,y)

Xc=390.34801; 
Yc=289.71811;%这里设置spatial系中相片中心的位置(H50参数),每次校准相机后都要修改

if nargin==2
varargout{1}=x-Xc;
varargout{1,2}=y-Yc;
else
xy=x;
mn(:,1)=xy(:,1)-Xc;
mn(:,2)=xy(:,2)-Yc;
varargout{1}=mn;

end


end