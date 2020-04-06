%判断D是否在D1指向D2方向,若是,输出true(逻辑1),否则输出false(逻辑0)
%输入三个二维坐标点D1,D2,D(一条线上,D不在D1,D2之间)
%注意,输入的点中,D1,D2必须是实数向量,D可以是(inf,k)格式的远点


function iscorrect=vrect_modify(D1,D2,D)
x1=D1(1);y1=D1(2);
x2=D2(1);y2=D2(2);
x=D(1);y=D(2);

if isinf(D(1))%D为无穷远点(由于这时矢量根据k指向1,2象限,所以如果y2<y1,则不在1,2象限
    if y1==y2 %此时默认矢量为[-1,0,0]
        if x2>x1
        iscorrect=true;
        else
        iscorrect=false;
        end
    elseif y2>y1
       iscorrect=true;
    else
       iscorrect=false;    
    end
else %D为正常点
   if x1==x2
      iscorrect=(y-y1)*(y2-y1)>0;
   else
      iscorrect=(x-x1)*(x2-x1)>0;
   end
end


end