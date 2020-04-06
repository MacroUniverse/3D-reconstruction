%鼠标取四个角点, 自动算出剩下的点
function corner_extractor(I,m,n)

if ndims(I)==3
    I=rgb2gray(I);
    I=double(I);
end

   figure; imshow(I/256)
   hold on   
   
   xy4=zeros(4,2);
   for ii=1:4
      xy=ginput(1);
      xy=cornerfinder(xy',I,41,41);
      scatter(xy(1),xy(2),'og');
      xy4(ii,:)=xy;
   end
 
   [x,y]=para_grid(xy4,m,n);
   scatter(x(:),y(:));

   
   xy2=cornerfinder([x(:)'; y(:)'],I,41,41);
   scatter(xy2(:,1),xy2(:,2));
   
end