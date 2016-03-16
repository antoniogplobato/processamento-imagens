%Antonio Gonzalez Pastana Lobato
%Breno Serrano de Araujo
%
%First Homework of Digitales Video
%
%apply_3D_LUT Function
%
%This function performs a transformation in a image, that maps the each color of
%every pixel to the value stored in the color cubes that are indexed by the red,
%green and blue values of the pixel

function [img_rec] = apply_3D_LUT(img_log, lut_R, lut_G, lut_B)
	ajuste = (2^16 - 1)/16;
	img_log = double(img_log);
	img_log = img_log ./ ajuste;
	img_log = img_log + 1;
	%This first part of the code maps the values between 0 and 65535 of the image
	%into the interval of 1 and 17, in order to be able to index the color cubes 
	[m,n,d] = size(img_log);
	img_rec = zeros(m,n,d);
	img_rec(:,:,2) = interp3(lut_R, img_log(:,:,1), img_log(:,:,2), img_log(:,:,3));
	img_rec(:,:,1) = interp3(lut_G, img_log(:,:,1), img_log(:,:,2), img_log(:,:,3));
	img_rec(:,:,3) = interp3(lut_B, img_log(:,:,1), img_log(:,:,2), img_log(:,:,3));
	%In this part the values of the pixels colors (red, green an blue) are determined
	%by the mapping into the respective color cube. Since it is impossible to store a
	%mapping for every combination of color values, the value is determined by a interpolation
	%of the closest values stores in the cube. This is done by the interp3 function
	%Here the axes are exchanged due to matlab meshgrids
	img_rec = img_rec .* (2^16 - 1);
	img_rec = uint16(img_rec);
	%Here the values are scaled and converted to int16 type in order to save the image
end