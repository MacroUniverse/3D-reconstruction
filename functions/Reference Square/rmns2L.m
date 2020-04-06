%通过格式rmns点阵求格式L
%目前还不能漏点

function L=rmns2L(rmns,cam)

N=numel(rmns);
L=cell(1,N);

for n=1:N
    rect=rmns{n}(1:4,:);
    cam=vrect(rect,cam);
    L{n}=mn2Lloc(rmns{n}(5:end,2:3),cam);
end

end