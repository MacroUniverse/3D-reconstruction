%取所有点在所有相片上的对应点
%N是要处理的相片的序号数组

function featurepoints(N)

load begin_cams mni
%mni是N-by-1的元胞, 每个元胞是N-by-3的数组
%每个元胞代表一张相片, 一个元胞前两列是mn坐标, 第三列是点的编号


%读取,显示相片
for ii=N
    Iname=['begin_rect' num2str(ii)];
    I=imread([Iname '.bmp']);
    figure('Name',Iname, 'NumberTitle', 'off'); 
    imshow(I);hold on
end

ii=0;
while 1%每个循环确定一个控制点在不同图片中的坐标
    ii=ii+1;
    
    while 1%每个循环确定一个控制点
        %新点还是久点
        
        input(['取点' num2str(ii) '   选中图片, 调整缩放 (ok:[])']);
        Name=get(gcf,'Name'); n=name2num(Name);
        p=ginput(1); scatter(p(1),p(2));
        mni{n}=[mni{n}; spatial2mn(p) ii];
        con=input('继续取该特征点? (是:[ ] 否:任意值)');
        if ~isempty(con)
            break
        end
    end
        
    con=input('下一个特征点? (是:[ ] 否:任意值)');
    if ~isempty(con)
        break
    end
end

save begin_cams mni -append
end
