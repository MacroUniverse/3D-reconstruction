%造成折线的某个切面

t=linspace(0,0.0065,100);
z=linspace(0.098,0.102,100);
dir=vunit([0.0035 0.0051]);
E=zeros(numel(t),numel(z));
x0=0.1; y0=0.1;
for ii=1:numel(t)
    for jj=1:numel(z)
        if ii==1 && jj==50
            1;
        end
        xy=[x0+dir(1)*t(ii) , y0+dir(2)*t(ii)];
        E(ii,jj)=deturntrial(V1,V2,z(jj),xy);
    end
end

[t,z]=ndgrid(t,z);
figure
surf(t,z,E);