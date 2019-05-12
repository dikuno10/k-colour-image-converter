function [clusters,means] = KMeansRGB(image,seedMeans,maxIterations)
% KMEANSRGB partitions the pixels in an image into k clusters, using the
% k-means algorithm to do so.
% It does this in two steps - assignment (every point is assigned to a
% cluster using AssignToClusters); and update (new means are calculated for
% each cluster using UpdateMeans).
%
% Inputs: image = 3D image array of RGB values
%         seedMeans = 3D array of k x 1 x 3 size that stores the RGB values
%                     of each pixel specified in points
%         maxIterations = the maximum number of times the k-means algorithm
%                         will iterate before stopping.
%
% Outputs: clusters = 2D array of dimensions equivalent to the image, with a
%                     corresponding cluster number for each pixel.
%          means = 3D array of k x 1 x 3 size that stores the RGB values
%                  of each pixel specified in points
%
% Author: Di Kun Ong

% set our means to equal the seedMeans from the input
% k to equal to the total number of clusters
means = seedMeans;
k = size(seedMeans,1);

% set up our while loop counter and condition
i = 0;
imageConverging = true;

% while the image is still converging
while imageConverging == true
    
    % iterate our counter and record our current means before updating
    i = i + 1;
    previousMeans = means;
    
    % run the assignment and update steps using their given functions
    clusters = AssignToClusters(image,means);
    means = UpdateMeans(image,k,clusters);
    
    % if our new means are equal to our previous means, end the loop
    % else if we've reached our max number of iterations, warn the user and
    % end the loop
    if isequal(means,previousMeans) == 1
        imageConverging = false;
    elseif i == maxIterations
        disp('Maximum number of iterations reached before convergence was achieved')
        imageConverging = false;
    end
    
end

end