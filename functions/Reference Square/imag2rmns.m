%从真实相片上面取点,生成rmns数组
%输入元胞数组imagenames,里面是已经存入目录的相片名称

function rmns=imag2rmns(imagnames,cam,Len13,Len24)

alpha=cam(6,1);
beta=cam(6,2);

N=numel(imagnames);
rmns=cell(1,N);
for n=1:N
name=imagnames{n};
h=imread(name);
imshow(h);
mn=ginput;
mn(:,1)=(mn(:,1)/size(h,2)-1/2)*alpha;
mn(:,2)=-(mn(:,2)/size(h,1)-1/2)*beta;
Np=length(mn)-4;
head=[Len13;Len24;0;0;(1:Np)'];
rmns{n}=[head,mn];
end

end
