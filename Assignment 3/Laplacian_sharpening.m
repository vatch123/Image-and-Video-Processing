% Function which performs image sharpening in frequqncy domain using
% Laplacian Filter

function [out] = Laplacian_sharpening(img)
% img: Grayscale input image

dft = fftshift(fft2(img));
[row, col] = size(img);

center_x = (1 + col) /2;
center_y = (1 + row) /2;

filter = zeros(size(dft));
for i=1:row
    for j=1:col
        filter(i,j) = 1 + 4*pi^2*((j-center_x)^2 + (i-center_y)^2);
    end
end

% This finds the inverse FFT after shifting the spectrum back
out = real(ifft2(ifftshift(filter.*double(dft))));

end

