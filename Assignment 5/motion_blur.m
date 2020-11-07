% The function returns a motion blurred image

function [out] = motion_blur(img, T, a, b)
% img: input image
% T: the duration of exposure
% a: rate of motion in x-direction
% b: rate of motion in y-direction
%
% out: the motion blurred image

[m, n] = size(img);
u = linspace(0,m-1,m)' + 1e-16;
v = linspace(0,n-1,n) + 1e-16;

u = repelem(u, 1, n);
v = repelem(v, m, 1);

cord = a.*u + b.*v';

% The degradation model derived
H_uv = (T.*sin(pi*cord).*exp(-1i*pi*cord))./(pi*cord);

F_uv = fft2(img);

out_fft = F_uv .* H_uv;

out = real(ifft2(out_fft));

out = mat2gray(out);

end

