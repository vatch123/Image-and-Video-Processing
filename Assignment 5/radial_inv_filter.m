% The function returns a radial inverse filtered image

function [out] = radial_inv_filter(img, T, a, b, D_th)
% img: input image
% T: the duration of exposure
% a: rate of motion in x-direction
% b: rate of motion in y-direction
% D_th: The threshold distance for the Butterworth filter
%
% out: the restored image

[m, n] = size(img);
u = linspace(0,m-1,m)' + 1e-16;
v = linspace(0,n-1,n) + 1e-16;

u = repelem(u, 1, n);
v = repelem(v, m, 1);

cord = a.*u + b.*v';

% The degradation function
H_uv = (T.*sin(pi*cord).*exp(-1i*pi*cord))./(pi*cord);

% The butterworth filter
D = sqrt(u.^2 + v.^2);
D_uv = 1./(1 + (D./D_th).^20);

G_uv = fft2(img);

out_fft = G_uv ./ H_uv;
out_fft = out_fft .* D_uv;

out = real(ifft2(out_fft));

out = mat2gray(out);

end

