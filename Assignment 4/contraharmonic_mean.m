% The function removes noise using median filter
function [out] = contraharmonic_mean(img, filter_size, Q)
% img: Input image on which noise is to be added
% filter_size: The size of the median filter
% Q: The order of the filter
% out: Output image

[row, col] = size(img);
out = img;

for i = 1+floor(filter_size/2):row - floor(filter_size/2)
    for j = 1+floor(filter_size/2):col - floor(filter_size/2)
        x_start = i - floor(filter_size/2);
        y_start = j - floor(filter_size/2);
        
        x_end = i + floor(filter_size/2);
        y_end = j + floor(filter_size/2);
        
        img_section = img(x_start:x_end, y_start:y_end);
        
        % Finding the contraharmonic mean
        num = sum(sum(img_section.^(Q+1)));
        den = sum(sum(img_section.^(Q)));
        
        out(i,j) = num / den;
    end
end

end

