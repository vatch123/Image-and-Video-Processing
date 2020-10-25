% Function to perform erosion on a binary image using a structuring element

function [out] = erosion(img, ele)
% img: Grayscale input image
% ele: Structuring element

[row, col] = size(img);
[row_e, col_e] = size(ele);

% Output image is same as the input and then we will perform erosion on it
out = img;

for i = 1 + floor(row_e / 2): row - floor(row_e/2)
    for j = 1 + floor(col_e / 2): col - floor(col_e / 2)
        
        % Calculating the image section on which the erosion will be
        % applied
        x_start = i - floor(row_e/2);
        y_start = j - floor(col_e/2);

        x_end = i + floor(row_e/2);
        y_end = j + floor(col_e/2);
        
        img_section = img(x_start:x_end, y_start:y_end);
        
        % Checking whether the image section and structuring elements are
        % matching
        if sum(sum(img_section.*ele)) == sum(sum(ele))
            out(i,j) = 1;
        else
            out(i,j) = 0;
        end
        
    end
    
end

