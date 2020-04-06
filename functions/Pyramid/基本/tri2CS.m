%余弦定理求三角形的一个角
function [Cosine,Sine]=tri2CS(c,a,b)
    Cosine=(a^2+b^2-c^2)/(2*a*b);
    if nargout==2
        Sine=sqrt(1-Cosine^2);
    end
end