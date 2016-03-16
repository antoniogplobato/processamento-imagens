%Antonio Gonzalez Pastana Lobato
%Breno Serrano de Araujo
%
%First Homework of Digitales Video
%
%demosaic Function
%
%This function does a simple bipolar interpolation in order to
%reconstruct the full colored image from the one after the 
%bayer filter. It does that by determining the color of non defined
%pixels with the mean value of its neighbors with the determined value
%of the color

function [img] = demosaic(img_bayer)
	[m,n] =	size(img_bayer);
	red = zeros(m,n);
	green = zeros(m,n);
	blue = zeros(m,n);
	green(1:2:m,2:2:n) = img_bayer(1:2:m,2:2:n);
	green(2:2:m,1:2:n) = img_bayer(2:2:m,1:2:n);
	red(1:2:m,1:2:n) = img_bayer(1:2:m,1:2:n);
	blue(2:2:m,2:2:n) = img_bayer(2:2:m,2:2:n);
	%This step sets 3 matrices with the determined values of the colors,
	%leaving zeros on the other positions

	greenFilter = imfilter(green, [0 1 0; 1 0 1; 0 1 0]);
	greenFilter = greenFilter ./ 4;
	%Here the values of the non determined green pixels are obtained by adding
	%the green values in the position of the second parameter of the imfilter
	%function, then divided to obtain the mean value

	redFilterA = imfilter(red, [1 0 1; 0 0 0; 1 0 1]);
	redFilterA = redFilterA ./ 4;
	%Here some values of the non determined red pixels are obtained by adding
	%the red values in the position of the second parameter of the imfilter
	%function, then divided to obtain the mean value
	redFilterB = imfilter(red, [0 1 0; 1 0 1; 0 1 0]);
	redFilterB = redFilterB ./ 2;
	%Here the rest of the values of the non determined red pixels are obtained by adding
	%the red values in the position of the second parameter of the imfilter
	%function, then divided to obtain the mean value

	blueFilterA = imfilter(blue, [1 0 1; 0 0 0; 1 0 1]);
	blueFilterA = blueFilterA ./ 4;
	%Here some values of the non determined blue pixels are obtained by adding
	%the blue values in the position of the second parameter of the imfilter
	%function, then divided to obtain the mean value
	blueFilterB = imfilter(blue, [0 1 0; 1 0 1; 0 1 0]);
	blueFilterB = blueFilterB ./ 2;
	%Here the rest of the values of the non determined blue pixels are obtained by adding
	%the blue values in the position of the second parameter of the imfilter
	%function, then divided to obtain the mean value

	img = zeros(m,n,3);

	img(:,:,1) = red + redFilterA + redFilterB;
	img(:,:,2) = green + greenFilter;
	img(:,:,3) = blue + blueFilterA + blueFilterB;
	%Here the before no determied values are combined with the determined values of
	%the bayer fiter to form the full colored picture

	img = img .* (2^8 - 1);
	%Finally, the image is scaled to the size of 0-255

end