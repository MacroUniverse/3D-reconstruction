%通过鼠标取点生成Pmn数组
%如需放大,可以在ginput函数前面暂停调试
%cam需用到cam(6,:),即xi

%mn按照y轴倒置的格式

function Pmn=genPmn(P,cam)
%请先做好P矩阵
NP=size(P,1);

Pmn=zeros(NP,5);
Pmn(:,1:3)=P;
for n=1:NP
    disp('请取以下坐标的点');
    disp(P(n,:));
    xy=ginput(1);
    if numel(xy)==0%如果取错,请直接按回车
        disp('请重新取以下坐标的点');
        disp(P(n,:));
        xy=ginput(1);
    end
    Pmn(n,[4 5])=ginput2mn(xy,cam);
end

end