% Thresholding after nonmax supression
function [output] = thresholding(img, thresh1)
    % img: The input image
    % thresh1: The higher threshold
    
    img(img>thresh1) = 255;
    img(img<thresh1) = 0;
    output = img;    
end

