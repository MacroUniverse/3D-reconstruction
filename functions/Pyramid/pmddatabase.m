%pmd数据库,调试用
function [pmd0,pmd1,pmd]=pmddatabase(NO)


switch NO
case 1
P1 =[0 0 0];
P2 =[1 0 0];
P3=[2 1 0];
P=[0 5 5];
case 2 %case1 的拉长
P1=[0 0 0];
P2=[1 0 0];
P3=[2 1 0];
P=[0 10 10];
case 3 % 近似等边三角(有中断)
P1=[0 0 0];
P2=[1 0 0];
P3=[1/2 sqrt(3)/2 0];
P=[1/2 sqrt(3)/4 4];
case 4 %L1垂直 算不出算不出算不出算不出算不出算不出算不出算不出算不出算不出
P1=[0 0 0];
P2=[1 0 0];
P3=[0 2 0];
P=[0 0 5];
case 5  % 中断测试(L31与L1垂直) 算不出算不出算不出算不出算不出算不出算不出     
P1=[0 0 0];
P2=[2 0 0];
P3=[0 1 0];
P=[1 0 6];
case 6  % 中断测试
P1=[0 2 0];
P2=[0 0 0];
P3=[4 0 0];
P=[1 1 6];
case 7 % 等边三角
P1=[0 0 0];
P2=[1 0 0];
P3=[1/2 sqrt(3)/2 0];
P=[1/2 sqrt(3)/6 sqrt(47/3)];
case 8 %临界三棱锥 B23,B31分别与L3,L1垂直,路径为:[1 1(2) 1(2)]
           %L1=sqrt(3)/2 L2=2/sqrt(3) L3=1;
           %L12=sqrt(25/12-sqrt(3)) L23=1/sqrt(3) L31=1/2;
P1=[1/2 0 0];
P2=[0.2320508075688771 0.5286641240333653 0];
P3=[0 0 0];
ang=pi/6;
pmd0=[P1;P2;P3;ang ang ang]; 
pmd1=[P1;P2;P3;sqrt(3)/2,2/sqrt(3),1;ang,ang,ang];
pmd=0; return

    case 9 %实际程序中未知原因解不出的pmd
        P1=[0 1 3];
        P2=[3 0 0];
        P3=[1 3 1];
        P=[7.5 1.1 5];
    case 10 %最简单的pmd,用于坐标变换测试
        P1=[0 0 0];
        P1=vturn(P1,[1 0 0],pi/4);
        P2=[sqrt(2) sqrt(2) 0];
        P2=vturn(P2,[1 0 0],pi/4);
        P3=[-sqrt(2) sqrt(2) 0];
        P3=vturn(P3,[1 0 0],pi/4);
        P=[0 sqrt(2) 1];
        P=vturn(P,[1 0 0],pi/4);
    case 11 %牛顿法未知原因解不出
        P1=[7 4 0];
        P2=[-5 1 0];
        P3=[7 -3 0];
        P=[ 2.461944632308177   6.616788346476625  13.045745802752219];
        
otherwise
error('case dosn''t exist');        
end

v1=P1-P;
v2=P2-P;
v3=P3-P;
L1=vmag(v1);
L2=vmag(v2);
L3=vmag(v3);
ang12 =vang(v1,v2);
ang23=vang(v2,v3);
ang31=vang(v3,v1);
pmd0=[P1;P2;P3;[ang12,ang23,ang31]];
pmd1=[P1;P2;P3;[L1,L2,L3];[ang12,ang23,ang31]];
pmd=[P1;P2;P3;P];
end