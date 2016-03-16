%Third Homework of Digitales Video
%
%Main Function

esquerda = imread('Links.png');
direita = imread('Rechts.png');
%here we load the images
b = 8;
s = 80;
%here we set the parameters
imgD = dmap(esquerda, direita, b, s);
imwrite(imgD, 'dist_b8_s80.png');
%here we save the image
b = 16;
s = 80;
%here we change the parameters
imgD = dmap(esquerda, direita, b, s);
imwrite(imgD, 'dist_b16_s80.png');
%here we save the image
b = 4;
s = 80;
%here we change the parameters
imgD = dmap(esquerda, direita, b, s);
imwrite(imgD, 'dist_b4_s80.png');
%here we save the image

subplot(1,3,1);
imshow('dist_b8_s80.png');
title('dist_b8_s80');
subplot(1,3,2);
imshow('dist_b16_s80.png');
title('dist_b16_s80');
subplot(1,3,3);
imshow('dist_b4_s80.png');
title('dist_b4_s80');
%here we display the images