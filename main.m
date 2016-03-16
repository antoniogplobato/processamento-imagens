img = imread('corcovado.tiff');
% img2 = resizeLDV(img, [7000 5000], 'bilinear');
% img2 = uint8(img2);
% imwrite(img2, 'teste.tiff');

% trafomat = afftrafomatrix('tu0 tv0 theta150 tu0 tv0');
% trafomat = afftrafomatrix('tu10 tv-5 theta45.3 tu-10 tv5');
trafomat = afftrafomatrix('hu0.5 tv0 theta0 tu0 tv0');
% trafomat = afftrafomatrix('tu200 tv200 theta0 tu0 tv0');
img3 = afftrafo(img, trafomat, 'bilinear');
img3 = uint8(img3);
imwrite(img3, 'teste2.tiff');
imshow('teste2.tiff');