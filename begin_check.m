%画出一张3D图, 展示交点
%N的是交点的序号数组

function begin_check(N)

load Lerr2
load begin_cams

%画出理论棋盘
[x0,y0]=ndgrid(0:10);
x0=x0*1.5198; y0=y0*1.5231;%z0=zeros(size(x0));
setfigure 3D
%scatter3(x0(:),y0(:),z0(:));
plotnet(x0,y0);


% 画出相机标出序号
for ii=1:numel(cams)
    if isempty(cams{ii})
        continue
    end
    showcam(cams{ii}, 10);
    p=cams{ii}(4,:)-cams{ii}(3,:)*5;
    text(p(1),p(2),p(3), num2str(ii));
end


%画出射线交点
for ii=N
    NL=size(Lerr2{ii},1);
    for jj=1:NL
        mag=vmag(DL(ii,:)-Lerr2{ii}(jj,1:3));
        plotL3(Lerr2{ii}(jj,1:6),mag+0.1);
    end
    
end

%画出最佳交点, 误差点分布, 显示每条线的误差
for ii=N
    NL=size(Lerr2{ii},1);
    if NL>1
        D=DL(ii,:);%最佳交点
        P=LP2P(Lerr2{ii}, DL(ii,:));%误差点分布
        
        scatter3(P(:,1),P(:,2),P(:,3),30,'filled','b');
        scatter3(D(1),D(2),D(3),40,'r');
        
        disp(['第' num2str(ii) '点的误差分布:']);
        disp(Hs{ii});
    end
end


end

