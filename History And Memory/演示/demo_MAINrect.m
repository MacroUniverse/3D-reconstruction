cam=setcam;
names={'1.jpg','2.jpg'};
rmns=imag2rmns(names,cam,1,1);
[o,h]=rmns2o(rmns,cam);
scatter3(o(:,1),o(:,2),o(:,3))
