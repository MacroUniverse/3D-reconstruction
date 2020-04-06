%多项式求导
function p1=polydiff(p)
N=length(p)-1;
p=p(1:N);
C=N:-1:1;
p1=C.*p;
end