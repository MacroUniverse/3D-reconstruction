%解三棱锥的三条侧棱,输出三维数组,第三维长是解的个数
%无解输出nan

function pmd1=pmd02pmd1(pmd0)


% 找到侧棱L1的7个解,无解补nan
L123=nan(7,3);
for n=1:7 %最多可能有7个解
    L123(n,:)=pmd021solve(pmd0,n);
end


if all(isnan(L123(:,1))) %无解
    pmd1=nan;return
else  %有解
    mark=isfinite(L123(:,1));
    L123=L123(mark,:);
end


% 最终有N个pmd1解;
N=size(L123,1);
pmd1=repmat([pmd0(1:3,:); [0 0 0]; pmd0(4,:)],[1,1,N]);
for n=1:N %元胞赋值
    pmd1(4,:,n)=L123(n,:);
end