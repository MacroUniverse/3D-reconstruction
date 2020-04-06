function int=tfrect(x,y)
N=numel(x);
n=round(N/16);
x=[x(:); x(:)]; y=[y(:); y(:)];

jj=1;linemid=zeros(4,1);
trigger=0;

for ii=1+n:N+4*n
v1=[x(ii)-x(ii-n),y(ii)-y(ii-n)];
v2=[x(ii+n)-x(ii),y(ii+n)-y(ii)];
cosine=(v1(1)*v2(1)+v1(2)*v2(2))/sqrt((v1(1)^2+v1(2)^2)*(v2(1)^2+v2(2)^2));


if trigger==0&&cosine<0.987%0为未触发状态
    trigger=1;%1为等待触发状态
elseif trigger==1&&cosine>0.987
    trigger=2;%2为触发状态
    nn=1;
elseif trigger==2&&cosine>0.987
    nn=nn+1;
elseif trigger==2&&cosine<0.987
    linemid(jj)=ii-round(nn/2);
    if jj==4; break; end
    jj=jj+1; trigger=1;
end

end

e=zeros(4,2); r=zeros(4,1);

for ii=1:4
x1=x(linemid(ii)-n:linemid(ii)+n); 
y1=y(linemid(ii)-n:linemid(ii)+n);
[e(ii,:),r(ii),d]=linfit(x1,y1);
end

e=[e;e(1,:)]; r=[r; r(1)];
int=zeros(4,2);
for ii=1:4
    int(ii,:)=([e(ii,1) e(ii,2) ; e(ii+1,1) e(ii+1,2)]\[r(ii);r(ii+1)])';
end


end