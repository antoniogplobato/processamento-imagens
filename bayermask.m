%Antonio Gonzalez Pastana Lobato
%Breno Serrano de Araujo
%
%First Homework of Digitales Video
%
%bayermask Function

%This function applies the bayer filter selecting one of the
%colors (RGB) to be placed in the pixel position, according
%to its position in the bayer filter, reducing a 
% m,n,3 matrix to a m,n,1 matrix

function [img_bayer] = bayermask(img)
	[m,n,d] = size(img);
	img_bayer = zeros(m,n);
	img_bayer(1:2:m,2:2:n) = img(1:2:m,2:2:n,2); %selects the green color to pixels in odd lines, and even columns
	img_bayer(2:2:m,1:2:n) = img(2:2:m,1:2:n,2); %selects the green color to pixels in even lines, and odd columns
	img_bayer(1:2:m,1:2:n) = img(1:2:m,1:2:n,1); %selects the red color to pixels in odd lines, and odd columns
	img_bayer(2:2:m,2:2:n) = img(2:2:m,2:2:n,3); %selects the blue color to pixels in even lines, and even columns
	img_bayer = img_bayer ./ (2^8 - 1);	%scales the image to values between 0 and 1
end