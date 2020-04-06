%立体相片
function imshow3(I)
s=size(I);
setfigure H50;  
X=[-s(2) s(2); -s(2) s(2)]/2; 
Y=[-s(1) -s(1); s(1) s(1)]/2;
Z=[0 0; 0 0];
h=surf(X,Y,Z);
colormap gray;
set(h,'CData',I,'FaceColor','texturemap');
%camproj perspective;
xlabel x; ylabel y;
end