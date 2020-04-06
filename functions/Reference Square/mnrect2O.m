%通过格式mnrect点阵求格式O

function O=rmns2O(mnrect,cam)

N=numel(mnrect); %相片数
L=cell(N);
for n=1:N
    
    rect=mnrect{n}(1:4,:);
    cam=vrect(rect,cam);
    L{n}=mn2Lloc(mnrect{n}(5:end,:),cam);
end


end