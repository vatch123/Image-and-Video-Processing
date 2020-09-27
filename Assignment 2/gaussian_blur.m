% Function to calculate the Gaussian matrix for a given value of standard
% deviation

function [blur] = gaussian_blur(sigma)
    
    % sigma: The std deviation of the gaussian kernel used

    % Find the filter dimension using the 6*sigma rule as the majority of
    % the gaussian is
    filter_dims = ceil(6*sigma);
    
    if mod(filter_dims,2)==0
        filter_dims = filter_dims + 1;
    end

    blur = zeros(filter_dims, filter_dims);
    centre_x = ceil(filter_dims/2);
    centre_y = ceil(filter_dims/2);
    
    for i=1:filter_dims
        for j=1:filter_dims
            x = i - centre_x;
            y = j - centre_y;
            blur(i,j) = exp(-1*(x^2 + y^2)/(2*sigma^2))/(2*pi*sigma^2);
        end
    end
end
