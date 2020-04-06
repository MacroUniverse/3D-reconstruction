%画出一条二维直线, 参数分别是e:法向量, l:离原点距离
%r是直线的一半长度, 可不填, 默认2000;
function plotL(e,l,r)
x0=e(1)*l; y0=e(2)*l;
t=[-e(2) e(1)];
if nargin==2
   r=2000;
end
   plot([x0+t(1)*r x0-t(1)*r], [y0+t(2)*r y0-t(2)*r]);
end