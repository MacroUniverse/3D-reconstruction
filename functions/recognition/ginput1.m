%图像中的点对应的数组位置
function varargout=ginput1(n)
   if nargout==1
       varargout={fliplr(round(ginput(n)))};
   
   elseif nargout==2
       [x,y]=ginput(n);
       x1=round(y);  y1=round(x);
       varargout={x1,y1};
   elseif nargout==3
       [x ,y ,button]=ginput(n);
       x1=round(y);
       y1=round(x);
       varargout={x1,y1,button};
   end
end