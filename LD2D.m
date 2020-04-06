%找到L上距离点D最近的一点
%size(L)=[N,6];
%size(D)=[N,3]或者[1,3];

function D=LD2D(L,D)

NL=size(L,1); ND=size(D,1);

if (ND~=NL)&&(NL==1)
    D=repmat(D,NL,1);
else
    error('%size(L)=[N,6]; size(D)=[N,3]或者[1,3];');
end


s=dot((D-repmat(L(:,1:3),N,1))',L(:,4:6)');
D=R_Lt(L,s');

end