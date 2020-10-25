% The function adds salt and pepper noise to input image
function [out] = salt_and_pepper(img, level)
% img: Input image on which noise is to be added
% level: The level of noise
%
% out: Output image

[row, col] = size(img);
noise_function = randi(255, row, col);

out = img;

% Adding salt and pepper noise
out(noise_function<=level) = 0;
out(noise_function>=255-level) = 255;

end

