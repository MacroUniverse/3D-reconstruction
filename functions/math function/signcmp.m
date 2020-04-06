%(未完成)指出一个数组中与pm符号相同的元素
function [n]=signcmp(x,pm)

mark0=x==0;
markp=x>0;
markm=x<0;
if any(mark0)
    n=find(mark);
elseif pm>0&&any(markp)
    n=find(markp);
elseif pm<0&&any(markm)
    n=find(markm);
else 
    n=nan;
end

end

