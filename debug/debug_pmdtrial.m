%pmdtrial的调试

pmd0=pmddatabase(7);
N=1;

X=pmd02xdom(pmd0);
X=linspace(0,X(2),1001);
Y=zeros(size(X));

for n=1:numel(X)
Y(n)=pmdtrial(pmd0,X(n),N);
end
plot(X,Y)
grid on
axis equal
