%Third Homework of Digitales Video
%
%dmap Function
%
%This function does the block matching in order to find the
%relative distance between points in 2 images from the same
%scenario, one from the left point of view, the other from the
%right. This distances cointains information about the depth of
%the objects in the picture, which is then translated to a gray
%scaled picture, whose intensities represents the depth

%% dmap: function description
function [imgD] = dmap(imgL, imgR, b, s)
	imgL = double(imgL); 
	imgR = double(imgR); 
	% images are converted to double to increase precision
	[m,n,d] = size(imgL);
	imgD = zeros(m,n);
	distancias = zeros(m,n);

	bloco = zeros(b,b,d);
	blocoBusca = zeros(b,b,d);
	erroM = zeros(b,b,d);

	imgLG = zeros(m+b,n+s,d); 
	imgRG = zeros(m+b,n+b,d); 

	imgLG(b/2:m+b/2-1,s/2:n+s/2-1,:) = imgL(:,:,:); 
	imgRG(b/2:m+b/2-1,b/2:n+b/2-1,:) = imgR(:,:,:);
	% here we create an extended version of the images in order to
	% avoid segmentation faults. We do that in such way, that the
	% pixel which distance we want to calculate, will be centralized 
	% in the block used for the blockmatching

	for i = 1:m,
		for j = 1:n,
			bloco = imgRG(i:i + b-1, j:j + b-1,:);
			% here we determine the block in the right image to be
			% matched with another block in the left one
			erroMinimo = 65535;
			for k = 0:s-b,
				% search within the search space s
				blocoBusca = imgLG(i:i + b-1, j+k:j+k + b-1,:);
				% current block from the left image to be compared with
				% the one from the right
				erroM = bloco - blocoBusca;
				erroM = erroM .* erroM;
				erro = (sum(erroM(:))) / ((d*b*b)^2);
				% here we calculate the mean squared error between the 2
				% blocks and then we check if it is minimum
				if erro <= erroMinimo,
					erroMinimo = erro;
					posicao = k;
				end
			end
			distancias(i,j) = s/2 - posicao;
			imgD(i,j) = distancias(i,j);
			% assign the calculated value for the pixel
		end
	end 
	imgD = abs(imgD); 
	imgD = imgD - max(imgD(:)); 
	imgD = abs(imgD); 
	imgD = imgD(:,:) / max(imgD(:)); 
	imgD = 1-exp(-(3*imgD(:,:))); 
	imgD = imgD .* 65535;
	imgD = uint16(imgD);
	% here we scale the distances for values in the interval 0 until 1
	% and then apply a exponential function
end
