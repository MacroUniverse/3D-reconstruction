%begin程序的下一步: 根据已知点确定相机位置, 计算未知点
%N是要处理的相片编号(矢量)

function next(N)

load begin_cams mni cams sigma
load Lerr2 DL

for ii=N
    %显示相片, 改名, 取句柄
    Iname=['begin_rect' num2str(ii)];
    I=imread([Iname '.bmp']);
    figure('Name',Iname,'NumberTitle', 'off');
    imshow(I); hold on
    
    %画出可选的点
    mnii=mni{ii};
    scatter(mnii(:,1), mnii(:,2),'b')%画出该图所有特征点
    
    np=size(mnii,1);
    mark= false(np,1);
    for jj=1:np;%找出该图中已知空间坐标的特征点,并从中选取
         if isnan(DL(mnii(jj,3),1))
             continue
         end
         mark(jj)=true;
    end
    scatter(mnii(mark,1), mnii(mark,2),5,'filled','r');
    
    
    %鼠标选取已知点进行相机定位
    Pmntri=[];
    while 1
        input('准备好逆时针取3红点(已知坐标)用于定位相机(ok:[ ])')
        [i,mn]=ginputmni(mnii(mark,:),3);
        Pmntri=cat(3,Pmntri, [DL(i,:),mn]);
        con=input('继续? (ok: [ ], no:任意键)');
        if ~isempty(con)
            break
        end
    end
    cam=setcam('H50');
    [cams{ii},sigma(ii)]=Pmntri2cam(Pmntri,cam);
    
    %画图以确认
    
end
    




end