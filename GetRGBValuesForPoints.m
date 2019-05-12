function [colours] = GetRGBValuesForPoints(image,points)
% GETRGBVALUESFORPOINTS returns the RGB colour values for a list of
% specified points from an image.
%
% Inputs: image = 3D image array of RGB values
%         points = 2D array of k x 2 size that stores which pixels to
%                  extract colour values for
%
% Output: colours = 3D array of k x 1 x 3 size that stores the RGB values
%                   of each pixel specified in points
%
% Author: Di Kun Ong

% preallocate the colours array for speed - it will be k x 1 x 3 in size
colours = zeros(size(points,1),1,3);

% for each row in the points array,
for i = 1:size(points,1)
    
    % for each colour (r, g, b)
    for j = 1:3
        % set the row of the colour array to the value to the colour at the
        % location in the image
        colours(i,1,j) = image(points(i,1),points(i,2),j);
    end
    
end

end