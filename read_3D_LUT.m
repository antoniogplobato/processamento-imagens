%Antonio Gonzalez Pastana Lobato
%Breno Serrano de Araujo
%
%First Homework of Digitales Video
%
%read_3D_lut Function
%
%This function reads a 3D LUT and returns the cube for each color,
%that is, it returns a value for each color determined by
%the 3 color coordinates of the original pixel, which can preserve
%any correlation of the color in the original picture in the mapping that
%forms the new picture

function [lut_R, lut_G, lut_B] = read_3D_lut(LUT_name)
	lut = dlmread(LUT_name, ' ', 4, 0); %here is used a matlab function that forms a matrix according to the separator in a text file
	[m,n] = size(lut);
	tamanho = m^(1/3); %Since is a 3D LUT, the size of the cube is determined by the cube root of the number of lines
	tamanho = uint8(tamanho); %conversion to use the value in the function reshape
	lut_R = reshape(lut(:,1), [tamanho, tamanho, tamanho]);
	lut_G = reshape(lut(:,2), [tamanho, tamanho, tamanho]);
	lut_B = reshape(lut(:,3), [tamanho, tamanho, tamanho]);
	%In this step the cube is formed using the function reshape, that
	%change the side of the matrix, in this case by transforming a column vector
	%in a cube, considering the first index of the cube the one that changes faster, as
	%in the 3D LUT specification
end
