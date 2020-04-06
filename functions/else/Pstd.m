%std法则排除点取平均值
%二维三维点均可用

function P=Pstd(Ps)

P0=mean(Ps);
P0=repmat(P0,size(Ps,1),1);
err=vmag(Ps-P0);
stand=sqrt(mean(err.^2));
Pgood=Ps(~(err>3*stand),:);
P=mean(Pgood);

end