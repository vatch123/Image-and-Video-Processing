% Function to calculate the zero crossings based on the number of edges and
% the threshold
function [oimg] = zero_crossing(img, thresh)
    % img: input image
    
    oimg = zeros(size(img));
    [row, col] = size(img);
    for i=2:row-1
        for j=2:col-1
            % checking for vertical zero crossings
            count = 0;
            if(img(i-1,j) * img(i+1,j)<0 && abs(img(i-1,j) - img(i+1,j))>thresh)
                count = count + 1;
            end
            
            % checking for horizontal zero crossings
            if(img(i,j-1) * img(i,j+1)<0 && abs(img(i,j-1) - img(i,j+1))>thresh)
                count = count + 1;
            end
            
            % checking for positive diagonal zero crossings
            if(img(i-1,j-1) * img(i+1,j+1)<0 && abs(img(i-1,j-1) - img(i+1,j+1))>thresh)
                count = count + 1;
            end
            
            % checking for negative diagonal zero crossings
            if(img(i-1,j+1) * img(i+1,j-1)<0 && abs(img(i-1,j+1) - img(i+1,j-1))>thresh)
                count = count + 1;
            end
            
            if count>=2
                oimg(i,j) = 255;
            end
            
        end
    end
end

