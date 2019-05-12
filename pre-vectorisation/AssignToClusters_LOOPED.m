    function [clusters] = AssignToClusters_LOOPED(image,means)
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%    THIS IS THE ORIGINAL UNVECTORISED VERSION - DO NOT USE OR SUBMIT     %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% these variables represent: the number of means we're testing
numOfMeans = size(means,1);
% and the number of rows and columns in the image being tested
rows = size(image,1);
cols = size(image,2);

% preallocate the clusters array for speed
% it will equal the size of the original image
clusters = zeros(rows,cols);

% for each row and column of the image
for i = 1:rows
    for j = 1:cols
        
        % manipulate the current pixel's RGB values from a 1 x 1 x 3 array
        % into a k x 1 x 3 array - repeat rows as many times as there are
        % clusters. Then calculate the squared distance between the pixel
        % and each mean
        currentPixel = repmat(image(i,j,:),[numOfMeans,1,1]);
        sqDist = sum((currentPixel - means).^2,3);
        
        % find the lowest distance out of the calculated set
        % and find its position(s) within the sqDist array
        lowestDist = min(sqDist);
        lowestPos = find(sqDist == lowestDist);
        
        % set the cluster to the first value in the test array
        % this is done because should the minimum appear more than once
        % (i.e. the lowestPos array has multiple values), we want to pick the
        % lowest numbered cluster
        clusters(i,j) = lowestPos(1);
        
    end
end

end