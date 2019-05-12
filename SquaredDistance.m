function [squaredDistance] = SquaredDistance(point1,point2)
% SQUAREDDISTANCE calculates the square of the distance between two points
% in 3D space.
%
% Inputs: point1 = 3-element array (1 x 3, 3 x 1, or 1 x 1 x 3) containing
%                  the location of the first point
%         point2 = 3-element array (1 x 3, 3 x 1, or 1 x 1 x 3) containing
%                  the location of the second point
%
% Output: squaredDistance = double containing the square of the distance
%                           between point1 and point2 in 3D space
%
% Author: Di Kun Ong

% calculate the squared distance
% if point1 = [A B C], point2 = [X Y Z]
% set squaredDistance to (A - X)^2 + (B - Y)^2 + (C - Z)^2
% this will select the first 3 elements of each array, regardless of its
% dimensions
squaredDistance = (point1(1) - point2(1))^2 + (point1(2) - point2(2))^2 ...
    + (point1(3) - point2(3))^2;

end