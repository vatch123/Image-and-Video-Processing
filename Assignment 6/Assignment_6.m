%NAME: Vatsalya Chaubey
%INST: IIT, Bhubaneswar
%DATE: 3.11.2020
%CATEGORY: Btech
%BRANCH: Electronics and Communication
%Roll Number: 17EC01044

%% Image and Video Processing Assignment - 6

clc;
clear all;
close all;

%% Affine Transformation
% Affine transformation are linear matrix operations on an image through
% which an image can be scaled, rotated or sheared. These transformations
% are linear and so does not affect the shapes in a image. It is usually
% represented as:
%
% $$[u, v] = T([x, y])$$
%
% (u,v) -> Transformed Coordinates
%
% (x, y) -> Original Coordinates

%% Code for Affine Transformation
% <include>affine_transformation.m</include>

%% Example: Scaling
% Scaling means to enlarge or compress an image. The transformation matrix
% for scaling is defined as:
%
% $$T = \pmatrix{a & 0 & 0 \cr 0 & b & 0 \cr 0 & 0 & 1}$$
%
% $a$ and $b$ are scaling parameters in $x$ and $y$ direction. If $a$ and
% $b$ are greater than 1 image is enlarged otherwise the image is shrunk.

% Read an image
orig_img = imread('cameraman.tif');
img = double(orig_img);

% Create transformation matrix to enlarge
T = [4, 0, 0; 0, 2, 0; 0, 0, 1];
enlarged = affine_transformation(img, T);

% Create transformation matrix to shrink
T = [0.5, 0, 0; 0, 1, 0; 0, 0, 1];
shrinked = affine_transformation(img, T);

figure('Name', 'Affine Transformation: Scaling');
subplot(131)
imshow(orig_img);
title('Original Image');

subplot(132)
imshow(enlarged);
title('Enlarged image');

subplot(133)
imshow(shrinked);
title('Shrinked image');

%% Example: Rotation
% To rotate an image through a particular angle we need to define the
% transformation matrix in the following manner:
%
% $$ T = \pmatrix{cos(\theta) & sin(\theta) & 0 \cr -sin(\theta)& cos(\theta) 
% & 0 \cr 0 & 0 & 1} $$
%

% Create transformation matrix to rotate through angle theta
theta = 60;
T = [ cosd(theta), sind(theta), 0;
     -sind(theta), cosd(theta), 0;
                 0,          0, 1];
             
rotated = affine_transformation(img, T);


figure('Name', 'Affine Transformation: Rotation');
subplot(121)
imshow(orig_img);
title('Original Image');

subplot(122)
imshow(rotated);
title('Rotated image');


%% Example: Rotation and Scaling
% In this example we will show how can we use succesive transformations

% Create transformation matrix to shrink
T1 = [0.5, 0, 0; 0, 1, 0; 0, 0, 1];
enlarged = affine_transformation(img, T1);

% Now, we will rotate the enlarged image
rot_and_scaled = affine_transformation(enlarged, T);

% We can show that this entire two step process can be represented by just
% one transformation matrix which is the product of the two matrices

T_new = T * T1;
transformed = affine_transformation(img, T_new);

figure('Name', 'Scaling and Rotation');
subplot(131)
imshow(orig_img);
title('Original Image');

subplot(132)
imshow(rot_and_scaled);
title('Scaled and Rotated image');

subplot(133)
imshow(transformed);
title('Scaled and Rotated with new transformtion');

%% Conclusion
% Through this experiment we learnt about affine transformation. These
% operations are linear in nature and act on the coordinates of the pixels
% so they only affect the geometry of the image rather than the image
% quality. Affine transformations are very simple to implement and have
% widespread use in resizing images, comparing rotated images, fixing
% orientations etc. We also noticed that any complex affine transformation
% can be broken down into simpler transformations. One more important point
% to notice is when we enlarge an image through affine transformation we
% need to use some interpolation technique to fill in the gaps between the
% pixels.