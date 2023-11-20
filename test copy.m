% K-Means Clustering
clc;
clear all;

subplot(2,2,1)
im = imread('img.png');
imshow(im)
title('a')

subplot(2,2,2)
imhist(im)
title('b')

% performing histogram equalization
subplot(2,2,3)
J = histeq(im);
imshow(J)
title('c')

subplot(2,2,4)
imhist(J)
title('d')

%Remove gaussian noise (IE random noise in image)
subplot(2,1,1)
imshow(J)
title('Image after histogram equalizaton')

% Degree of smoothin set it to be larger than the variance of the noise
subplot(2,1,2)
patch = imcrop(J,[170, 35, 50 50]);
patchVar = std2(patch)^2;
DoS = 2*patchVar;
% apply bilateral filter
I = imbilatfilt(J,DoS);
imshow(I)
title(['Degree of Smoothing: ',num2str(DoS)])

subplot_tight(2,2,1, [0.1,0.1]);
imshow(I)
title('a')

subplot(2,2,2)
%perform k means clustering.
[L,Centers] = imsegkmeans(I,2);
B = labeloverlay(I,L);
imshow(B)
title('b')

% binary image
subplot(2,2,3)
BW = imbinarize(L);
imshow(BW)
title('c')

%apply convex hull method
l=imclearborder(BW);
l = bwareafilt(l,2);
l = imfill(l,'holes');
%imshow(l,[]);


subplot(2,2,4)
k=bwconvhull(l,'objects');
imshow(k);
title('d')


%Threshhold Method
clc;
close all;
imtool close all;
workspace;
format long g;
format compact;
fontSize = 10;

userpath (’C: / Users/Math6346CovidProjectData fullFileName = fullfile ( ’ 00006473. png ’ );grayImage = imread(fullFileName );[ rows , columns , numberOfColorBands ] = size(grayImage);if numberOfColorBands > 1% It’ s not really gray scale like we expected % Convert it to gray scale by taking only the green channel .grayImage = grayImage ( : , : , 2 ) ; % Take green channel .end
% Display the original gray scale image .subplot ( 1 , 2 , 1 ) ;imshow( grayImage , [ ] ) ;axis on ;title ( ’Original Grays scale Image ’ , ’FontSize’, fontSize) ;
% Enlarge figure to full screen .set ( gcf , ’Units’ , ’ Normalized ’ , ’ OuterPosition ’ , [ 0 0 1 1 ] ) ;% Give a name to the title bar .set ( gcf , ’Name ’ , ’Demo by ImageAnalyst ’ , ’ NumberTitle ’ , ’ Of f ’ )drawnow;% Let’s compute and display the histogram .
[ pixelCount , grayLevels ] = imhist( grayImage ) ;% The first and last bin of pixelCount are so huge that it suppresses
% of the rest of the histogram when plotted. Zero out these bins so 
pixelCount( 1 ) = 0;pixelCount(end) = 0;subplot( 1 , 2 , 2 );bar( grayLevels , pixelCount , ’BarWidth ’ , 1 , ’ FaceColor ’ , ’b ’ );grid on ;title(’Histogram of Original Image’, ’FontSize’ , fontSize);xlim([0 grayLevels(end)]) ; % Scale x axis manually .% Threshold (binarize) the image us ing OTSU’ s methodlevel = graythresh( grayImage );grayImage = imbinarize( grayImage , level);img = imread ( ’ 00006473. png ’ );imshowpair( img, grayImage , ’montage’);subplot( 1, 2, 1);imshow(img);title(’Original Image’ , ’FontSize’ , fontSize) ;subplot( 1, 2, 2 );imshow(grayImage);title( ’Segmented Image us ing OTSU method ’ , ’ FontSize ’ , fontSize) ;
binaryImage = imclearborder(−grayImage );binaryImage = imfill( binaryImage , ’holes’ );
SE = strel( ’disk’ , 2 );a = imopen( binaryImage , SE);b=bwconvhull( a , ’ objects’ );

subplot( 1 , 3 , 1 );imshow(binaryImage );title( ’ Delete outer body’ ,’FontSize’ , fontSize);subplot( 1 , 3 , 2 );imshow( a );title(’Morphological Operations’, ’FontSize ’ , fontSize);subplot ( 1 , 3 , 3 );imshow(b);title(’ Smoothing ’ , ’ FontSize ’ , fontSize);

