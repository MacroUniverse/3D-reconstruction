%画出空间射线(六参数),输入要画的长度
%L格式支持size(L)=[N,6]

function plotL3(L,Len,LineWidth)
N=size(L,1);
R1=L(:,1:3);
R2=L(:,1:3)+L(:,4:6)*Len;
for n=1:N
    R=[R1(n,:)',R2(n,:)'];
    if nargin==3
        plot3(R(1,:),R(2,:),R(3,:),'LineWidth',LineWidth);
    else
        plot3(R(1,:),R(2,:),R(3,:));
    end
end
end

