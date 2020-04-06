% 交集
%注意格式区间inte
function inte=setcross(inte1, inte2)

inte=zeros(0,2);
for n=1:size(inte1,1)
    for m=1:size(inte2,1)
        inte11=inte1(n,:); inte12=inte2(m,:);
        temp=set1cross(inte11,inte12);
        if isfinite(temp)
            inte=[inte;temp];
        end
    end
end

if size(inte,1)==0
    inte=nan;
end

end

function inte=set1cross(inte1,inte2)

inte=[0 0];

if any(isnan(inte1)) || any(isnan(inte2)) || inte1(2)<=inte2(1) || inte2(2)<=inte1(1)
    inte=nan;return;
end

if inte1(1)<=inte2(1)
    inte(1)=inte2(1);
else
    inte(1)=inte1(1);
end

if inte1(2)<=inte2(2)
    inte(2)=inte1(2);
else
    inte(2)=inte2(2);
end

end