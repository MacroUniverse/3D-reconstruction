%二元函数定点梯度
%进入文件以修改函数参数与自变量

function grad=grad(L1,L2,t1,t2)

step=0.001;
dydt1=(dist_t1t2(L1,L2,t1+step,t2)-dist_t1t2(L1,L2,t1,t2))/step;
dydt2=(dist_t1t2(L1,L2,t1,t2+step)-dist_t1t2(L1,L2,t1,t2))/step;
grad=[dydt1,dydt2];

end