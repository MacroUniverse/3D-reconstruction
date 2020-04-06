%3Dm3图片重新取点实验


%Ptri(:,:,1)=[-4 -1  0;    1  -1  0 ;  -2  3 0];
%Ptri(:,:,2)=[1   3  0;   -3  -2  0 ;   4 -3 0];
%Ptri(:,:,3)=[0   3  0;   -1  -3  0 ;   6  1  0];
%Ptri(:,:,4)=[4   3  0;   -4   3  0;    2  -4 0];
%save Ptri3Dmn3 Ptri

cam=setcam;
%for n=1:12
%    xy(sub(2),:,sub(1))=ginput(1);%请红点暂停输入sug=[] ,把相片调好,再执行
%end
%save xy3Dm3
load xy3Dm3

%for Ntri=1:4
%    for ii=1:3
%    mntri(ii,:,Ntri)=ginput2mn(xy(ii,:,Ntri),1944*4/3,1944,cam);
%    end
%end
%save mntri3Dm3 mntri