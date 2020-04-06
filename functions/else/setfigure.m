function setfigure(flag)

figure
switch flag
    case 'photo'
        axis on;
        axis([-1/2 1/2 -3/8 3/8]);
        grid off;
        hold on;
    case '3D'
        axis on;
        axis equal;
        grid on;
        hold on;
        view([25,40]);
    case 'N97'
        axis on;
        axis equal;
        axis([0 2592 0 1944])
        grid on;
        hold on;
    case 'N973'
        axis on;
        axis([0 2592 0 1944 -40 40]);
        grid on;
        hold on;
    case 'H50';
        axis equal
        axis([-424 424 -240 240]);
        view(0,-90);
        hold on;
        grid on;
end
end