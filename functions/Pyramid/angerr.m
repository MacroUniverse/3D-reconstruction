%一条射线的最大理论角误差公式计算
%只用到了cam中的最后一行

function     dtheta=angerr(dr,cam,mn)

xi=cam(6,3);

if nargin==2
tan=vmag([cam(6,1),cam(6,2)])*xi;
elseif nargin==3
tan=vmag(mn)*xi;
end
sec2=1+tan^2;
dtheta=dr/sec2/xi;

end