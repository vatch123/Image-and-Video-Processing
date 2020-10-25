% Function which performs image smoothening in frequqncy domain using
% High pass Gaussian Filter

function [out] = high_pass_gaussian(img, sigma)
% img: Grayscale input image

dft = fftshift(fft2(img));
[row, col] = size(img);

center_x = (1 + col) /2;
center_y = (1 + row) /2;

filter = zeros(size(dft));
for i=1:row
    for j=1:col
        filter(i,j) = 1 - exp(-((j-center_x)^2 + (i-center_y)^2)/ (2 * sigma^2));
    end
end

% This finds the inverse FFT after shifting the spectrum back
out = real(ifft2(ifftshift(filter.*double(dft))));

end

