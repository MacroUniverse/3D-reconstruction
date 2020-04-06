%选密度点
function [Pc,sigma]=pickP(P)

Np=size(P,1);
Lcriti=4;%这里调整判定距离
Ncriti=Np/3; %这里调整判定点数

b=0;
for ii=1:Np
P0=P(ii,:);
Nnear=0;
    for jj=1:Np
    L=vmag(P(jj,:)-P0);
        if L<=Lcriti
            Nnear=Nnear+1;
            if Nnear>=Ncriti
                Pc=P(ii,:); b=1;break
            end
        end
    end
if b==1
    break;
end
end

if b==0
   error('points is too scattered');
end

L=vmag(P-repmat(Pc,Np,1));
mark= L<Lcriti;
P=P(mark,:);
Pc=mean(P);
scatter3(P(:,1),P(:,2),P(:,3),5);%画图确认
scatter3(Pc(1),Pc(2),Pc(3),4);%画图确认
sigma=mean(vmag(P-repmat(Pc,size(P,1),1)));%平均误差

end