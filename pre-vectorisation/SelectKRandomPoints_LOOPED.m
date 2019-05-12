function [points] = SelectKRandomPoints_LOOPED(image,k)
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%    THIS IS THE ORIGINAL UNVECTORISED VERSION - DO NOT USE OR SUBMIT     %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% record the number of rows and columns in the image being tested
rows = size(image,1);
cols = size(image,2);

% preallocate points array for speed - it will be k x 2 in size
points = zeros(k,2);

% while our counter is less than the total number of points we want
i = 1;

while i <= k
    % generate a random point, no bigger than the size of our image
    randPoint(1,1) = randi(rows);
    randPoint(1,2) = randi(cols);
    
    % check if this random point already exists in our list of points
    % ismember function retrieved from
    % https://www.mathworks.com/help/matlab/ref/ismember.html
    if ismember(randPoint,points,'rows') == true
        % if it does, don't iterate and try again
        continue
    else
        % if it doesn't, add it to the points array
        % and move on to the next point
        points(i,:) = randPoint;
        i = i + 1;
    end
end

end