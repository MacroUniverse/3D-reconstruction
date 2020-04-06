function varargout=mcut(size,Ns)

dims=numel(size);
subs=cell(1,dims);

for ii=1:dims
   subs{ii}=f(size(ii),Ns(ii));
end
varargout=subs;

end

function sub=f(size,N)
if mod(size,N)==0
   n=size/N;
   sub=(0:N)*n+1;
else
   n=fix(size/N);
   rem=mod(size,n);
   sub=zeros(1,N); sub(1)=1;
   
   for ii=2:rem+1
      sub(ii)=sub(ii-1)+n+1;
   end
  for ii=rem+2:N+1
     sub(ii)=sub(ii-1)+n;
  end
  
  
end
end
