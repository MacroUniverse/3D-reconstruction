%通过三条底边与三个顶角解三棱锥
%采用唯一解(或者无解)函数的二分解法
%支持的pmd范围:
%目前只支持顶角小于45度的pmd,如果要升级,
%修改pmd021inte中的f1函数,增加L>=crit的情况
%如果底角刚好等于90度,一定无解

function L123=pmd021solve(pmd0,N)

%目前只支持顶角小于45度的pmd,如果要升级,
%修改pmd021inte中的f1函数,增加L>=crit的情况
if max(pmd0(4,:))>pi/4
    error('max(pmd0(4,:))>pi/4')
end

loop=20;%这里设置二分法循环次数




inte=pmd021inte(pmd0,N);%函数所有定义域

%从inte中抽取单解域inte1,可能为nan
inte1=onesolveinte(inte,pmd0,N);

if isnan(inte1(1))
    L123=nan(1,3);return
end


%解单解域(一种path的单解域最多1个)
x=devide2(inte1(1),inte1(2),loop,pmd0,N);

[~,L123]=pmdtrial(pmd0,x,N);

end

