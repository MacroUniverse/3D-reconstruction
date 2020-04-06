%矩形平面点阵连线
%由于某些程序需要, 只负责画图
function plotnet(X,Y)
N1=size(X,1);
N2=size(X,2);
for ii=1:N1
  plot(X(ii,:),Y(ii,:),'b');
end
for ii=1:N2
  plot(X(:,ii),Y(:,ii),'b');
end

end