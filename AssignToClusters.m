function [clusters] = AssignToClusters_UPDATED(image,means)
% ASSIGNTOCLUSTERS assigns each point in the image to a cluster, based on
% which mean that point is closest to.
%
% Inputs: image = 3D image array of RGB values
%         means = 3D array of k x 1 x 3 size that stores the RGB values
%                 of each pixel specified in points
%
% Output: clusters = 2D array of dimensions equivalent to the image, with a
%                    corresponding cluster number for each pixel.
%
% Author: Di Kun Ong

% record the number of means being tested (k)
numOfMeans = size(means,1);
% and the number of rows and columns in the image being tested
rows = size(image,1);
cols = size(image,2);

% preallocate the sqDist3D array for speed
% it will equal the size of the image, with 3 dimensions (r,g,b)
sqDist3D = zeros(rows,cols,numOfMeans);

% make the image and the means arrays equal in dimensions
% repelem and repmat functions retrieved from
% https://au.mathworks.com/help/matlab/matrices-and-arrays.html
% repeat each row of the image k times
vectorisedImage = repelem(image,numOfMeans,1);
% repeat the entire means array so that there is a set for every pixel
vectorisedMeans = repmat(means,rows,cols);

% calculate the squared distance between all points
sqDist = sum((vectorisedImage - vectorisedMeans).^2,3);

% for each mean (which is currently in its own row)
% take each pixel's squared distances (the 1st, 2nd ... kth row) and save
% them in their own 3D layer of an array
for i = 1:numOfMeans
    sqDist3D(:,:,i) = sqDist(i:numOfMeans:end,:);
end

% find the INDEX OF THE minimum squared distances in our 3D array
% that is, pick the lowest 3D value for each pixel (row and column)
% DISCARD THE VALUES AND TAKE ONLY THE 3D INDEX VALUES
% THIS TAKES THE FIRST OCCURRENCE AUTOMATICALLY
[~,clusters] = min(sqDist3D,[],3);

end