function [means] = UpdateMeans_LOOPED(image,k,clusters)
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%    THIS IS THE ORIGINAL UNVECTORISED VERSION - DO NOT USE OR SUBMIT     %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% record the number of rows and columns in the image being tested
rows = size(image,1);
cols = size(image,2);

% preallocate means array for speed - it will be k x 1 x 3 in size
means = zeros(k,1,3);

% for each cluster
for i = 1:k
    
    % find the index locations of the current cluster's pixels in the array
    % use ind2sub to convert the locations to row and column coordinates
    locations = find(clusters == i);
    [clusterRows,clusterCols] = ind2sub([rows,cols],locations);
    
    % record the total number of pixels in that cluster
    numOfValues = length(locations);
    
    % preallocate values array for speed
    % we know it will be 1 x (number of pixels in that cluster) in size
    values = zeros(1,numOfValues);
    
    % for each colour (r, g, b)
    for j = 1:3
        
        % for each pixel in the current cluster
        % set values to that pixel's R/G/B value in the image
        % note: I have used m as a counter variable, skipping k and l
        for m = 1:numOfValues
            values(m) = image(clusterRows(m),clusterCols(m),j);
        end
        
        % set the current row of the means array to equal the mean of the
        % values from each pixel in the cluster
        means(i,1,j) = sum(values)/numOfValues;
        
    end
    
end

end