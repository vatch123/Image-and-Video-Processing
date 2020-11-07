% Function to convolve an image with a filter. This is done assuming that
% the filter size is odd.
function [oimg] = convolve(img, filter)
    % img: input image
    % filter: filter for convolution
    [frow, fcol] = size(filter);
    [irow, icol] = size(img);
    
    % The dimensions of the final image
    oimg = zeros(irow - frow + 1, icol - fcol + 1);
    for i=1 + floor(frow/2) : irow - floor(frow/2)
        for j=1 + floor(fcol/2) : icol - floor(fcol/2)
            
            % Calculating the image section on which the filter will be
            % multiplied
            x_start = i - floor(frow/2);
            y_start = j - floor(fcol/2);
            
            x_end = i + floor(frow/2);
            y_end = j + floor(fcol/2);
            
            img_section = img(x_start:x_end, y_start:y_end);
            oimg(i - floor(frow/2),j - floor(fcol/2)) = sum(sum(img_section.*filter));
        end
    end
end

