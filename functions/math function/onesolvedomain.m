% 寻找某区间内连续函数单解域(试探算法)
%有待修改


%求函数的单解域

x1=0;
x2=vmag(pmd0(1,:)-pmd0(2,:))/sin(pmd0(4,1));
y1=pmdtrial(pmd0,x1,N);   
y2=pmdtrial(pmd0,x2,N);

if y2==0
x=x2;return
end


if y1==0 %调试调试调试调试调试调试调试调试调试调
    error('pmdtrial(0)==0');   %调试调试调试调试调试调
end %调试调试调试调试调试调试调试调试调试调试调试



%找定义域
finitey1=isfinite(y1);
finitey2=isfinite(y2);

%case 0 0
if finitey1==0&&finitey2==0 
    [x3,y3]=onefinite(x1,x2,pmd0,N,loop3);%找到一个  定义域内的x
    if isnan(x3) %不存在定义域
        error('实验: 这种状况出现过');%调试,如果没有错误提示,该情况可删除
        % x=nan;return
    elseif y3==0 %刚好是解
        x=x3;return
    end
    
    xdom=f2(x1,x2,x3,y3,pmd0,N,loop1);%正常情况,y3=finite ; y3~=0 , 两边找单解域
    
%case 0 1
elseif finitey1==0&&finitey2==1
    xdom=f1(x2,x1,y2,pmd0,N,loop1); %向左找可解域
    
%case 1 0
elseif finitey1==1&&finitey2==0
    xdom=f1(x1,x2,y1,pmd0,N,loop1); %向右找可解域
    
%case 1 1
elseif finitey1==1&&finitey2==1
    signy1=sign(y1);
    signy2=sign(y2);
    if signy1==signy2
        x=nan;return
    elseif signy1==-signy2
       xdom=[x1,x2];
    end
end

if isnan(xdom)
    x=nan;return    
elseif xdom(1)==xdom(2)
    x=xdom(1);return
end


%y2=nan,y1=finite,y1~=0 求可解区间(x1 x2,不分大小)
function xdom=f1(x1,x2,y1,pmd0,N,loop1)
 signy1=sign(y1); 

 for n=loop1
    x=(x1+x2)/2;           
    y=pmdtrial(pmd0,x,N);     
    if isnan(y) %y不在定义域内
        x2=x;
    else          %y在定义域内
        signy=sign(y);
        if signy==-signy1  %y1与y异号 ,找到单解域
            xdom=sort([x,x1]); return
        elseif signy==signy1 %y1与y同号, 继续找
            x1=x;
        elseif signy==0 %碰巧是解点, 返回x空域
            xdom=[x,x]; return
        end
    end
 end

 xdom=nan; %近似无解

end



%y1=nan,y2=nan,y3=finite,y3~=0 (x1<x3<x2) 求可解区间
%注解类似于f1
function xdom=f2(x1,x2,x3,y3,pmd0,N,loop1)
%  x1<x3<x4<x2 x1与x3夹逼, x4与x2夹逼.
x4=x3;
signy3=sign(y3);
signy4=signy3;

for n=loop1
    x=(x1+x3)/2;
    y=pmdtrial(pmd0,x,N);
    if isnan(y)
        x1=x;
    else
        signy=sign(y);
        if signy==signy3
            x3=x;
        elseif signy==-signy3
            xdom=[x x3];return
        elseif signy==0
            xdom=[x x];return
        end
    end
    
    x=(x2+x4)/2;
    y=pmdtrial(pmd0,x,N);
    if isnan(y)
        x2=x;
    else
        signy=sign(y);
        if signy==signy4
            x4=x;
        elseif signy==-signy4
            xdom=[x4 x];return
        elseif signy==0
            xdom=[x x];return
        end
    end
    
end

xdom=nan;

end

function [x,y]=onefinite(x1,x2,pmd0,N,loop3)
L=x2-x1;
for n=loop3
    expn=2^n;
    for nn=1:2:expn
        x=x1+L*nn/expn;
        y=pmdtrial(pmd0,x,N);
        if isfinite(y)
            return
        end
    end
end
x=nan;
y=nan;
end
