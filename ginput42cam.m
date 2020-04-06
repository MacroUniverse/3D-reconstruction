%根据4个控制点大定位相机(前3个组成pmd, 第4个用于排除多余解)
%输入的cam中只需要cam(6,3)

function cam=ginput42cam(Iname,cam)

load Lerr2 DL

I=imread(Iname);
h=figure; imshow(I);
disp('注意请按照逆时针取三个尽量分散的已知点');


Pmn=zeros(4,5);
for ii=1:4

    NorD=input(['请输入第' num2str(ii) '个点的序号或者三维坐标']);
    if numel(NorD)==1
        Pmn(ii,1:3)=DL(NorD,:);
    else
        Pmn(ii,1:3)=NorD;
    end
    
    figure(h);    
    input(['现在准备取第' num2str(ii) '个点,请调整缩放(ok:[])']);
    xy=ginput(1);
    Pmn(ii,[4 5])=spatial2mn(xy);
    
end

end