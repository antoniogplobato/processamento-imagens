%Antonio Gonzalez Pastana Lobato
%Breno Serrano de Araujo
%
%First Homework of Digitales Video
%
%imoffset Function
%
%This function adds an offset to each pixel of the input image and then
%checks and corrects the pixel values which are out of the appropriate
%value range.

function [ img_corrected ] = imoffset(img,offset)
    img = double(img);
    img = img ./ (2^16 - 1);
    %This first part of the code maps the values between 0 and 65535 of the
    %image into the interval of 0 and 1
    
    img_corrected = img + offset;
    img_corrected(img_corrected > 1) = 1;
    img_corrected(img_corrected < 0) = 0;
    %In this part we add the offset to each pixel and then make sure that
    %all pixel values are still in the range [0,1]
    
    img_corrected = img_corrected .* (2^16 - 1);
    img_corrected = uint16(img_corrected);
    %Here the values are scaled and converted to int16 type
end