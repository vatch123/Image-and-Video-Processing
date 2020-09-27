%NAME: Vatsalya Chaubey
%INST: IIT, Bhubaneswar
%DATE: 19.09.2020
%CATEGORY: Btech
%BRANCH: Electronics and Communication
%Roll Number: 17EC01044

%% Image and Video Processing Assignment - 2

clc;
clear all;
close all;

%% Question 1: The Maar Edge Detector

% I will first create the functions which are needed for implementation in
% other parts of the code. Finally, the entire code will be written
% together to detect the edges.

%% Gaussian Blur Matrix
% <include>gaussian_blur.m</include>

%% Laplacian of Gaussian Matrix
% <include>LOG_filter.m</include>

%% Convolution of Matrices
% <include>convolve.m</include>

%% Zero Crossing Detector
% <include>zero_crossing.m</include>

%% Maar Edge Detector

% Read the input image as a double
orig_img = imread('cameraman.tif');
img = double(orig_img);

% The std deviation of the LOG filter
std_dev = 0.9;
filter = LOG_filter(std_dev);

% We need to pad the image with zeros such that after convolution the size
% of the image is not reduced.
pad = size(filter,1) - 1;
padded_img = padding(img, pad, pad, 0);

% Convolve with the filter
out = convolve(padded_img, filter);

% To detect the edges we need to detect the zero crossings
edges0 = zero_crossing(out, 0);
edges4 = zero_crossing(out, 4);
edges6 = zero_crossing(out, 6);
edges10 = zero_crossing(out, 10);

figure('Name', 'Maar Edge Detector');
subplot(131)
imshow(orig_img);
title('Original Image');

subplot(132)
imshow(out);
title('Convolution with LOG filter (Std dev = 0.9)');

subplot(133)
imshow(edges0);
title('Threshold = 0');

figure('Name','Edges for different thresholds');
subplot(131)
imshow(edges4);
title('Threshold = 4');

subplot(132)
imshow(edges6);
title('Threshold = 6');

subplot(133)
imshow(edges10);
title('Threshold = 10');

% Repeating the same set with different std dev

% The std deviation of the LOG filter
std_dev = 2;
filter = LOG_filter(std_dev);

% We need to pad the image with zeros such that after convolution the size
% of the image is not reduced.
pad = size(filter,1) - 1;
padded_img = padding(img, pad, pad, 0);

% Convolve with the filter
out = convolve(padded_img, filter);

% To detect the edges we need to detect the zero crossings
edges0 = zero_crossing(out, 0);
edges4 = zero_crossing(out, 4);
edges6 = zero_crossing(out, 6);
edges10 = zero_crossing(out, 10);

figure('Name', 'Maar Edge Detector');
subplot(131)
imshow(orig_img);
title('Original Image');

subplot(132)
imshow(out);
title('Convolution with LOG filter (Std dev = 2)');

subplot(133)
imshow(edges0);
title('Threshold = 0');

figure('Name','Edges for different thresholds');
subplot(131)
imshow(edges4);
title('Threshold = 4');

subplot(132)
imshow(edges6);
title('Threshold = 6');

subplot(133)
imshow(edges10);
title('Threshold = 10');


%% Question 2: Canny Edge Detection

% Creating other needed functions

%% Gradient of an image
% <include>grad_filter.m</include>

%% Nonmax supression
% <include>nonmax_supression.m</include>

%% Thresholding
% <include>thresholding.m</include>

%% Canny Edge Detector
% <include>Canny_edge.m</include>

%% Canny Edge Results
% Read the input image
% Read the input image as a double
orig_img = imread('cameraman.tif');
img = double(orig_img);

output4 = Canny_edge(img, 0.4, 200);
output30 = Canny_edge(img, 3, 20);

figure('Name', 'Canny Edge Detector');
subplot(131)
imshow(orig_img);
title('Original Image');

subplot(132)
imshow(output4);
title('Threshold=200, Std dev=0.4');

subplot(133)
imshow(output30);
title('Threshold=20, Std dev=3');


%% Question 3: Phase only reconstruction

% Here, again we will write the dft and idft functions 

%% Discrete Fourier Transform
% <include>dft2D.m</include>

%% Log Transformation
% <include>log_transformation.m</include>

%% Phase only reconstruction
% Read the input image
% Read the input image as a double
orig_img = imread('cameraman.tif');
img = double(orig_img)/255;

fourier = dft2D(img);

magn = abs(fourier);
phase = atan2(imag(fourier), real(fourier));
phase_res = exp(1i * phase);

% Log transformed output
log_transformed = log_transformation(magn, 0.2);

% Original image reconstruction
orig = idft2D(fourier);

% Phase only reconstruction
phase_reconstruct = mat2gray(abs(idft2D(phase_res)))*30;

figure('Name', 'Fourier');
subplot(131)
imshow(orig_img);
title('Original Image');

subplot(132)
imshow(magn);
title('Magnitude Response');

subplot(133)
imshow(log_transformed);
title('Log Transformed');

figure('Name', 'Reconstruction');
subplot(131)
imshow(phase);
title('Phase Response');

subplot(132)
imshow(abs(orig));
title('Original Image Reconstruction');

subplot(133)
imshow(phase_reconstruct);
title('Phase only Image Reconstruction');

%% Conclusion
% Through this experiment it became clear that both Maar and Canny edge
% detectors are good and can be used for certain applications. It is
% evident that the Canny edge detector is better as because we get finer
% edges and only the edges which are of higher importance. Furthermore, we
% also implemented the 2D DFT and 2D IDFT to find the magnitude and phase
% spectrum of an image. We then used the phase spectrum to reconstruct the
% original image. It is quite surprising that the phase reconstruction is
% also able to detect edges, as the edge portions of an image get
% highlighted but clearly it is not a good method for edge detection.




