function [kImage] = CreateKColourImage(clusters,means)
% CREATEKCOLOURIMAGE creates a k-colour image for an image that has had its
% pixels divided into k clusters. All pixels in a given cluster will be
% recoloured using the mean colour values for that cluster.
%
% Inputs: clusters = 2D array of dimensions equivalent to the image, with a
%                    corresponding cluster number for each pixel.
%         means = 3D array of k x 1 x 3 size that stores the RGB values
%                 of each pixel specified in points
%
%
% Output: kImage = 3D image array of uint8 values, storing the RGB values
%                  of the recoloured image.
%
% Author: Di Kun Ong

% record the number of clusters, and number of rows + columns in the image
k = size(means,1);
rows = size(clusters,1);
cols = size(clusters,2);

% preallocate the kImage array for speed
% it will equal the size of the image
kImage = zeros(rows,cols,3);

% for each cluster
for i = 1:k
    
    % find the index locations of the current cluster's pixels in the array
    % use ind2sub to convert the locations to row and column coordinates
    % algorithm retrieved from https://www.mathworks.com/matlabcentral/
    % answers/789-using-find-in-a-3d-matrix-in-matlab#answer_1138
    locations = find(clusters == i);
    [clusterRows,clusterCols] = ind2sub([rows,cols],locations);
    
    % for each pixel in the current cluster
    for j = 1:length(locations)
        
        % for each colour (r, g, b)
        for m = 1:3
            % set the location in the kImage array to the corresponding
            % value stored in the means array
            kImage(clusterRows(j),clusterCols(j),m) = means(i,1,m);
        end
        
    end
    
end

% convert kImage from a double to a uint8 data type
% this also rounds the means data at the same time
kImage = uint8(kImage);

end