%通过两条kb线,得出相交的mn点
%输入,两个kb数组

function mn=kb22mn(kb1,kb2)

k1=kb1(1); b1=kb1(2); k2=kb2(1); b2=kb2(2);

if k1==k2 %两直线平行
    m=inf;
    if isinf(k1) %L1,L2垂直x轴
    n=inf;
    else  %L1,L2不垂直x轴
    n=k1;
    end
else %两直线不平行
    if isinf(k1) %L1垂直x轴
    m=b1;
    n=k2*m+b2;
    elseif isinf(k2) %L1垂直x轴
    m=b2;
    n=k1*m+b1;
    else %都不垂直x轴
    m=(b2-b1)/(k1-k2);
    n=k1*m+b1;
    end
end

mn=[m,n];

end