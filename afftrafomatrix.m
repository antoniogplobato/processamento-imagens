%Antonio Gonzalez Pastana Lobato
%Breno Serrano de Araujo
%
%Second Homework of Digitales Video
%
%afftrafomatrix Function
%
%This function reads a string as input parameter and
%calculates a transformation matrix, that performs the
%changes specified in the string. The possibilities are:
%translation, rotation, scaling and shear

function [trafomat] = afftrafomatrix(trafostr)
	trafomat = eye(3);
	parametros = strsplit(trafostr, ' ');
	[m,n] = size(parametros);
	for i = 1:n,
		palavra = char(parametros(i));
		matrizAux = eye(3);
		%here we check the words of the string and
		%attribute the values of the desired transformation
		%to a new matrix
		if findstr(palavra, 'tu') ~= 0,
			aux = str2double(palavra(3:end));
			matrizAux(3,1) = aux;
		elseif findstr(palavra, 'tv') ~= 0,
			aux = str2double(palavra(3:end));
			matrizAux(3,2) = aux;
		elseif findstr(palavra, 'theta') ~= 0,
			aux = str2double(palavra(6:end));
			matrizAux(1,1) = cosd(aux);
			matrizAux(1,2) = sind(aux);
			matrizAux(2,1) = -sind(aux);
			matrizAux(2,2) = cosd(aux);
		elseif findstr(palavra, 'su') ~= 0,
			aux = str2double(palavra(3:end));
			matrizAux(1,1) = aux;
		elseif findstr(palavra, 'sv') ~= 0,
			aux = str2double(palavra(3:end));
			matrizAux(2,2) = aux;
		elseif findstr(palavra, 'hu') ~= 0,
			aux = str2double(palavra(3:end));
			matrizAux(1,2) = aux;
		elseif findstr(palavra, 'hv') ~= 0,
			aux = str2double(palavra(3:end));
			matrizAux(2,1) = aux;
		else,
			disp('invalid input');
		end
		trafomat = trafomat * matrizAux;
		%here we multiply the overall transformation matrix,
		%by the current transformation, that way, we make the
		%transformations in the same order as in the input
		%string
end