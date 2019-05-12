function [points] = SelectKRandomPoints(image,k)
% SELECTKRANDOMPOINTS generates a list of k randomly selected pixels from
% an image.
%
% Inputs: image = 3D image array of RGB values
%         k = number of pixels to randomly select
%
% Output: points = 2D array of k x 2 size that stores the RGB values
%                  of each randomly selected pixel
%
% Author: Di Kun Ong

% record the number of rows and columns in the image being tested
rows = size(image,1);
cols = size(image,2);

% generate a linear index of k random points in the image array
% that is, k random numbers between 1 and the total number of pixels
linearPoints = randperm(rows*cols,k);

% convert the linear index to row and column coordinates
% algorithm idea from Peter Bier's post @608 and post @690 on Piazza
% https://piazza.com/class/jikzhji37g47c6?cid=608
% https://piazza.com/class/jikzhji37g47c6?cid=690
[pointRows,pointCols] = ind2sub([rows,cols],linearPoints);

% assemble the row and column coordinates into the points array
% a transpose is necessary to have rows in the 1st column, and cols in the
% 2nd column
points = ([pointRows;pointCols]');

end