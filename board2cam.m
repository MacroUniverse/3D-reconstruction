%读取棋盘点阵,确定相机位置,给出误差
function [cam,sigma]=board2cam(nth)

disp(['处理第' num2str(nth) '张相片...']);
cam=setcam('H50');

%读取棋盘点阵
Name=['begin_rect' num2str(nth) '_corners.mat'];
load(Name);


%画出理论棋盘
[x0,y0]=ndgrid(0:10);
x0=x0*1.5198; y0=y0*1.5231;%z0=zeros(size(x0));
setfigure 3D
%scatter3(x0(:),y0(:),z0(:));
plotnet(x0,y0);


%计算相机位置
[m,n]=spatial2mn(x,y);  %mn的总源头,可以在这个程序里修正mn误差
Pmntri=mat2Pmntri(m,n);
[cam,sigma]=Pmntri2cam(Pmntri,cam);  %关键程序
showcam(cam,10);

end



