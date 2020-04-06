%抛物线拟合
function [a,b,c,d]=mn2para(xy)
    x=xy(:,1); y=xy(:,2);
    x4=sum(x.^4); x3=sum(x.^3); x2=sum(x.^2); x1=sum(x); x0=numel(x);
    yx2=sum(y.*x.^2); yx1=sum(y.*x); yx0=sum(y);
    abc=[x4 x3 x2; x3 x2 x1; x2 x1 x0]\[yx2; yx1; yx0];
    a=abc(1); b=abc(2); c=abc(3);
    d=abs(y-(a*x.^2+b*x+c));
end