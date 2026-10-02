img = imread('Lichtenstein_img_processing_test.png');  
if size(img, 3) == 3
    img = rgb2gray(img);
end
img=double(img)
figure(1);
imshow(uint8(img));
title('Original Grayscale Image');
F = fft2(double(img));        
F_shift = fftshift(F);         
figure(2);
imagesc(log(1+abs(F_shift))); title('FFT of Image');
[M, N] = size(img);
[u, v] = meshgrid(1:N, 1:M);
D0 = 50;
D1=7;
u0 = N/2;
v0 = M/2;
D = sqrt((u-u0).^2 + (v-v0).^2);
LPF = double(D <= D0);
HPF = double(D > D1);
LPF1=(LPF.*F_shift);
HPF1=(HPF.*F_shift);
figure(3); imagesc(log(1 + abs(LPF1))); title('Low-pass Filter');
figure(4); imagesc(log(1 + abs(HPF1))); title('High-pass Filter');
F_LPF_ishift = ifftshift(LPF1);
F_HPF_ishift = ifftshift(HPF1);
img_LPF = abs(ifft2(F_LPF_ishift));
img_HPF = abs(ifft2(F_HPF_ishift));
figure(5); imshow(uint8(img_LPF)); title('Low-pass Filtered Image');
figure(6); imshow(uint8(img_HPF)); title('High-pass Filtered Image');
F_mag = abs(F_shift);
LPF_mag=abs(LPF1);
HPF_mag=abs(HPF1);
F_vec = F_mag(:);
F_vec2 = LPF_mag(:);
F_vec3 = HPF_mag(:);
figure(7);
histogram(F_vec,0:255);  
title('Histogram of Original Image');

figure(8);
histogram(F_vec2, 0:255); 
title('Histogram of Low-pass Filtered Image');

figure(9);
histogram(F_vec3, 0:255);  
title('Histogram of High-pass Filtered Image');



