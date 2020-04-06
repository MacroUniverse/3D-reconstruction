function gray=segcriti(gray,M,N)

N1=size(gray,1); N2=size(gray,2);
m=floor(N1/M);
n=floor(N2/N);
M=floor(size(gray,1)/m);
N=floor(size(gray,2)/n);

for ii=1:M
for jj=1:N
    seg=gray(m*(ii-1)+1:m*ii,n*(jj-1)+1:n*jj);    
    gray(m*(ii-1)+1:m*ii,n*(jj-1)+1:n*jj)=graycriti(seg,0.1,1);
end
end

for ii=1:M
   seg=gray(m*(ii-1)+1:m*ii,n*N+1:end);
   gray(m*(ii-1)+1:m*ii,n*N+1:end)=graycriti(seg,0.1,1);
end

for jj=1:N
    seg=gray(m*M+1:end,n*(jj-1)+1:n*jj);
    gray(m*M+1:end,n*(jj-1)+1:n*jj)=graycriti(seg,0.1,1);
end

seg=gray(m*M+1:end,n*N+1:end);
gray(m*M+1:end,n*N+1:end)=graycriti(seg,0.1,1);

end