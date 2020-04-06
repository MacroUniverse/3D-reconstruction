%最小二乘法的直线拟合,d是每个点到直线的距离
%size(mns)=[N,2];

function [k,b,d]=mns2kb(mns)
n=size(mns,1);
    x=mns(:,1); y=mns(:,2);
    k=(n*sum(x.*y)-sum(x)*sum(y))/(n*sum(x.*x)-sum(x)^2);
    b=mean(y)-k*mean(x);
    if nargout==3
        d=abs(y-(k*x+b))/sqrt(1+k^2);
    end
end