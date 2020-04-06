%检测二值图像中的边界
function [xs ys]=tfline(tf)

[x y]=ginput1(1);
if tf(x,y)==1
    error('it''s a ''true'' point');
end
for ii=1:100
    x=x+1;
    if  tf(x,y)==1
        break
    end
end

[dx dy]=findnext(tf,x,y);
dx=dx(1); dy=dy(1);

xs=zeros(100,1); ys=xs;
for ii=1:200
    if numel(dx)==1
    x=x+dx; y=y+dy;
    [dx dy]=findnext(tf,x,y,dx,dy);
    %disp(dx); disp(dy)% 观测路径方向
    elseif numel(dx)==2
        x1=x+dx(1); y1=y+dy(1); 
        x2=x+dx(2); y2=y+dy(2);
        tf(x2,y2)=0; 
        [dx,dy]=findnext(tf,x1,y1,dx(1),dy(1));
        if isempty(dx)
            tf(x1,y1)=0; tf(x2,y2)=1;
            [dx,dy]=findnext(tf,x2,y2,dx(2),dy(2));
            if isempty(dx)
               error('maybe the contour is not continue');
            else
                x=x2; y=y2;
            end
        else
            x=x1;y=y1;
        end
    elseif numel(dx)==0  
       error('maybe the contour is not continue');
    end
    xs(ii)=x; ys(ii)=y;
    
    if ii>1&&x==xs(1)&&y==ys(1);
        break
    end
end
xs(ii+1:end)=[]; ys(ii+1:end)=[];
end

function [dx dy]=findnext(tf,x,y,dx,dy)
tfs=tf([x-1 x x+1], [y-1 y y+1]);
tfs(2,2)=0; 
if nargin==5 
    tfs(2-dx(1),2-dy(1))=0;
end
[m n]=find(tfs);
dx=m-2; dy=n-2;
end



