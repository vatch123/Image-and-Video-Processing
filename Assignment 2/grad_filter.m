% Returns the Sobel gradient kernel
function [grad_filter] = grad_filter(x_y)
    % dir: the direction in which gradient is to be calculated
    
    % Assuming the direction is X
    grad_filter = [-1,0,1;-2,0,2;-1,0,1];
    if (x_y=='Y')
        grad_filter = grad_filter';
    end
        
end

