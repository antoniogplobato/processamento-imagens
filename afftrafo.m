%Antonio Gonzalez Pastana Lobato
%Breno Serrano de Araujo
%
%Second Homework of Digitales Video
%
%afftrafo Function
%
%This function performs a transformation on a image and gives the
%transformed image as output. The paramaters of the transformation are
%determined by the transformation matrix calculated in the afftrafomatrix
%function 

function [imgtrafd] = afftrafo(img, trafomat, intrpltalg)
	[xpixels,ypixels,d] = size(img);

	vertices = zeros(4,3);
	vertices(1,:) = [1 1 1]*inv(trafomat);
	vertices(2,:) = [1 ypixels 1]*inv(trafomat);
	vertices(3,:) = [xpixels 1 1]*inv(trafomat);
	vertices(4,:) = [xpixels ypixels 1]*inv(trafomat);
	%here we perform the inverse transformation on the four
	%edges of the picture, to discover the size of the new
	%grid of the transformated image
	Xmax = max(vertices(:,1));
	Xmin = min(vertices(:,1));
	Ymax = max(vertices(:,2));
	Ymin = min(vertices(:,2));
	%here we find the maximun and mininum value of the x and y
	%coordinates of the new image
	nX = size(Xmin:Xmax,2);
	nY = size(Ymin:Ymax,2);
	imgtrafd = zeros(nX, nY,d);

	matrizX = zeros(nX, nY);
	matrizY = zeros(nX, nY);
	matrizX = repmat((Xmin:Xmax)', 1, nY);
	matrizY = repmat((Ymin:Ymax), nX, 1);
	%here we create once more this indexes matrices, in order to calculate
	%all combinations of x and y at once in the intrplt function and get a
	%faster implementation
	matrizAux = zeros(nX*nY, 1);
	matrizAux(:) = 1;
	resposta = zeros(nX*nY,3);
	resposta = [matrizX(:) matrizY(:) matrizAux(:)] * trafomat;
	%here we multiply all the possible combinations of x and y, as well as the
	%bias value of 1, by the transformation matrix in order to find the indexes
	%of the new matrix 
	matrizX = reshape(resposta(:,1),nX, nY);
	matrizY = reshape(resposta(:,2),nX, nY);
	%here we reshape the matrices so we can get the new image in one line of code
	%with the intrplt
	imgtrafd = intrplt(img, matrizY, matrizX, intrpltalg);

	%the way this function was implemented, it calculates the size of the new grid in order
	%to optimize the space and give the minimum size possible. When the transformation matrix
	%has translating elements, represented by its positions 3,1 and 3,2, the blank values are
	%discarted due to this minimum space representation. The following lines checks if there are
	%translation elements and add the blank space in its right position
	if trafomat(3,1) ~= 0,	
		ajusteH = zeros(size(imgtrafd,1),abs(uint8(trafomat(3,1))),3);
		if trafomat(3,1) > 0,
			imgtrafd = [ajusteH imgtrafd];
		elseif trafomat(3,1) < 0,
			imgtrafd = [imgtrafd ajusteH];
		end
	end
	if trafomat(3,2) ~= 0,
		ajusteV = zeros(abs(uint8(trafomat(3,2))),size(imgtrafd,2),3);
		if trafomat(3,2) > 0,
			imgtrafd = [ajusteV; imgtrafd];
		elseif trafomat(3,2) < 0,
			imgtrafd = [imgtrafd; ajusteV];
		end
	end

end