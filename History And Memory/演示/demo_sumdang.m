%探索三维函数最值法  算tria2cam
%结果被认为太复杂了....
A=[0 0 0];
B=[1 0 0];
C=[0 1 0];
[x,y]=ndgrid(-0.5:0.01:1.5,-0.5:0.01:1.5);
z=1;
s=zeros(size(x));
for nx=1:size(x,1)
    for ny=1:size(y,2)
        P=[x(nx,nx),y(nx,ny),z];
        s(nx,ny)=5*sumdang(A,B,C,P,pi/4,pi/3,pi/4);
    end
end


surf(x,y,s)
axis equal
shading interp
light