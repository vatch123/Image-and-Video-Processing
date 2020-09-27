% Function to calculate the log transformation
function [log_transformed] = log_transformation(magn, scale)
    % magn: The magnitude of image whose log transform is to be calculated
    % scale: Scaling Factor
    
    log_transformed = log10(1 + magn) * scale;
    
end

