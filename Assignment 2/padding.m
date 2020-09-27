% Function to pad the image boundaries with zeros such that image shape
% doesn't change after convolution
function [padded_img] = padding(img, hor, vert, value)

    % img: Input image
    % hor: Number of rows to be padded
    % vert: Number of columns to be padded
    % value: The value with which padding is done

    [~, col] = size(img);
    hor_top = ceil(hor / 2);
    hor_bottom = floor(hor / 2);

    padded_img = [ones(hor_top, col)*value; img; ones(hor_bottom, col)*value];

    [row, ~] = size(padded_img);
    vert_frt = ceil(vert/2);
    vert_back = floor(vert/2);

    padded_img = [ones(row, vert_frt)*value padded_img ones(row, vert_back)*value];

end

