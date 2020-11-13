function [out] = affine_transformation(img,T)
    % This function performs an affine transformation on an image
    % img: Input image
    % T: Tranformation matrix
    
    [row, col] = size(img);
    
    % To calculate the dimension of the output image we can find the
    % maximum and minimum values of the transformed coordinates
    x_min = 0; x_max = 0;
    y_min = 0; y_max= 0;

    for i=1:row
        for j=1:col
            transformed_coords = round(T * [i; j; 1]);
            x_min = min(transformed_coords(1), x_min);
            x_max = max(transformed_coords(1), x_max);
            y_min = min(transformed_coords(2), y_min);
            y_max = max(transformed_coords(2), y_max);
        end
    end  

    out = zeros(x_max-x_min, y_max-y_min);

    % If the minimum value of any coordinate turns out to be zero we need
    % to shift it to bring it to 1
    x_shift = (1 + abs(x_min))*(x_min<0);
    y_shift = (1 + abs(y_min))*(y_min<0);

    for i=1:row
        for j=1:col
            transformed_coords = round(T * [i; j; 1]);
            out(transformed_coords(1) + x_shift, transformed_coords(2) + y_shift) = img(i, j);
        end
    end

    out = mat2gray(out);
end

