%演示脚本,生成一个立方体,围绕z轴转动

%设置参数

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%相机参数
cam=setcam(4,-4,2,'cart');
circl=2; %转动圈数
Axis=vunit([1 1 1]); % 转动轴
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

R=cam(6,1)/2; L=-R; U=cam(6,2)/2; D=-U;
interval=[L R D U]; 
R=[0 0 0; 1 0 0; 1 1 0; 0 1 0; 0 0 1; 1 0 1; 1 1 1; 0 1 1]; %立方体矩阵


figure;
pause(1);

RR=zeros(size(R));%RR:旋转后的立方体矩阵

for alpha=0:pi/100:2*pi*circl
    [RR(:,1),RR(:,2),RR(:,3)]=turn(R(:,1),R(:,2),R(:,3),Axis,alpha); %围绕Axis轴旋转立方体
    mn=Dloc2mn(RR,cam); %投影RR立方体
    m=mn(:,1);
    n=mn(:,2);
  
    %连线
    a=[1 2 3 4 1 5 6 7 8 5 6 2 3 7 8  4]; 
    plot(m(a),n(a));
    
    %图像设置
    axis equal
    axis(interval);
    pause(1/60);
    hold off
end

