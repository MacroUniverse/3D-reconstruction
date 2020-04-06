
%鼠标取三维点程序
%size(D)=[N,3]; 
%size(N)=[N,1];
%N是每个D对应的编号(可不填, 返回选中的D)

function DorN=ginput3(Iname,cam,D,N)
critic=2;%达标距离

ND=size(D,1);
I=imread(Iname);
h=figure;
imshow(I); hold on;

%在图上画出可以取的点
for ii=N
    mn=Dloc2mn(D(ii,:),cam);
end

while 1
    
    input('调整图片准备取点 (ok:回车)');
    p=ginput(1);
    redo=input('是否重做? (否: 回车; 是: 任意值)');
    if ~isempty(redo)
        input('调整图片, 准备取点 (ok:回车)');
        p=ginput(1);
    end
    
    mn=spatial2mn(p);
    L=mn2Lloc(mn,cam);
    for ii=N
        H=LP2H(L,D(ii,:));
        if H<=criti
        end
    end
    
    con=input('继续取点? (是:[ ]; 否:任意值)');
    if ~isempty(con)
        break
    end
end


end
