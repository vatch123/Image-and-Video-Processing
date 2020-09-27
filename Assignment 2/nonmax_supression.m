% Performs nonmax supression on an image given its gradient
function [supressed] = nonmax_supression(mag, angle)
    % mag: The magnitude of the image gradient
    % phase: The phase of the image gradient
    
    supressed = zeros(size(mag));
    [row, col] = size(mag);
    for i=2:row-1
        for j=2:col-1
            l = 255;
            m = 255;
            ang = angle(i,j);
            if ((ang<22.5) || (ang>157.5))
                l = mag(i,j-1);
                m = mag(i,j+1);
            elseif ((ang>=22.5) && (ang<67.5))
                l = mag(i-1,j-1);
                m = mag(i+1,j+1);
            elseif ((ang>=67.5) && (ang<112.5))
                l = mag(i-1,j);
                m = mag(i+1,j);
            elseif ((ang>=112.5) && (ang<157.5))
                l = mag(i-1,j+1);
                m = mag(i+1,j-1);
            end
            if (mag(i,j)>l && mag(i,j)>m)
                supressed(i,j) = mag(i,j);
            else
                supressed(i,j) = 0;
            end
        end
    end
    
end

