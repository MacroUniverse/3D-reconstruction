%线性判定
%需要内部暂停以调整画面

function [xy1,d]=isline(xy)

%以下屏蔽掉的是取点程序, 请用getlines函数完成

%xy=zeros(0,2);

%for n=1:200
%[x,y,button]=ginput;
%if button(end)==3
%    break
%end
%xy=[xy;x,y];
%end

%cam=setcam;
%mn=ginput2mn(xy,cam,4000,3000);%这里修改相片规格
%figure
%scatter(mn(:,1),mn(:,2),3,'filled');
k=mns2kb(xy);
theta=-atan(k);
xy(1,3)=0;
[x,y]=turn(xy(:,1),xy(:,2),xy(:,3),[0 0 1],theta);
xy1=[x,y];
figure

scatter(xy1(:,1),xy1(:,2),3,'filled');

[~,~,d]=mns2kb(xy1);
d=max(d);




end