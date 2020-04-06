%spatial2mn的反函数

function varargout=mn2spatial(m,n)

Xc=390.34801; 
Yc=289.71811;%这里设置spatial系中相片中心的位置(H50参数),每次校准相机后都要修改

if nargin==2
varargout{1}=m+Xc;
varargout{1,2}=n+Yc;
else
mn=m;
xy(:,1)=mn(:,1)+Xc;
xy(:,2)=mn(:,2)+Yc;
varargout{1}=xy;

end


end