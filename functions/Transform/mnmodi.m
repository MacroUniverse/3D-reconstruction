function mn1=mnmodi(mn,al)
%设置四个线性系数;
mulxi=1.05;
mulm=1; k1=0.000;%3;
muln=1; k2=0.000;
%设置球面系数;
%al=32.01/180*pi;%适用于sc


if ndims(mn)==2;
    m=mn(:,1); n=mn(:,2);
    r=sqrt(m.^2+n.^2);
    Rdr=asin(r*sin(al))/al./r;
    for ii=1:size(mn,1)
        m(ii,:)=m(ii,:)*Rdr(ii);
        n(ii,:)=n(ii,:)*Rdr(ii);
    end
elseif ndims(mn)==3;
    m=mn(:,1,:); n=mn(:,2,:);
end


    m=mulxi*mulm*m+k1*n;
    n=mulxi*muln*n+k2*m;
    mn1=cat(2,m,n);
end