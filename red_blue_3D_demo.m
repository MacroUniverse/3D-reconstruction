original = imread('cameraman.tif');
imshow(original);
text(size(original,2),size(original,1)+15, ...
    'Image courtesy of Massachusetts Institute of Technology', ...
    'FontSize',7,'HorizontalAlignment','right');

scale = 0.7;
J = imresize(original, scale); % Try varying the scale factor.

theta = 30;
distorted = imrotate(J,theta); % Try varying the angle, theta.
figure, imshow(distorted)

ptsOriginal  = detectSURFFeatures(original);
ptsDistorted = detectSURFFeatures(distorted);

[featuresIn   validPtsIn]  = extractFeatures(original,  ptsOriginal);
[featuresOut validPtsOut]  = extractFeatures(distorted, ptsDistorted);

index_pairs = matchFeatures(featuresIn, featuresOut);

matchedOriginal  = validPtsIn(index_pairs(:,1));
matchedDistorted = validPtsOut(index_pairs(:,2));

cvexShowMatches(original,distorted,matchedOriginal,matchedDistorted);
title('Putatively matched points (including outliers)');

