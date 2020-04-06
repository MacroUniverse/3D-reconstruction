%begin系列总程序:从含有棋盘的相片中确定其他点的坐标
%
%
%步骤:
%
%0.矫正相机. 用image aquisition toolbox获取相片,储存为calib.mat中的四维相片数组calib.
%用电脑图片浏览器剔除模糊的相片, 然后修改相片序号. 把current folder调到只装有calib相片的文件夹
%运行calib的GUI, 分别操作Image Names, Read Image, Extract grid corners, calibration, Recomp Corners,
%calibration, analysis error, Save.在setcam程序中修改焦距(矫正报告中的fc),在spatial2mn程序中修改
%相片中心(报告中的cc).
%
%1.用acquisition toolbox及矫正好的H50获取相片,用imsave脚本命名为begin1,begin2....,存入
%"aquisition新相片"文件夹用电脑图片浏览器剔除模糊的相片,然后修改序号
%(若不是第一次,后面的序号接着已有的序号继续)
%
%2.把current folder调到"acquisition新相片"文件夹, 打开calib的GUI,分别操作
%  Image Names, Read Image, Load, Undistort Image菜单, 生成新的相片 begin_rect1,begin_rect2...
%并存入"传递点1"文件夹
%
%3.矫正前的相片删除,重新启动calib的GUI,取begin_rect系列上的棋盘格点
%  (将会自动生成begin_rect1_corners.mat等格点数据mat文件), 关闭calibGUI,
%  用corner_data_process('begin_rect',n1:n2)函数处理上述mat文件(从序号n1到序号n2)
%  
%4.用featurepoints(n1:n2)函数取图片的特征点
%
%本程序运行过程中, 如有操作错误, 在任意的input中输入'err'字符串即可
%
%
%%Lerr2是专门用来储存通过各点的射线的元胞数组, 每个序号的点占一个元胞 , 每个元胞是N*9的数组
%N对应直过该点直线的条数, 每行储存一条直线.格式为: 
%[ px,py,pz,ex,ey,ez, perr, angerr, nth];(前六个是6参数射线, perr起点误差, angerr角误差,
%nth来源相片的序号.

function begin(N)%N是所有要处理的相片序号

load Lerr2 Lerr2 
load begin_cams cams sigma mni
ND=size(mni,1);

%1.根据棋盘点阵数据, 确定相机位置

for ii=N %ii是当前处理的相片序号
%(其间有画图确认,误差报告等程序,保证结果的正确性)
%[cams{ii},sigma(ii,1)]=board2cam(ii);   %%暂时关闭%%%%%%%%%%

end

save begin_cams cams sigma -append


%2.根据特征点(featurepoints)以及上面生成的相机位置生成(补充)Lerr2数组

for ii=1:ND%ii:相片的序号
    if isempty(mni{ii})
        continue
    end
    NL=size(mni{ii},1);
    for jj=1:NL%NL:线的条数
        L=mn2Lloc(mni{ii}(jj,[1 2]),cams{ii});
        perr=sigma(ii);%相机位置平均误差
        angerr=perr/vmag(cams{ii}(4,:));%相机角度误差
        Dname=mni{ii}(jj,3);%点的序号
        Lerr2{Dname}=[Lerr2{Dname};  L, perr, angerr, ii ];
    end
end

%计算交点
for ii=1:size(Lerr2,1)
    if size(Lerr2{ii},1)>2
        [DL(ii,:),Hs{ii}]=Ln2P(Lerr2{ii});
    end
end


save Lerr2 Lerr2 DL Hs -append

end