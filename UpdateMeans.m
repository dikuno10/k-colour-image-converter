function [means] = UpdateMeans(image,k,clusters)
% UPDATEMEANS calculates the new mean values for each cluster.
%
% Inputs: image = 3D image array of RGB values
%         k = number of clusters
%         clusters = 2D array of dimensions equivalent to the image, with a
%                    corresponding cluster number for each pixel.
%
% Output: means = 3D array of k x 1 x 3 size that stores the RGB values
%                 of each pixel specified in points
%
% Author: Di Kun Ong

% record the number of rows and columns in the image being tested
rows = size(image,1);
cols = size(image,2);

% preallocate means array for speed - it will be k x 1 x 3 in size
means = zeros(k,1,3);

% for each cluster
for i = 1:k
    
    % find the index locations of the current cluster's pixels in the array
    locations = find(clusters == i);
    
    % record the total number of pixels in that cluster
    numOfValues = length(locations);
    
    % for each colour (r, g, b)
    for j = 1:3
        
        % set values array to the pixel's R/G/B value in the image
        % this is done using the linear index - for each third dimension,
        % the index shifts along by rows*cols
        indexOffset = (j - 1) * (rows * cols);
        values = image(locations + indexOffset);
        
        % set the current row of the means array to equal the mean of the
        % values from each pixel in the cluster
        means(i,1,j) = sum(values)/numOfValues;
        
    end
    
end

end