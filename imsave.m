%把思维矩阵按照bmp格式储存在当前路径
%N是要储存的相片序号数组

function imsave(Im4D,pre_name)
Nphoto=size(Im4D,4);
for ii=1:Nphoto
I=Im4D(:,:,:,ii);
imwrite(I,[pre_name num2str(ii) '.bmp'],'bmp');
end
end