%Antonio Gonzalez Pastana Lobato
%Breno Serrano de Araujo
%
%Second Homework of Digitales Video
%
%resizeLDV Function
%
%This function can either increase or decrease the size of
%a image. It makes that, by creating a new grid, according
%to the size wanted, and interpolating its points regarding
%the original picture

function [newimg] = resizeLDV(oldimg, tardim, intrpltalg)
	ypixels = tardim(1);
	xpixels = tardim(2);
	[m,n,d] = size(oldimg);
	fatorX = m/xpixels;
	fatorY = n/ypixels;
	%here we calculate the factor that we have to multiplicate
	%the indexes of the new grid by, so it becomes on the same
	%range as the original picture
	newimg = zeros(xpixels, ypixels, d);
	matrizX = zeros(xpixels, ypixels);
	matrizY = zeros(xpixels, ypixels);
	matrizX = repmat((1:xpixels)'.*fatorX, 1, ypixels);
	matrizY = repmat((1:ypixels).*fatorY, xpixels, 1);
	%here we create matrices to perform each combination of
	%x's and y's possible, so that we can call the function
	%intrplt only once, with this matrices as input, and 
	%improve the overall timing performance
	newimg = intrplt(oldimg, matrizY, matrizX, intrpltalg);
end