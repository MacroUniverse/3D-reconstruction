%单解域的二分法,函数与所需参数在程序中改

function x=devide2(x1, x2, loop, pmd0, N)

y1=pmdtrial(pmd0,x1,N);
signy1=sign(y1);

for ii=1:loop
    x=(x1+x2)/2;
    y=pmdtrial(pmd0,x,N);
    signy=sign(y);
    if signy==signy1
        x1=x;
    elseif signy==-signy1
        x2=x;
    elseif signy==0
        return
    end
end

end
