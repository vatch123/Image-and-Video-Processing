function [final] = Canny_edge(img, std_dev,thresh)
    % std_dev: The standard deviation of Gaussian kernel
    % thresh1: Higher threshold for dual thresholding
    % thresh2: Lower threshold for dual thresholding

    filter = gaussian_blur(std_dev);

    % We need to pad the image with zeros such that after convolution the size
    % of the image is not reduced.
    pad = size(filter,1) - 1;
    padded_img = padding(img, pad, pad, 0);

    blurred = convolve(padded_img, filter);

    % Calculating gradients
    g_x = grad_filter('X');
    g_y = grad_filter('Y');

    % Pad the blurred image again
    blurred = padding(blurred,2,2,0);

    G_x = convolve(blurred, g_x);
    G_y = convolve(blurred, g_y);

    G = sqrt(G_x.^2 + G_y.^2);
    theta = atan2(G_y, G_x) * 180/pi;

    % Fixing the negative angles for ease of calculation
    theta(theta<0) = theta(theta<0)+180;

    % Performing Nonmax supression
    supressed = nonmax_supression(G,theta);

    % Performing hystersis thresholding
    final = thresholding(supressed, thresh);
    
end

