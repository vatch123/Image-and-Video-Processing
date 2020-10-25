% The function removes noise using median filter
function [out] = median_filter(img, filter_size)
% img: Input image on which noise is to be added
% filter_size: The size of the median filter
% out: Output image

[row, col] = size(img);
out = img;

for i = 1+floor(filter_size/2):row - floor(filter_size/2)
    for j = 1+floor(filter_size/2):col - floor(filter_size/2)
        x_start = i - floor(filter_size/2);
        y_start = j - floor(filter_size/2);
        
        x_end = i + floor(filter_size/2);
        y_end = j + floor(filter_size/2);
        
        % Replacing with the median value
        img_section = img(x_start:x_end, y_start:y_end);
        out(i,j) = median(img_section, 'all');
    end
end

end

