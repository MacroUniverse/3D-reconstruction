%1次std法则的二维实验
setfigure('photo')

mn=ginput;
mn0=mean(mn);
mn0=repmat(mn0,size(mn,1),1);
err=vmag(mn-mn0);
stand=std(err);
mark=err<1.3*stand;
mnpick=mn(mark,:);
mnout=mean(mnpick);
scatter(mn(:,1),mn(:,2),10,'filled');
scatter(mn0(:,1),mn0(:,2),30);
scatter(mnpick(:,1),mnpick(:,2),20);
scatter(mnout(:,1),mnout(:,2),40);