%新的mn坐标的定义(x轴不变, y轴倒置,且单位长度与一像素相对应)
function mn=mn_old2new(mn,cam)

mn=[mn(:,2) -mn(:,1)]; %绕z轴顺时针旋转pi/2
nx=cam(6,1);
mn=mn*nx;

end