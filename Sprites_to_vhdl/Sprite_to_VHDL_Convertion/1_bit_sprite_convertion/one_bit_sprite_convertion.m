%This code converts each pixel from the sprite into a 1 bit representation,
%where '0' represents white and '1' represents color.

clc
clear all
close all
%Imports the image
I = imread('spr_crate_22.png');	
imshow(I);
		
%Extract RED, GREEN and BLUE components from each pixel and store them 
%into 3 different matrices.
R = I(:,:,1);			
G = I(:,:,2);
B = I(:,:,3);

%Creat a general matrix that compares the values from the R,G,B matrix
%and give it's corresponding output in decimal value.
COLOR = (size(R));
for ii = 1: numel(R) %Run the loop for the entire COLOR matrix    
    if (R(ii)>240 && B(ii)>240 && G(ii)>240)%white
       COLOR(ii) = 0;
    else                                    %any other color
       COLOR(ii) = 1;
    end
end
        
%Converts each decimal value into it's one bit representation
COLOR_Bin = dec2bin(COLOR,1);
%The default output is given in the order of the columns,meaning that the
%first outputs are the values of the first column. All programs for this
%project is made with the idea that the output is in order of rows. The
%respape function can solve this problem, as long as the desired output 
%is a N-by-N matrix 
COLOR_Bin = reshape(COLOR_Bin,[22,22]);

%Exports the Color_Bin matrix into a text file called myFile
dlmwrite('myFile.txt' ,COLOR_Bin,'')

