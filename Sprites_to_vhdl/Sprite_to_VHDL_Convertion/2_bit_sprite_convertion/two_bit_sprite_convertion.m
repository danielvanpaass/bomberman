%This code converts each pixel from the sprite into a 2 bit representation,
%The table below shows the 2 bit representation for the colors that were
%used
%         Color     2_Bit
%         White     00
%  Yellow/Green     01
%         Red/Blue  10
%         Black     11
clc
clear all
close all
I = imread('spr_win.png');	
imshow(I);
		
%Extract RED, GREEN and BLUE components from the image
R = I(:,:,1);			
G = I(:,:,2);
B = I(:,:,3);

%The idea was to simply to make a COLOR matrix with 0,1,2,3 in decimal
%notation and then convert it into 2 bit notation just like the one_bit
%version, but the reshape function would not work with that methode. Thus
%the new methode was to make two one bit representation and then shift one
%to the left to make a 2_bit representation.

 % 'X0' or 'X1'
BinBR = (size(B));
for ii = 1: numel(B)   
    if B(ii)>240     %blue or white   
       BinBR(ii) = 0;
    elseif   (R(ii)>240 && G(ii)<240) %To check for red and not yellow
       BinBR(ii) = 0;
    else
       BinBR(ii) = 1;   %yellow,green,black
    end
end
BinBR = reshape(BinBR,[22,22]);

%'0X' or '1X'
BinG = (size(G));
for ii = 1: numel(G)    
    if G(ii)>240
       BinG(ii) = 0; %green,yellow,white
    else
       BinG(ii) = 1;% blue,red,black
    end
end
BinG = reshape(BinG,[22,22]);
        
    
BinG = bitshift(BinG, 1); % 1 << G (shift by 1 bits)
COLOR = BinBR+BinG;      % B + 1 << G 

COLOR=COLOR.'; %The matrix had to be transpose because it would read column 
%by column and not row by row
COLOR_Bin = dec2bin(COLOR,2);

%The ouput is stored in a text file called myFile,making it easier to check
%and copy
dlmwrite('myFile.txt' ,COLOR_Bin,'')

