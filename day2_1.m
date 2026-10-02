img = imread('Lichtenstein_img_processing_test.png');  
img=double(img)
figure(1);
imshow(uint8(img));
title('Original Grayscale Image');
kernel1 = ones(3,3)/9;
kernel2 = [-1 -1 -1;
           -1  8 -1;
           -1 -1 -1];
kernel3 = [0 -1 0;
    -1 5 -1;
    0 -1 0];
out1 = convn(img, kernel1, 'full');
out2 = convn(img, kernel2, 'full');
out3= convn(img, kernel3, 'full');
figure(2);
imshow(uint8(out1));
title("Smoothing")
figure(3);
imshow(uint8(out2));
title("Edge Detection")
figure(4);
imshow(uint8(out3));
title("Sharpening")
