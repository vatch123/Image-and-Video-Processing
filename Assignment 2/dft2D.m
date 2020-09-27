% The function to calculate the Discrete Fourier Transform of an image
function [fourier2D] = dft2D(img)
    % img: The image for which fourier is to be calculated

    M = size(img,1);
    N = size(img,2);

    % Performing 2D fourier transform as two successive 1D transforms as once
    % over the rows and the other one over the columns

    % First, over rows. Creating a _N_*_N_ weight matrix as we are taking a
    % N-point DFT
    n = -(N-1)/2:1:(N-1)/2;
    k = -(N-1)/2:1:(N-1)/2;
    weight_row = n' * k;
    weight_row = (-2*pi*1i/N) .* weight_row;
    weight_row = exp(weight_row);

    % Secondly, now taking M-point DFT across the columns
    m = -(M-1)/2:1:(M-1)/2;
    k = -(M-1)/2:1:(M-1)/2;
    weight_col = m' * k;
    weight_col = (-2*pi*1i/M) .* weight_col;
    weight_col = exp(weight_col);

    % Taking M-point DFT of the previous N-point DFT
    fourier2D = weight_row * (img * weight_col);
    
end

