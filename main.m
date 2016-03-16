%Antonio Gonzalez Pastana Lobato
%Breno Serrano de Araujo
%
%First Homework of Digitales Video
%
%Main Function

img = imread('corcovado.tiff');
img_bayer = bayermask(img);
imwrite(img_bayer, 'bayer_corcovado.bmp');
img_demosaic = demosaic(img_bayer);
img_demosaic = uint8(img_demosaic);
imwrite(img_demosaic, 'demosaic_corcovado.tiff');
%In this first part we make use of the bayermask function to perform the
%image mosaicking and the demosaic function for demosaicking

subplot(2,2,1);
imshow('corcovado.tiff');
title('corcovado');
subplot(2,2,3);
imshow('bayer_corcovado.bmp');
title('bayer corcovado bmp');
subplot(2,2,4);
imshow('demosaic_corcovado.tiff');
title('demosaic corcovado');
%Here we display the initial image, the image after mosaicking and the
%final image after demosaicking

input('press enter to the next exercise');

img_log = imread('img_log_standard_exposure.tif');
[lut_R,lut_G,lut_B]= read_3D_LUT('logC2rec709.cube');
img_rec = apply_3D_LUT(img_log, lut_R, lut_G, lut_B);
imwrite(img_rec, 'img_rec709_standard_exposure.tif');
%In this part of the code we use read_3D_LUT to get the cubes for each color
%and then apply them to the log image

subplot(1,2,1);
imshow('img_log_standard_exposure.tif');
title('img log standard exposure');
subplot(1,2,2);
imshow('img_rec709_standard_exposure.tif');
title('img rec709 standard exposure');
%Here we display the initial and final images

input('press enter to the next exercise');

img_log2 = imread('img_log_over_exposure.tif');

img_rec = apply_3D_LUT(img_log2, lut_R, lut_G, lut_B);
imwrite(img_rec, 'img_rec709.tif');

img_log_corrected = imoffset(img_log2, -0.2);
img_from_rec_corrected = imoffset(img_rec, -0.4);
imwrite(img_from_rec_corrected, 'img_rec709_from_rec709_corrected.tif');

img_from_log_corrected = apply_3D_LUT(img_log_corrected, lut_R, lut_G, lut_B);
imwrite(img_from_log_corrected, 'img_rec709_from_log_corrected.tif');
%In this last exercise we do the following 2 processes:
%1 - apply the offset to the log image and then change it into rec709
%2 - change the image into a rec709 image and then apply the offset

%In the next line we display all steps in between 
subplot(2,2,1);
imshow('img_log_over_exposure.tif');
title('img log over exposure');
subplot(2,2,2);
imshow('img_rec709.tif');
title('img rec709');
subplot(2,2,3);
imshow('img_rec709_from_log_corrected.tif');
title('img rec709 from log corrected');
subplot(2,2,4);
imshow('img_rec709_from_rec709_corrected.tif');
title('img rec709 from rec709 corrected');