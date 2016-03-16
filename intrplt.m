%Antonio Gonzalez Pastana Lobato
%Breno Serrano de Araujo
%
%Second Homework of Digitales Video
%
%intrplt Function
%
%This function finds an undefined value of a matrix by interpolating with
%the nearest values of the coordinates parameters. It can be used in images
%to find the color values of undefined grid values. This function was implemented
%to accept both scalars as well as matrices as input

function [intrpltval] = intrplt(img, y, x, intrpltalg)
	[mi,ni,d] = size(img);
	img = double(img);
	%here we check if the input values are consistents, that is, if
	%they have the same size
	if size(x) == size(y),	
		[mx,nx] = size(x);
		[my,ny] = size(y);
		intrpltval = zeros(mx,nx,d);
		if strcmp(intrpltalg, 'nearestneighbor') == 0,
			for i = 1:d,
				intrpltval(:,:,i) = interp2(img(:,:,i), y, x, 'nearest');
			end
		elseif strcmp(intrpltalg, 'bilinear') == 0,
			for i = 1:d,
				intrpltval(:,:,i) = interp2(img(:,:,i), y, x, 'linear');
			end
		%here we check which interpolation method is desired and perform
		%the interpolation with the help of interp2 from the mathematical
		%toolbox. Note that the interpolation is done for all colors
		else,
			disp('invalid input');
			intrpltval = 0;
		end
	else,
		disp('invalid input');
		intrpltval = 0;		
end