# Median_Filter
Designing Median Filter to filter 430x554 picture with 3x3 kernel 
The median filter is a non-linear digital filtering technique, often used to remove noise from an image or signal. 
Such noise reduction is a typical pre-processing step to improve the results of later processing (for example, edge detection on an image). 
Median filtering is very widely used in digital image processing because, 
under certain conditions, it preserves edges while removing noise (but see the discussion below), also having applications in signal processing.
When filtering is done, I run a small code in MatLab to visualize the result: 

function [] = hex_to_pic
inImg = (imread('baitap_nhieu.jpg'));

fid = fopen('C:\Users\DELL\Desktop\project\Median_filter\out_pic.txt','r');
img = fscanf(fid,'%x');
fclose(fid);

outImg = reshape(img,[554 430]);

subplot(121);
imshow(inImg);
title('input image');
subplot(122);
imshow(outImg,[]);
title('output image');
