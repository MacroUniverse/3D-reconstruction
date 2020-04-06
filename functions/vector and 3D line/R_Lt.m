%求射线上一点P输入直线L(六参数),以及t,
%L可以满足size=[N,6],t可以满足size=[N,1],每一行的L,t对应

function R=R_Lt(L,t)

N=size(L,1);
if N==1
  R=L(1:3)+L(4:6)*t;
elseif N>1
  R=L(:,1:3)+repmat(t,1,3).*L(:,4:6);
end

end