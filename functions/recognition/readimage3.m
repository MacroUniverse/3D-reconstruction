%彩色图片, 灰度图片, 和边界图片

rgb=imread('slintgrid.jpg');
gray=rgb2gray(rgb);
c=edge(gray,'canny');
figure
imshow(rgb)
figure
imshow(gray);
figure
imshow(c)