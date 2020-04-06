% 初始化Lerr2.mat 和 begin_cams.mat
function reset3D

Lerr2=cell(100,1);
DL=nan(100,1);
Hs=cell(100,1);
save Lerr2 Lerr2 DL Hs

cams=cell(100,1);
mni=cell(100,1);
sigma=nan(100,1);
save begin_cams cams mni sigma

end