%pmd02pmd1数值解初始定义域
function xdom=pmd02xdom(pmd0)
P1=pmd0(1,:);
P2=pmd0(2,:);
B12=vmag(P1-P2);
ang12=pmd0(4,1);
xdom=[0 B12/sin(ang12)];
end