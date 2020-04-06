%修改后的相机工具箱自动取点调试


load H50_1_corners
h=imread('H50_1.tif');
imshow3(h);

cam=setcam('H50');
[m,n]=spatial2mn(x,y,cam);
scatter(m(:),n(:));